#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

#include "Vsizif.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "frontend.h"

namespace fs = std::filesystem;

constexpr int Width = 352;
constexpr int Height = 288;
constexpr auto FramePeriod = std::chrono::microseconds(20480);

struct Options {
    fs::path rom;
    fs::path keys;
    fs::path screenshot;
    fs::path dump_ram;
    fs::path trace;
    uint64_t frames = 0;
    uint64_t trace_start = 0;
    uint64_t trace_frames = 1;
    int scale = 2;
    int rom_set = 0;
    bool headless = false;
    bool unlimited = false;
};

static void usage() {
    std::cout << "Sizif-128 simulator\n"
                 "  --rom FILE          16/32/64 KiB ROM (default: repository ROM)\n"
                 "  --rom-set 0|1       JP1 selection in a 64 KiB image\n"
                 "  --headless          run without a window (default: 200 frames)\n"
                 "  --frames N          stop after N frames (0: unlimited in GUI)\n"
                 "  --unlimited         run as fast as possible\n"
                 "  --scale N           initial window scale, 1..6\n"
                 "  --keys FILE         keyboard script: frame KEY down|up\n"
                 "  --screenshot FILE   save last frame as binary PPM\n"
                 "  --dump-ram FILE     save all eight 16 KiB RAM banks\n"
                 "  --trace FILE        enable VCD for a bounded frame range\n"
                 "  --trace-start N     first traced frame (default 0)\n"
                 "  --trace-frames N    number of traced frames (default 1)\n"
                 "F2 reset, F3/Pause pause, F10 quit, F11 fullscreen.\n";
}

static uint64_t number(const std::string& text) {
    if (text.empty() || text[0] == '-') {
        throw std::runtime_error("Invalid number: " + text);
    }

    size_t used = 0;
    const auto value = std::stoull(text, &used, 10);
    if (used != text.size()) {
        throw std::runtime_error("Invalid number: " + text);
    }
    return value;
}

static Options arguments(int argc, char** argv) {
    Options options;
    for (int n = 1; n < argc; ++n) {
        const std::string arg = argv[n];
        const auto value = [&]() -> std::string {
            if (++n == argc) {
                throw std::runtime_error("Missing value for " + arg);
            }
            return argv[n];
        };

        if (arg == "--rom") {
            options.rom = value();
        } else if (arg == "--rom-set") {
            const auto set = number(value());
            if (set > 1) {
                throw std::runtime_error("--rom-set must be 0 or 1");
            }
            options.rom_set = static_cast<int>(set);
        } else if (arg == "--headless") {
            options.headless = true;
        } else if (arg == "--unlimited") {
            options.unlimited = true;
        } else if (arg == "--frames") {
            options.frames = number(value());
        } else if (arg == "--scale") {
            const auto scale = number(value());
            if (scale < 1 || scale > 6) {
                throw std::runtime_error("--scale must be 1..6");
            }
            options.scale = static_cast<int>(scale);
        } else if (arg == "--keys") {
            options.keys = value();
        } else if (arg == "--screenshot") {
            options.screenshot = value();
        } else if (arg == "--dump-ram") {
            options.dump_ram = value();
        } else if (arg == "--trace") {
            options.trace = value();
        } else if (arg == "--trace-start") {
            options.trace_start = number(value());
        } else if (arg == "--trace-frames") {
            options.trace_frames = number(value());
        } else {
            throw std::runtime_error("Unknown option: " + arg);
        }
    }

    if (options.headless && !options.frames) {
        options.frames = 200;
    }
    if (!options.trace.empty() && !options.trace_frames) {
        throw std::runtime_error("--trace-frames must be positive");
    }
    if (options.rom.empty()) {
        const fs::path candidates[] = {
            "../rom/sizif-128.rom",
            "rom/sizif-128.rom",
            fs::absolute(argv[0]).parent_path() / "../../rom/sizif-128.rom",
        };
        for (const auto& candidate : candidates) {
            if (fs::is_regular_file(candidate)) {
                options.rom = candidate;
                break;
            }
        }
        if (options.rom.empty()) {
            throw std::runtime_error("ROM not found; specify --rom FILE");
        }
    }
    return options;
}

