# Barrel Shifter

A high-performance combinational digital circuit designed to shift or rotate a data word by a variable number of bits in a single clock cycle. This component is ideal for integration into Arithmetic Logic Units (ALUs) and Digital Signal Processors (DSPs).

## Features

* **Single-Cycle Execution:** Computes any $N$-bit shift simultaneously without sequential clock loops.
* **Multiple Operations:** Supports Logical Left Shift (LSL), Logical Right Shift (LSR), Arithmetic Right Shift (ASR), and Rotate Left/Right (ROT).
* **Logarithmic Architecture:** Implemented using a multiplexer matrix structure for minimal propagation delay.

## How It Works

Instead of shifting bits one by one over multiple clock cycles, a barrel shifter uses cascaded stages of multiplexers (MUXs). Each stage corresponds to a power of two ($1, 2, 4, 8, \dots$). 

The binary control signal directly dictates which stages perform a shift and which stages pass the data through unchanged.



