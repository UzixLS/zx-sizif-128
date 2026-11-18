# Sizif-128 simulator

Verilator runs the board's ULA and Z80 together. The C++ host supplies 128 KiB
of SRAM and the ROM. SDL3 displays the ULA's video output and reads the keyboard.

## Build and run

From the repository root in PowerShell, launch the simulator or run its test.

```powershell
.\sim\run.ps1
.\sim\run.ps1 -Target test
```

The launcher looks for MSYS2 in `C:\msys64`, then `C:\dev\msys64`.
Use `-MsysRoot` to select a specific installation. Install the dependencies in a UCRT64 terminal:

```sh
pacman -S --needed mingw-w64-ucrt-x86_64-verilator mingw-w64-ucrt-x86_64-gcc \
    mingw-w64-ucrt-x86_64-SDL3 mingw-w64-ucrt-x86_64-pkgconf mingw-w64-ucrt-x86_64-python make perl
```

In UCRT64 or on Linux with Verilator, GCC, Make, Perl, pkg-config and SDL3
development files installed, run `make run` from `sim`. Use `make build` to
build just the executable or `make test` to run the Python 3 test.
Run `make clean` (PowerShell: `.\sim\run.ps1 -Target clean`) to remove the
Verilator build directory (`obj_dir/`) and test output (`out/tests/`).

## Follow the hardware

```text
Z80 address/data bus ── resistors ── VA/VD ── SRAM
        │                              │
       ROM                            ULA ── RGBI ── SDL window
```

1. [sizif.v](sizif.v) connects the Z80 pins to the original [ULA](../cpld/top.v).
   The ULA divides the 14 MHz master clock to supply the 3.5 MHz CPU clock. It
   also generates interrupts, selects memory banks and exposes the keyboard
   columns on port `#FE`. The CPU selects keyboard rows with its address lines.
2. [main.cpp](main.cpp) loads `rom/sizif-128.rom`, clocks the board through
   reset, then runs one raster at a time. It resolves the CPU and video buses
   from the ULA's output enables and samples SRAM writes on rising master-clock edges.
3. [frontend.cpp](frontend.cpp) maps physical and scripted keys to the same
   matrix. It displays a 352 × 288 crop of the ULA's RGBI pixels at 48.828125 frames/s.

The vendored CPU is [z80-silicon-rtl 1.0.0](https://github.com/dr-Titus/z80-silicon-rtl/tree/c39e2c08031b89d629f3daa33124a793d0ed255c)
([GPLv3](vendor/z80-silicon-rtl/LICENSE)).

## Controls and inspection

Letters and digits follow physical key positions. Shift gives Caps Shift,
Ctrl or Alt gives Symbol Shift, and the arrow keys send Spectrum cursor chords.
F2 resets the board, F3 or Pause pauses it, F11 toggles fullscreen and F10 exits.

Run `./obj_dir/Vsizif --help` from `sim` to see all options. Use `--rom` for a
16/32/64 KiB image, `--screenshot` for the final RGB frame, and `--dump-ram` for
all eight RAM banks. Keyboard scripts contain one event per line, such as
`120 DOWN down` and `125 DOWN up`. Frame numbers start at zero.

To inspect a frame in GTKWave, capture a VCD from the repository root:

```powershell
$trace = Join-Path $PWD 'boot.vcd'
.\sim\run.ps1 -SimulatorArgs @('--headless', '--frames', '2', '--trace-start', '1', '--trace', $trace)
```

## BASIC test

`make test` boots the repository ROM, selects **48 BASIC** and types `PRINT 2+2`.
It checks the rendered pixels for `4` on the first line and `0 OK` on the last
line using the ROM font. The keyboard script and screenshot are in `out/tests/basic/`.

In the 320-frame benchmark on a Core i5-12500, median throughput was 15.56 fps with silicon RTL and 24.97 fps with TV80.
Silicon RTL matched 12 of 12 sampled bus waveforms in the Zilog manual, and TV80 matched 7 of 12.
