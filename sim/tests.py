#!/usr/bin/env python3
"""Boot 48 BASIC, type PRINT 2+2, and read the answer from the ULA screenshot."""

import os
from pathlib import Path
import subprocess


def expect_text(pixels, font, row, text):
    # The 256x192 picture has a 48-pixel border. BASIC prints in black on white.
    ink = bytes((0, 0, 0))
    paper = bytes((205, 205, 205))
    for column, char in enumerate(text):
        for y in range(8):
            bits = font[(ord(char) - ord(" ")) * 8 + y]
            expected = b"".join(ink if bits & (0x80 >> x) else paper for x in range(8))
            start = 3 * ((48 + row * 8 + y) * 352 + 48 + column * 8)
            if pixels[start:start + 24] != expected:
                raise SystemExit(f"Expected {text!r} on screen row {row}, mismatch at character {column + 1}")


def main():
    sim = Path(__file__).resolve().parent
    exe = sim / "obj_dir" / ("Vsizif.exe" if os.name == "nt" else "Vsizif")
    rom = sim.parent / "rom/sizif-128.rom"
    output = sim / "out/tests/basic"
    output.mkdir(parents=True, exist_ok=True)
    keys = output / "keys.txt"
    screenshot = output / "screen.ppm"

    # Select 48 BASIC in the 128K menu. In the editor, P enters the PRINT keyword.
    sequence = [
        (120, "DOWN"), (132, "DOWN"), (144, "DOWN"), (156, "ENTER"),
        (240, "P"), (252, "2"), (264, "PLUS"), (276, "2"), (288, "ENTER"),
    ]
    with keys.open("w", encoding="ascii") as script:
        for frame, key in sequence:
            print(frame, key, "down", file=script)
            print(frame + 5, key, "up", file=script)

    screenshot.unlink(missing_ok=True)
    subprocess.run(
        [exe, "--headless", "--frames", "320", "--rom", rom, "--keys", keys, "--screenshot", screenshot],
        check=True, timeout=180,
    )
    magic, size, maximum, pixels = screenshot.read_bytes().split(b"\n", 3)
    if (magic, size, maximum) != (b"P6", b"352 288", b"255") or len(pixels) != 352 * 288 * 3:
        raise SystemExit("Expected a 352x288 RGB screenshot")

    # The 48 BASIC ROM is the second 16 KiB page. Its font starts at space.
    font = rom.read_bytes()[0x4000 + 0x3D00:0x8000]
    expect_text(pixels, font, 0, "4 ")
    expect_text(pixels, font, 23, "0 OK")
    print(f"PASS: 48 BASIC displayed 4 and 0 OK. Screenshot: {screenshot}")


if __name__ == "__main__":
    main()
