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

## 🛠️ Usage

### 🧾 Compile & Simulate (Icarus Verilog)

Tools used:
VS code
Icarus verilog
GTKwave - waveform analysis
