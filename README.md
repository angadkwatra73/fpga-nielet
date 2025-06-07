# FPGA Digital System Design Projects on Basys 3

This repository contains Verilog-based digital design projects implemented on the Basys 3 FPGA development board using Xilinx Vivado.

## Projects Included

1. **Traffic Light Controller**
   - FSM-based signal controller with 2-second cycle
   - 4-digit 7-segment display with custom encoder
   - Includes clock divider, display multiplexing, and full FPGA flow
   
![STOP]{images/7Seg_STOP.png}
![----]{images/7Seg_Blink.png}
![Go]{images/7Seg_GO.png}


2. **PWM LED Brightness Controller**
   - Real-time brightness control using on-board switches
   - Linear duty cycle modulation using a duty shifter module
   - Includes PWM generator and switch interface

Each project includes source code, simulation files, and design documentation.

## Tools Used
- **Platform:** Basys 3 FPGA Board
- **Language:** Verilog HDL
- **Toolchain:** Xilinx Vivado

## Setup
Each subfolder contains a `README.md` with build and simulation instructions.

