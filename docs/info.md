<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a simplified AXI4-Lite slave receiver. The design accepts an address and data from the input pins and stores the received data in an internal register. When both the address-valid (AWVALID) and write-valid (WVALID) signals are asserted, the slave captures the input data and writes it into the register. The stored value is continuously displayed on the output pins.

The design demonstrates the basic AXI write transaction concept, including VALID/READY handshaking and register storage, using a reduced interface suitable for Tiny Tapeout's limited I/O resources.

## How to test

1. Apply a reset by driving rst_n low.
2. Release reset by setting rst_n high.
3. Set the desired write address on ui_in[7:3].
4. Place the data byte on uio_in[7:0].
5. Assert:
AWVALID (ui_in[0]) = 1
WVALID (ui_in[1]) = 1
Wait for a clock edge.
6. The data will be stored in the internal register.
7. Observe the stored value on uo_out[7:0].
8. Assert BREADY (ui_in[2]) to complete the write response transaction.

## External hardware

No external hardware is required.

The project uses only the Tiny Tapeout input and output pins:

ui_in[7:0] for address and control signals
uio_in[7:0] for write data
uo_out[7:0] for displaying stored register data
clk for synchronization
rst_n for reset

The design can be tested entirely in simulation or on a Tiny Tapeout chip without additional peripherals.
