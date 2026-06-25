
# BCD Up/Down Counter

A synchronous 4-bit digital counter that counts in Binary Coded Decimal (BCD) from 0 to 9, with selectable count direction (Up or Down). It automatically wraps around based on the selected mode and features terminal count detection.

## Features

* **BCD Compliance:** Counts strictly within the decimal range of `0000` (0) to `1001` (9).
* **Direction Control:** Dynamically switch between incrementing (Up) and decrementing (Down) via a control pin.
* **Synchronous Operation:** All flip-flops trigger simultaneously on the active clock edge to prevent glitches.
* **Boundary Flags:** Includes Terminal Count (TC) or Carry/Borrow outputs to easily cascade multiple stages for multi-digit counters.

## Counting Logic

The counter behavior changes instantly based on the `up_down` control signal:

| Mode (`up_down`) | Sequence | Wrap-Around |
| :--- | :--- | :--- |
| **UP (`1`)** | 0 → 1 → 2 → ... → 8 → 9 | 9 wraps around to 0 |
| **DOWN (`0`)** | 9 → 8 → 7 → ... → 1 → 0 | 0 wraps around to 9 |


