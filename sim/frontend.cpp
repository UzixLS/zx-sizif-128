#include "frontend.h"

#include <SDL3/SDL.h>

#include <algorithm>
#include <array>
#include <cctype>
#include <initializer_list>
#include <map>
#include <stdexcept>
#include <string>

namespace {
constexpr const char* title = "Sizif-128";
constexpr const char* controls = " | F2 reset | F3 pause | F10 quit | F11 fullscreen";

// Keep the eight physical rows visible: each value is row * 5 + column.
// clang-format off
enum MatrixKey : uint8_t {
    Caps,  Z,      X,    C,    V,
    A,     S,      D,    F,    G,
    Q,     W,      E,    R,    T,
    Key1,  Key2,   Key3, Key4, Key5,
    Key0,  Key9,   Key8, Key7, Key6,
    P,     O,      I,    U,    Y,
    Enter, L,      K,    J,    H,
    Space, Symbol, M,    N,    B,
    None = 255
};

// clang-format on

struct Chord {
    MatrixKey first;
    MatrixKey second = None;
};

enum class Shift { Any, Released, Pressed };

struct PhysicalKey {
    SDL_Scancode scancode;
    Shift shift = Shift::Any;
};

struct Binding {
    std::initializer_list<const char*> names;
    Chord chord;
    std::initializer_list<PhysicalKey> physical;
};

// Both scripted names (including aliases) and PC keys resolve to this chord.
// Shift-specific PC punctuation consumes Shift instead of pressing Caps Shift.
constexpr Binding bindings[] = {
    {{"CAPS", "CAPSSHIFT", "SHIFT"}, {Caps}, {{SDL_SCANCODE_LSHIFT}, {SDL_SCANCODE_RSHIFT}}},
    {{"Z"}, {Z}, {{SDL_SCANCODE_Z}}},
    {{"X"}, {X}, {{SDL_SCANCODE_X}}},
    {{"C"}, {C}, {{SDL_SCANCODE_C}}},
    {{"V"}, {V}, {{SDL_SCANCODE_V}}},
    {{"A"}, {A}, {{SDL_SCANCODE_A}}},
    {{"S"}, {S}, {{SDL_SCANCODE_S}}},
    {{"D"}, {D}, {{SDL_SCANCODE_D}}},
    {{"F"}, {F}, {{SDL_SCANCODE_F}}},
    {{"G"}, {G}, {{SDL_SCANCODE_G}}},
    {{"Q"}, {Q}, {{SDL_SCANCODE_Q}}},
    {{"W"}, {W}, {{SDL_SCANCODE_W}}},
    {{"E"}, {E}, {{SDL_SCANCODE_E}}},
    {{"R"}, {R}, {{SDL_SCANCODE_R}}},
    {{"T"}, {T}, {{SDL_SCANCODE_T}}},
    {{"1"}, {Key1}, {{SDL_SCANCODE_1}}},
    {{"2"}, {Key2}, {{SDL_SCANCODE_2}}},
    {{"3"}, {Key3}, {{SDL_SCANCODE_3}}},
    {{"4"}, {Key4}, {{SDL_SCANCODE_4}}},
    {{"5"}, {Key5}, {{SDL_SCANCODE_5}}},
    {{"0"}, {Key0}, {{SDL_SCANCODE_0}}},
    {{"9"}, {Key9}, {{SDL_SCANCODE_9}}},
    {{"8"}, {Key8}, {{SDL_SCANCODE_8}}},
    {{"7"}, {Key7}, {{SDL_SCANCODE_7}}},
    {{"6"}, {Key6}, {{SDL_SCANCODE_6}}},
    {{"P"}, {P}, {{SDL_SCANCODE_P}}},
    {{"O"}, {O}, {{SDL_SCANCODE_O}}},
    {{"I"}, {I}, {{SDL_SCANCODE_I}}},
    {{"U"}, {U}, {{SDL_SCANCODE_U}}},
    {{"Y"}, {Y}, {{SDL_SCANCODE_Y}}},
    {{"ENTER", "RETURN"}, {Enter}, {{SDL_SCANCODE_RETURN}, {SDL_SCANCODE_KP_ENTER}}},
    {{"L"}, {L}, {{SDL_SCANCODE_L}}},
    {{"K"}, {K}, {{SDL_SCANCODE_K}}},
    {{"J"}, {J}, {{SDL_SCANCODE_J}}},
    {{"H"}, {H}, {{SDL_SCANCODE_H}}},
    {{"SPACE"}, {Space}, {{SDL_SCANCODE_SPACE}}},
    {{"SYMBOL", "SYMBOLSHIFT", "CTRL"},
     {Symbol},
     {{SDL_SCANCODE_LCTRL}, {SDL_SCANCODE_RCTRL}, {SDL_SCANCODE_LALT}, {SDL_SCANCODE_RALT}}},
    {{"M"}, {M}, {{SDL_SCANCODE_M}}},
    {{"N"}, {N}, {{SDL_SCANCODE_N}}},
    {{"B"}, {B}, {{SDL_SCANCODE_B}}},

    {{"LEFT"}, {Caps, Key5}, {{SDL_SCANCODE_LEFT}}},
    {{"DOWN"}, {Caps, Key6}, {{SDL_SCANCODE_DOWN}}},
    {{"UP"}, {Caps, Key7}, {{SDL_SCANCODE_UP}}},
    {{"RIGHT"}, {Caps, Key8}, {{SDL_SCANCODE_RIGHT}}},
    {{"BACKSPACE", "DELETE"}, {Caps, Key0}, {{SDL_SCANCODE_BACKSPACE}, {SDL_SCANCODE_DELETE}}},
    {{"BREAK", "ESCAPE"}, {Caps, Space}, {{SDL_SCANCODE_ESCAPE}}},
    {{"TAB"}, {Caps, Symbol}, {{SDL_SCANCODE_TAB}}},
    {{"CAPSLOCK"}, {Caps, Key2}, {{SDL_SCANCODE_CAPSLOCK}}},

    {{"PLUS", "+"}, {Symbol, K}, {{SDL_SCANCODE_KP_PLUS}, {SDL_SCANCODE_EQUALS, Shift::Pressed}}},
    {{"MINUS", "-"}, {Symbol, J}, {{SDL_SCANCODE_KP_MINUS}, {SDL_SCANCODE_MINUS, Shift::Released}}},
    {{"EQUALS", "="}, {Symbol, L}, {{SDL_SCANCODE_EQUALS, Shift::Released}}},
    {{"COMMA", ","}, {Symbol, N}, {{SDL_SCANCODE_COMMA, Shift::Released}}},
    {{"PERIOD", "."}, {Symbol, M}, {{SDL_SCANCODE_PERIOD, Shift::Released}}},
    {{"SLASH", "/"}, {Symbol, V}, {{SDL_SCANCODE_KP_DIVIDE}, {SDL_SCANCODE_SLASH, Shift::Released}}},
    {{"ASTERISK", "*"}, {Symbol, B}, {{SDL_SCANCODE_KP_MULTIPLY}}},
    {{"SEMICOLON", ";"}, {Symbol, O}, {{SDL_SCANCODE_SEMICOLON, Shift::Released}}},
    {{"COLON", ":"}, {Symbol, Z}, {{SDL_SCANCODE_SEMICOLON, Shift::Pressed}}},
    {{"QUOTE", "\""}, {Symbol, P}, {{SDL_SCANCODE_APOSTROPHE, Shift::Pressed}}},
    {{"APOSTROPHE", "'"}, {Symbol, Key7}, {{SDL_SCANCODE_APOSTROPHE, Shift::Released}}},
    {{"UNDERSCORE", "_"}, {Symbol, Key0}, {{SDL_SCANCODE_MINUS, Shift::Pressed}}},
    {{"LESS", "<"}, {Symbol, R}, {{SDL_SCANCODE_COMMA, Shift::Pressed}}},
    {{"GREATER", ">"}, {Symbol, T}, {{SDL_SCANCODE_PERIOD, Shift::Pressed}}},
    {{"QUESTION", "?"}, {Symbol, C}, {{SDL_SCANCODE_SLASH, Shift::Pressed}}},
};

std::runtime_error sdl_error(const char* operation) {
    return std::runtime_error(std::string(operation) + ": " + SDL_GetError());
}

std::string normalize(std::string name) {
    std::transform(name.begin(), name.end(), name.begin(),
                   [](unsigned char c) { return static_cast<char>(std::toupper(c)); });
    return name;
}

Chord parse_key(const std::string& name) {
    for (const auto& binding : bindings) {
        for (const auto alias : binding.names) {
            if (name == alias) {
                return binding.chord;
            }
        }
    }
    throw std::invalid_argument("Unknown Spectrum key: " + name);
}

void press(uint8_t rows[8], MatrixKey key) {
    rows[key / 5] &= static_cast<uint8_t>(~(1u << (key % 5)));
}

void press(uint8_t rows[8], Chord chord) {
    press(rows, chord.first);
    if (chord.second != None) {
        press(rows, chord.second);
    }
}

} // namespace