struct KeyEvent {
    uint64_t frame;
    std::string key;
    bool down;
};

static std::vector<KeyEvent> read_keys(const fs::path& path) {
    std::vector<KeyEvent> events;
    if (path.empty()) {
        return events;
    }

    std::ifstream input(path);
    if (!input) {
        throw std::runtime_error("Cannot open key script: " + path.string());
    }

    std::string line;
    unsigned line_no = 0;
    while (std::getline(input, line)) {
        ++line_no;
        line = line.substr(0, line.find('#'));
        std::istringstream words(line);
        std::string frame, key, action, extra;
        if (!(words >> frame)) {
            continue;
        }
        if (!(words >> key >> action) || words >> extra || (action != "down" && action != "up")) {
            throw std::runtime_error("Invalid key script line " + std::to_string(line_no));
        }
        events.push_back({number(frame), key, action == "down"});
    }

    std::stable_sort(events.begin(), events.end(), [](const auto& a, const auto& b) { return a.frame < b.frame; });
    return events;
}

static void make_parent(const fs::path& path) {
    if (path.has_parent_path()) {
        fs::create_directories(path.parent_path());
    }
}

class Machine {
public:
    VerilatedContext& context;
    Vsizif model{&context};
    std::vector<uint32_t> pixels = std::vector<uint32_t>(Width * Height, 0xff000000);
    std::unique_ptr<VerilatedVcdC> trace;
    bool tracing = false;

    Machine(VerilatedContext& simulation_context, bool trace_enabled) : context(simulation_context) {
        model.clk14 = 0;
        model.reset_n = 0;
        model.keys = (uint64_t{1} << 40) - 1;
        model.va = 0;
        model.vd = 0xff;
        model.cpu_in = 0xff;
        rom.fill(0xff);
        if (trace_enabled) {
            context.traceEverOn(true);
            trace = std::make_unique<VerilatedVcdC>();
            model.trace(trace.get(), 3);
        }
        model.eval();
        settle_buses();
    }

    ~Machine() {
        model.final();
        if (trace) {
            trace->close();
        }
    }

    bool tick(bool capture = true) {
        const unsigned x = model.video_x;
        const unsigned y = model.video_y;
        const bool pixel = model.pixel_strobe;
        half_tick(1);
        if (pixel && capture) {
            // Wrap the ULA raster to put 48 pixels of border on each side.
            const unsigned px = (x + 40) % 448;
            const unsigned py = (y + 48) % 320;
            if (px < Width && py < Height) {
                const unsigned rgb = model.rgbi;
                const uint32_t level = (rgb & 8) ? 255 : 205;
                pixels[py * Width + px] =
                    0xff000000 | ((rgb & 4) ? level << 16 : 0) | ((rgb & 2) ? level << 8 : 0) | ((rgb & 1) ? level : 0);
            }
        }
        half_tick(0);
        return pixel && x == 447 && y == 319;
    }

    void load_rom(const fs::path& path, int set) {
        std::ifstream input(path, std::ios::binary);
        if (!input) {
            throw std::runtime_error("Cannot open ROM: " + path.string());
        }

        std::vector<uint8_t> bytes((std::istreambuf_iterator<char>(input)), {});
        if (bytes.size() != 16384 && bytes.size() != 32768 && bytes.size() != 65536) {
            throw std::runtime_error("ROM must contain exactly 16, 32 or 64 KiB");
        }
        if (set && bytes.size() != 65536) {
            throw std::runtime_error("--rom-set 1 requires a 64 KiB ROM image");
        }
        if (bytes.size() == 16384) {
            const auto copy = bytes;
            bytes.insert(bytes.end(), copy.begin(), copy.end());
        }
        std::copy(bytes.begin(), bytes.end(), rom.begin());
        rom_set = set;
        std::cout << "ROM: " << fs::absolute(path).lexically_normal().string() << " (" << bytes.size() / 1024
                  << " KiB mapped, set " << set << ")\n";
    }

