#pragma once

#include <cstdint>
#include <memory>
#include <string>

// SDL owns only presentation and input; all video pixels come from the RTL.
// Calls must be made from the main thread. A disabled frontend never initializes
// SDL and still supports the same keyboard matrix through key().
class Frontend {
public:
    Frontend(bool enabled, int scale);
    ~Frontend();
    Frontend(const Frontend&) = delete;
    Frontend& operator=(const Frontend&) = delete;

    // rows[A8..A15] contain five active-low column bits. reset is a one-poll
    // pulse; quit is latched by the caller, paused toggles on F3/Pause.
    void poll(uint8_t rows[8], bool& quit, bool& reset, bool& paused);

    // Packed 0xAARRGGBB pixels, in display order; alpha is ignored.
    void present(const uint32_t* pixels, int width, int height);

    // Actual emulation speed relative to the hardware clock (100 = real time).
    void set_speed(double percent);

    // Case-insensitive Spectrum key or chord, e.g. "P", "2", "ENTER",
    // "CAPS", "SYMBOL", "PLUS", "LEFT", "BACKSPACE". Invalid names throw.
    void key(const std::string& name, bool down);

private:
    struct Impl;
    std::unique_ptr<Impl> impl_;
};