struct Frontend::Impl {
    bool initialized = false;
    bool fullscreen = false;
    bool last_paused = false;
    std::string speed = "--%";
    SDL_Window* window = nullptr;
    SDL_Renderer* renderer = nullptr;
    SDL_Texture* texture = nullptr;
    int texture_width = 0;
    int texture_height = 0;
    std::array<bool, SDL_SCANCODE_COUNT> held{};
    std::map<std::string, Chord> injected;

    void update_title() {
        const auto text =
            std::string(last_paused ? "[PAUSED] " : "") + title + " | " + (last_paused ? "0%" : speed) + controls;
        if (!SDL_SetWindowTitle(window, text.c_str())) {
            throw sdl_error("SDL_SetWindowTitle");
        }
    }

    ~Impl() {
        if (texture) {
            SDL_DestroyTexture(texture);
        }
        if (renderer) {
            SDL_DestroyRenderer(renderer);
        }
        if (window) {
            SDL_DestroyWindow(window);
        }
        if (initialized) {
            SDL_QuitSubSystem(SDL_INIT_VIDEO);
        }
    }
};

Frontend::Frontend(bool enabled, int scale) : impl_(std::make_unique<Impl>()) {
    if (!enabled) {
        return;
    }
    if (scale < 1 || scale > 8) {
        throw std::invalid_argument("Window scale must be between 1 and 8");
    }
    if (!SDL_InitSubSystem(SDL_INIT_VIDEO)) {
        throw sdl_error("SDL_InitSubSystem");
    }

    impl_->initialized = true;
    if (!SDL_CreateWindowAndRenderer(title, 352 * scale, 288 * scale, SDL_WINDOW_RESIZABLE, &impl_->window,
                                     &impl_->renderer)) {
        throw sdl_error("SDL_CreateWindowAndRenderer");
    }
    if (!SDL_SetRenderDrawColor(impl_->renderer, 0, 0, 0, 255)) {
        throw sdl_error("SDL_SetRenderDrawColor");
    }

    // Main owns the 50 Hz emulation pacing. Avoid tying it to monitor refresh.
    SDL_SetRenderVSync(impl_->renderer, 0);
    impl_->update_title();
}