    void start() {
        settle_buses();
        while (!tick(false)) {
        }

        model.reset_n = 1;
        model.eval();
        settle_buses();
    }

    void reset() {
        model.reset_n = 0;
        model.eval();
        settle_buses();
        for (unsigned n = 0; n < 64; ++n) {
            tick();
        }

        model.reset_n = 1;
        model.eval();
        settle_buses();
    }

    void set_keys(const uint8_t rows[8]) {
        uint64_t bits = 0;
        for (unsigned row = 0; row < 8; ++row) {
            bits |= uint64_t(rows[row] & 31) << (row * 5);
        }
        if (model.keys != bits) {
            model.keys = bits;
            model.eval();
            settle_buses();
        }
    }

    void screenshot(const fs::path& path) const {
        make_parent(path);
        std::ofstream file(path, std::ios::binary);
        file << "P6\n" << Width << ' ' << Height << "\n255\n";
        for (const auto rgb : pixels) {
            const char color[] = {char(rgb >> 16), char(rgb >> 8), char(rgb)};
            file.write(color, 3);
        }
        if (!file) {
            throw std::runtime_error("Cannot write screenshot: " + path.string());
        }
    }

    void dump_ram(const fs::path& path) {
        make_parent(path);
        std::ofstream file(path, std::ios::binary);
        file.write(reinterpret_cast<const char*>(ram.data()), ram.size());
        if (!file) {
            throw std::runtime_error("Cannot write RAM dump: " + path.string());
        }
    }

private:
    std::array<uint8_t, 131072> ram{};
    std::array<uint8_t, 65536> rom{};
    unsigned rom_set = 0;
    uint64_t phase = 0;

    void settle_buses(bool clock_changed = false) {
        // Strong drivers on VA/VD override the CPU bus through R8..R30.
        // Use the generated per-bit enables, without reproducing ULA logic.
        for (unsigned iteration = 0; iteration < 8; ++iteration) {
            const uint32_t va = (model.va__out & model.va__en) | ((model.addr & 0x3fff) & ~model.va__en);
            const bool rom_read = !model.n_romcs && !model.rd_n;
            const uint8_t rom_data = rom[(rom_set << 15) | (model.ra14 << 14) | (model.addr & 0x3fff)];
            const uint8_t cpu_drive = model.cpu_data_drive ? model.cpu_out : (rom_read ? rom_data : 0xff);
            const uint8_t video_drive = !model.n_vrd ? ram[va] : cpu_drive;
            const uint8_t vd = (model.vd__out & model.vd__en) | (video_drive & ~model.vd__en);

            // The ROM drives the CPU side directly, independently of video.
            const uint8_t cpu_in = rom_read ? rom_data : vd;
            if (!clock_changed && model.va == va && model.vd == vd && model.cpu_in == cpu_in) {
                return;
            }
            clock_changed = false;
            model.va = va;
            model.vd = vd;
            model.cpu_in = cpu_in;
            model.eval();
        }
        throw std::runtime_error("Board buses did not settle");
    }

    void half_tick(unsigned level) {
        // Sample SRAM writes with the stable pre-edge address/data, matching
        // the previous RTL memory model. Asynchronous reads settle below.
        if (level && !model.n_vwr) {
            ram[model.va] = model.vd;
        }

        // Rational 14 MHz timing in picoseconds without cumulative rounding.
        phase += 1000000000000ULL;
        context.timeInc(phase / 28000000);
        phase %= 28000000;
        model.clk14 = level;
        if (tracing) {
            model.eval();
            settle_buses();
            trace->dump(context.time());
        } else if (level) {
            model.eval();
        } else {
            // No device samples clk14 falling. Apply the memory response from
            // the rising edge together with that clock transition in one eval.
            settle_buses(true);
        }
    }
};

