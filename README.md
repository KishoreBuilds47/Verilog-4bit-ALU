# Verilog-4bit-ALU
A 4-bit Arithmetic Logic Unit (ALU) designed in Verilog and simulated using AMD Vivado, supporting arithmetic, logical, shift, multiplication, and division operations with carry, borrow, and remainder outputs.

# Verilog 4-Bit ALU

A **4-bit Arithmetic Logic Unit (ALU)** designed using Verilog HDL and simulated in **AMD Vivado**. This project demonstrates combinational logic design, arithmetic operations, bitwise manipulation, and functional verification using a Verilog testbench.

## Overview

An Arithmetic Logic Unit (ALU) is a fundamental component of a processor that performs arithmetic and logical operations on binary data. This project implements a 4-bit ALU that accepts two 4-bit operands and a 4-bit operation code to select the required operation.

The design provides an 8-bit result output, along with separate carry, borrow, and remainder outputs.

## Features

- Arithmetic operations: Addition, subtraction, multiplication, and division
- Bitwise operations: AND, OR, XOR, and NOT
- Logical left and right shifts
- Carry flag for addition
- Borrow flag for subtraction
- Remainder output for division
- Division-by-zero handling
- Combinational logic implementation using `always @(*)`
- Functional verification using a Verilog testbench
- Behavioral simulation using AMD Vivado

## Supported Operations

| Operation | Opcode | Description |
|---|---|---|
| Addition | `0000` | Adds operands A and B |
| Subtraction | `0001` | Subtracts B from A |
| Bitwise AND | `0010` | Performs A AND B |
| Bitwise OR | `0011` | Performs A OR B |
| Bitwise XOR | `0100` | Performs A XOR B |
| Bitwise NOT | `0101` | Inverts the bits of A |
| Left Shift | `0110` | Shifts A left by B positions |
| Right Shift | `0111` | Shifts A right by B positions |
| Multiplication | `1000` | Multiplies A and B |
| Division | `1001` | Divides A by B and provides the remainder |

## Input and Output Signals

| Signal | Direction | Width | Description |
|---|---|---|---|
| `a` | Input | 4 bits | First operand |
| `b` | Input | 4 bits | Second operand |
| `op` | Input | 4 bits | Operation selector |
| `result` | Output | 8 bits | Operation result |
| `carry` | Output | 1 bit | Carry-out flag for addition |
| `borrow` | Output | 1 bit | Borrow flag for subtraction |
| `remainder` | Output | 4 bits | Remainder from division |

## Project Structure

```text
Verilog-4bit-ALU/
├── alu_4bit.v       # ALU design module
├── alu_4bit_tb.v    # Testbench for functional verification
└── README.md        # Project documentation
```

*Note: The filenames above are suggested. Use the actual filenames in your repository.*

## Example Operations

### 1. Addition with Carry

**Inputs:**

```text
A = 1111 (15)
B = 0001 (1)
OP = 0000
```

**Expected outputs:**

```text
Result = 0000  (lower 4-bit sum)
Carry  = 1
```

The mathematical sum is 16 (`10000` in binary). In this implementation, the lower four bits are stored in `result`, while the fifth bit is available through the separate `carry` output.

### 2. Subtraction with Borrow

**Inputs:**

```text
A = 0011 (3)
B = 0101 (5)
OP = 0001
```

**Expected outputs:**

```text
Result = 1110 (lower 4-bit result)
Borrow = 1
```

The 4-bit result represents −2 using two's-complement arithmetic.

### 3. Division with Remainder

**Inputs:**

```text
A = 1101 (13)
B = 0101 (5)
OP = 1001
```

**Expected outputs:**

```text
Result    = 00000010 (quotient = 2)
Remainder = 0011     (remainder = 3)
```

The division operation follows:

`13 = (5 × 2) + 3`

### 4. Division by Zero

When `B = 0000`, the design sets the quotient result and remainder to zero. This is a defined behavior chosen for this project, not a mathematical division result.

## Simulation Using AMD Vivado

Follow these steps to simulate the ALU:

1. Open **AMD Vivado** and create a new RTL project.
2. Add `alu_4bit.v` as a design source.
3. Add `alu_4bit_tb.v` as a simulation source.
4. Set `alu_4bit_tb` as the simulation top module.
5. Select **Run Simulation → Run Behavioral Simulation**.
6. Add `a`, `b`, `op`, `result`, `carry`, `borrow`, and `remainder` to the waveform window.
7. Run the simulation and inspect the outputs for each test vector.

The testbench applies multiple input combinations, holds each combination for a fixed simulation interval, and terminates the simulation using `$finish`.

## Verification

The testbench checks representative cases for:

- Addition with and without carry
- Subtraction with and without borrow
- Bitwise AND, OR, XOR, and NOT
- Left and right shifts
- Multiplication
- Division with a non-zero divisor
- Division by zero

Expected values can be compared against the waveform and the simulator transcript.

## Design Notes

- The ALU uses combinational logic and does not require a clock.
- A `case` statement selects the operation based on the opcode.
- Default assignments prevent unintended latch inference.
- Addition uses an extended temporary variable to capture the carry-out.
- Borrow detection is based on comparing the unsigned operands (`A < B`).
- The result width is 8 bits to accommodate the full product of two 4-bit unsigned operands.
- The carry and borrow outputs are separate status signals.

## Limitations

- The ALU operates on unsigned 4-bit operands.
- Signed arithmetic and signed comparisons are not implemented.
- Carry and borrow are meaningful only for their respective arithmetic operations.
- Division by zero is handled using a project-defined zero output.
- The design has been developed for RTL simulation; FPGA hardware implementation has not been claimed.

## Future Improvements

- Add signed arithmetic operations.
- Implement comparison operations such as equal, greater than, and less than.
- Add zero, negative, and overflow flags.
- Expand the operand width to 8 or 16 bits.
- Develop a self-checking testbench with automated pass/fail messages.
- Synthesize the design and examine FPGA resource utilization.

## Tools and Technologies

- **Language:** Verilog HDL
- **Design and Simulation:** AMD Vivado
- **Verification:** Verilog testbench and behavioral waveform analysis
- **Concepts:** Combinational logic, arithmetic circuits, bitwise operations, and RTL verification

## Learning Outcomes

Through this project, I explored how to design a combinational ALU, select operations using opcodes, handle carry and borrow conditions, implement arithmetic and logical functions, and verify RTL behavior using simulation waveforms.

## Author

**Sabavath Kishore Naik**

Electronics and Communication Engineering

GitHub: [KishoreBuilds47](https://github.com/KishoreBuilds47)

---

*This project is part of my learning journey in digital design, Verilog HDL, FPGA development, and VLSI engineering.*