Frontend::~Frontend() = default;

void Frontend::set_speed(double percent) {
    if (!impl_->initialized) {
        return;
    }

    const auto speed = std::to_string(static_cast<int>(percent + 0.5)) + "%";
    if (speed != impl_->speed) {
        impl_->speed = speed;
        impl_->update_title();
    }
}

void Frontend::key(const std::string& name, bool down) {
    const auto normalized = normalize(name);
    const auto chord = parse_key(normalized);
    if (down) {
        impl_->injected[normalized] = chord;
    } else {
        impl_->injected.erase(normalized);
    }
}

void Frontend::poll(uint8_t rows[8], bool& quit, bool& reset, bool& paused) {
    reset = false;
    if (impl_->initialized) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT || event.type == SDL_EVENT_WINDOW_CLOSE_REQUESTED) {
                quit = true;
            }
            if (event.type == SDL_EVENT_WINDOW_FOCUS_LOST) {
                impl_->held.fill(false);
            }
            if (event.type != SDL_EVENT_KEY_DOWN && event.type != SDL_EVENT_KEY_UP) {
                continue;
            }

            const auto code = event.key.scancode;
            if (code >= 0 && static_cast<size_t>(code) < impl_->held.size()) {
                impl_->held[code] = event.type == SDL_EVENT_KEY_DOWN;
            }
            if (event.type != SDL_EVENT_KEY_DOWN || event.key.repeat) {
                continue;
            }

            switch (code) {
            case SDL_SCANCODE_F2:
                reset = true;
                break;
            case SDL_SCANCODE_F3:
            case SDL_SCANCODE_PAUSE:
                paused = !paused;
                break;
            case SDL_SCANCODE_F10:
                quit = true;
                break;
            case SDL_SCANCODE_F11:
                impl_->fullscreen = !impl_->fullscreen;
                if (!SDL_SetWindowFullscreen(impl_->window, impl_->fullscreen)) {
                    throw sdl_error("SDL_SetWindowFullscreen");
                }
                break;
            default:
                break;
            }
        }

        if (paused != impl_->last_paused) {
            impl_->last_paused = paused;
            impl_->speed = "--%";
            impl_->update_title();
        }
    }

    std::fill(rows, rows + 8, uint8_t{0x1f});
    const auto down = [this](SDL_Scancode code) {
        return impl_->held[code];
    };
    const bool shift = down(SDL_SCANCODE_LSHIFT) || down(SDL_SCANCODE_RSHIFT);
    bool caps_shift = false;
    bool punctuation = false;

    for (const auto& binding : bindings) {
        for (const auto& physical : binding.physical) {
            if (!down(physical.scancode)) {
                continue;
            }
            if ((physical.shift == Shift::Released && shift) || (physical.shift == Shift::Pressed && !shift)) {
                continue;
            }

            punctuation |= physical.shift != Shift::Any;
            if (binding.chord.first == Caps && binding.chord.second == None) {
                caps_shift = true;
            } else {
                press(rows, binding.chord);
            }
        }
    }

    // Defer physical Shift until punctuation has been resolved. Caps Shift
    // held by an arrow or a script must remain pressed even while typing '+'.
    if (caps_shift && !punctuation) {
        press(rows, Caps);
    }
    for (const auto& entry : impl_->injected) {
        press(rows, entry.second);
    }
}