int main(int argc, char** argv) {
    try {
        if (argc == 2 && std::string(argv[1]) == "--help") {
            usage();
            return 0;
        }

        const auto options = arguments(argc, argv);
        const auto events = read_keys(options.keys);
        Frontend frontend(!options.headless, options.scale);

        // Validate every scripted key before spending time booting the ROM.
        for (const auto& event : events) {
            frontend.key(event.key, true);
            frontend.key(event.key, false);
        }

        VerilatedContext context;
        // Match the single-threaded RTL model instead of creating an idle worker pool.
        context.threads(1);
        Machine machine(context, !options.trace.empty());
        machine.load_rom(options.rom, options.rom_set);
        machine.start();

        uint64_t frame = 0;
        size_t event_index = 0;
        bool quit = false;
        bool paused = false;
        bool reset = false;
        uint8_t rows[8];
        auto deadline = std::chrono::steady_clock::now();
        const auto started = deadline;
        auto speed_started = started;
        uint64_t speed_frame = 0;

        while (!quit && (!options.frames || frame < options.frames)) {
            if (machine.tracing && frame - options.trace_start >= options.trace_frames) {
                machine.tracing = false;
                machine.trace->close();
            }
            while (event_index < events.size() && events[event_index].frame == frame) {
                const auto& event = events[event_index++];
                frontend.key(event.key, event.down);
            }

            const bool was_paused = paused;
            frontend.poll(rows, quit, reset, paused);
            if (quit) {
                break;
            }
            if (paused != was_paused) {
                // A pause must not depress the first speed reading after resume.
                speed_started = std::chrono::steady_clock::now();
                speed_frame = frame;
            }
            if (reset) {
                machine.reset();
                reset = false;
            }
            if (paused) {
                frontend.present(machine.pixels.data(), Width, Height);
                std::this_thread::sleep_for(std::chrono::milliseconds(16));
                deadline = std::chrono::steady_clock::now();
                continue;
            }

            machine.set_keys(rows);
            if (machine.trace && frame == options.trace_start) {
                make_parent(options.trace);
                machine.trace->open(options.trace.string().c_str());
                if (!machine.trace->isOpen()) {
                    throw std::runtime_error("Cannot create VCD file");
                }
                machine.tracing = true;
            }
            while (!machine.tick()) {
            }
            ++frame;

            frontend.present(machine.pixels.data(), Width, Height);
            if (!options.headless && !options.unlimited) {
                deadline += FramePeriod;
                std::this_thread::sleep_until(deadline);
                if (std::chrono::steady_clock::now() - deadline > FramePeriod * 4) {
                    deadline = std::chrono::steady_clock::now();
                }
            }
            if (!options.headless) {
                // Include presentation and pacing in the wall time: 100% means
                // one second of emulated hardware time per real second.
                const auto now = std::chrono::steady_clock::now();
                const double seconds = std::chrono::duration<double>(now - speed_started).count();
                if (seconds >= 0.5) {
                    const double emulated = (frame - speed_frame) * std::chrono::duration<double>(FramePeriod).count();
                    frontend.set_speed(100.0 * emulated / seconds);
                    speed_started = now;
                    speed_frame = frame;
                }
            }
        }
        if (!options.screenshot.empty()) {
            machine.screenshot(options.screenshot);
        }
        if (!options.dump_ram.empty()) {
            machine.dump_ram(options.dump_ram);
        }

        const auto elapsed = std::chrono::duration<double>(std::chrono::steady_clock::now() - started).count();
        std::cout << "frames=" << frame << " pc=0x" << std::hex << std::setfill('0') << std::setw(4)
                  << unsigned(machine.model.debug_pc) << " paging=0x" << std::setw(2)
                  << unsigned(machine.model.debug_paging) << std::dec << " elapsed=" << std::fixed
                  << std::setprecision(3) << elapsed << "s fps=" << (elapsed > 0 ? frame / elapsed : 0) << '\n';
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "Error: " << error.what() << '\n';
        return 1;
    }
}
