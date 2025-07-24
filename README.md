# 🧠 4-Bit Industry-Style ALU (with Flag Register & Enable Support)

This project implements a compact yet powerful **4-bit Arithmetic Logic Unit (ALU)** in Verilog, built to reflect **industry-level modularity and flag handling**. It supports a wide range of arithmetic and logic operations, includes a **separate flag register module**, and integrates **enable control** for precise functional gating.

---

## 🚀 Features

- ✅ **Arithmetic Operations**: `ADD`, `SUB`, `INC`, `DEC`
- ✅ **Logic Operations**: `AND`, `OR`, `XOR`, `NOT`
- ✅ **Shifting**:
  - Logical Left (`SLL`)
  - Logical Right (`SRL`)
  - Arithmetic Right (`SRA`)
- ✅ **Flag Register**:
  - `Zero (Z)`
  - `Negative (N)`
  - `Carry (C)`
  - `Overflow (V)`
- ✅ **Enable Pin**: ALU only executes when `enable = 1`
- ✅ **Update Control**: Flags are latched only when `update = 1`
- ✅ **Fully Combinational ALU** + **Sequential Flag Register**
- 🧪 **Verified with Testbench + GTKWave Simulation**

---

## 📂 Files

| File | Description |
|------|-------------|
| `alu_4bit.v` | Main ALU module (combinational) |
| `flag_register.v` | Sequential flag register (pos-edge triggered) |
| `alu_4bit_tb.v` | Testbench for verifying all operations |
| `alu_4bit.vcd` | GTKWave-compatible dumpfile |

---

## 🧪 Sample Waveform Output (via GTKWave)

![ALU GTKWave Screenshot](/4bit_ALU.png) <!-- Optional if you include a waveform screenshot -->

---

##🧠 Design and Working
This ALU is built using pure combinational logic to handle all arithmetic and logical operations based on a 4-bit opcode. It accepts two 4-bit inputs a and b, performs the selected operation, and outputs a 4-bit result ALU_out. Internally, an extended 5-bit register temp is used to detect carry-out from arithmetic operations. The ALU also sets key status flags (Zero, Negative, Carry, Overflow) based on the result, which are passed to a separate synchronous flag register module. This flag register updates its stored values on the positive edge of the clock when the update signal is asserted, allowing clean separation of combinational and sequential logic — a standard hardware design practice.

Shifting operations include Logical Left (SLL), Logical Right (SRL), and Arithmetic Right (SRA). The SRA preserves the sign bit (MSB) for signed interpretations. Additionally, the ALU only performs operations when the enable signal is high, adding an extra layer of control suitable for CPU integration. The modular architecture reflects industry-grade ALU design practices, where the core ALU and the flag handling logic are separated for reuse and clarity, making the design scalable and synthesis-friendly.

## 🛠️ Usage

### 🧾 Compile & Simulate (Icarus Verilog)

Tools used:
-VS code

-Icarus verilog

-GTKwave - waveform analysis