void Frontend::present(const uint32_t* pixels, int width, int height) {
    if (!impl_->initialized) {
        return;
    }
    if (!pixels || width <= 0 || height <= 0) {
        throw std::invalid_argument("Invalid video frame");
    }

    if (!impl_->texture || width != impl_->texture_width || height != impl_->texture_height) {
        if (impl_->texture) {
            SDL_DestroyTexture(impl_->texture);
        }
        impl_->texture =
            SDL_CreateTexture(impl_->renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, width, height);
        if (!impl_->texture) {
            throw sdl_error("SDL_CreateTexture");
        }

        impl_->texture_width = width;
        impl_->texture_height = height;
        if (!SDL_SetTextureScaleMode(impl_->texture, SDL_SCALEMODE_NEAREST) ||
            !SDL_SetTextureBlendMode(impl_->texture, SDL_BLENDMODE_NONE) ||
            !SDL_SetRenderLogicalPresentation(impl_->renderer, width, height, SDL_LOGICAL_PRESENTATION_LETTERBOX)) {
            throw sdl_error("SDL texture configuration");
        }
    }

    if (!SDL_UpdateTexture(impl_->texture, nullptr, pixels, width * sizeof(uint32_t)) ||
        !SDL_RenderClear(impl_->renderer) || !SDL_RenderTexture(impl_->renderer, impl_->texture, nullptr, nullptr) ||
        !SDL_RenderPresent(impl_->renderer)) {
        throw sdl_error("SDL frame presentation");
    }
}
