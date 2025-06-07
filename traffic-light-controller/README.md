# Traffic Light Controller (Basys 3)

This project implements a traffic light controller using Verilog on the Basys 3 FPGA board. It cycles through traffic states ("Stop" and "Go") every 2 seconds and displays the current state on a 4-digit 7-segment display.

## Features
- Finite State Machine (FSM) to sequence traffic light states.
- Clock divider from 100 MHz to 0.5 Hz for 2-second intervals.
- Custom 7-segment encoder for "Stop" and "Go".
- Display multiplexer to drive 4 digits simultaneously using common anode configuration.
- Implemented and tested using Xilinx Vivado.

## Folder Structure

