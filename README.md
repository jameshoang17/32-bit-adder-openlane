# 32-Bit Ripple-Carry Adder — RTL to GDS

A parameterized 32-bit ripple-carry adder implemented in Verilog HDL
and physically implemented using the OpenLane RTL-to-GDS flow with
the SKY130 standard-cell library.

## Project Overview

The design consists of 32 cascaded 1-bit full adders. Each stage
propagates its carry-out to the carry-in of the following stage.

The project included:

- Verilog RTL implementation
- Functional verification using a Verilog testbench
- Logic synthesis
- Floorplanning
- I/O placement
- Power distribution
- Global and detailed placement
- Routing
- Static timing analysis
- Final GDS layout generation

## Tools

- Verilog HDL
- OpenLane
- SKY130 PDK
- RTL simulation

## Results

The design successfully passed functional simulation and was
implemented through the complete RTL-to-GDS physical design flow.

A floorplanning issue caused by the design's 98 top-level I/O pins
was resolved by increasing the die area.

## Files

- `src/adder.v` — Verilog implementation
- `tb/tb_adder.v` — Functional testbench
- `report/32-Bit-Adder-Final-Report.pdf` — Full project report
