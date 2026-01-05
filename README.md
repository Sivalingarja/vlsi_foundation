# 4-Bit Synchronous Counter

### 📌 Project Overview
A synthesizable 4-bit up-counter designed in Verilog HDL. This project demonstrates the fundamentals of sequential logic design, active-high reset implementation, and clock-edge triggering.

### 🛠 Technical Details
* **Language:** Verilog (IEEE 1364-2005)
* **Simulator:** Icarus Verilog 0.9.7
* **Waveform Viewer:** EPWave

### 📉 Verification Results
The design was verified using a self-checking testbench.
* **Observation:** The counter increments (0 -> 1 -> 2...) only on the rising edge of the clock.
* **Reset Check:** When Reset=1, the output holds at 0000.

![Simulation Waveform](simulation_waveform.png)
---
## 🛠 Logic Debugging: 2-to-1 Multiplexer
**Challenge:** Fixed a broken code snippet containing sensitivity list errors and syntax bugs.
**Solution:**
* Converted from sequential logic (`posedge`) to combinational logic (`always @*`).
* Corrected bit-width mismatch (4-bit output -> 1-bit output).
* **Result:** Successfully simulated 2:1 Mux behavior.

![Mux Waveform](url_to_mux_screenshot.png)
---
## 🚦 Traffic Light Controller (Finite State Machine)
**Overview:** Designed a 4-state FSM to control traffic lights with specific timing delays.
**Key Features:**
* **Architecture:** Synchronous FSM with separate Sequential (Memory), Next-State, and Output logic blocks.
* **Timing:** Integrated a 4-bit timer to handle real-time delays (10-clock cycle hold per state).
* **Safety:** Default "Red-Red" reset state to prevent accidents during power-up.

![FSM Waveform](fsm_simulation.png)
