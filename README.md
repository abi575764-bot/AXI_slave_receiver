# AXI Lite Slave Receiver

## Overview
This project implements a simplified AXI4-Lite Slave Receiver using Verilog for Tiny Tapeout.

## How it works
The design receives write transactions, stores incoming data in an internal register, and displays the stored value on the output pins.

## How to test
1. Apply reset.
2. Set address and data inputs.
3. Assert AWVALID and WVALID.
4. Observe the output value after a clock edge.

## External Hardware
No external hardware is required.

## Author
Abishek
