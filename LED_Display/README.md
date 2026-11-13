
# LED_Display

## Getting Started

- Press **Ctrl + Shift + B** to build the project.
- Open the Command Palette (**Ctrl + Shift + P**) and search for "MPLAB" to discover other available commands.
- Need more help? Visit the [MPLAB support site](https://www.microchip.com/en-us/support/all) or the [MPLAB website](https://www.microchip.com).
- Found a bug or have feedback? Open the Command Palette (**Ctrl + Shift + P**) and run
  **MPLAB: Report Issue** to let us know.

## Project Structure

- 📦 `_build` — The [CMake build tree](https://cmake.org/cmake/help/latest/manual/cmake.1.html#introduction-to-cmake-buildsystems); safe to delete, regenerated on next build.
- 📦 `cmake` — Generated [CMake](https://cmake.org/) files; can be deleted if `user.cmake` has not been added.
- 🚀 `out` — Final build artifacts.
- ⚙️ `.vscode` — VS Code workspace configuration; see [VS Code docs](https://code.visualstudio.com/docs/getstarted/settings).
- ⚙️ `.vscode/settings.json` — Workspace-specific settings.
- 📝 `.vscode/LED_Display.mplab.json` — The MPLAB project file. ❗ Should not be deleted.

## Direct PIC32MX170F256B display connection

The configured 64x32, 1/16-scan panel uses these dedicated PIC GPIO signals:

| HUB75 signal | PIC pin | HUB75 signal | PIC pin |
|---|---|---|---|
| R1 | RA0 | R2 | RA3 |
| G1 | RA1 | G2 | RA4 |
| B1 | RA2 | B2 | RB8 |
| A | RB2 | C | RB4 |
| B | RB3 | D | RB5 |
| LAT | RB6 | OE (active low) | RB7 |
| CLK | RB14 | | |

These are MCU port names, not package pin numbers. This mapping uses no shift
register or shared GPIO; RB0, RB1 and RB9-RB13 are not used by the display. The
previously planned peripherals cannot use any of the pins assigned above at
the same time. RA2/RA3 and RA4/RB4 require the oscillator configuration in
`main.c`; JTAG is disabled there.

The PIC outputs 3.3 V. Check the panel's input voltage thresholds: if it
requires 5 V logic, use suitable 3.3 V-to-5 V buffers on all display signals.
One 74ACT244 has only eight channels, so 13 independent signals require two
such buffers. Share ground, use an adequately rated panel power supply, and
pull the PIC-side OE signal up to 3.3 V while the PIC is reset so the panel
stays blank; never pull a PIC pin up to 5 V.
RB0 and RB1 are PGED1 and PGEC1, respectively, and remain available for
programming or debugging.

The production CMake build selects `display_example1.c` and expects a 40 MHz
system and peripheral clock from `main.c`:

```sh
cd cmake/LED_Display/default.production
cmake --preset LED_Display_default_conf
cmake --build ../../../_build/LED_Display/default.production --parallel 4
```
