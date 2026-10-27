# 7-segment-display

A counter shown on the 7-segment display of a Basys3 FPGA board (Artix-7,
`xc7a35tcpg236-1`). It counts 0 to 15, about one step per 1.3 seconds, and shows
the value as two decimal digits.

## How it works

| File (`Segment7_display/Segment7_display.srcs/`) | What it does |
|---|---|
| `sources_1/new/freq_divider.v` | Divides the 100 MHz clock: bit 26 (about 0.75 Hz) clocks the counter, bit 18 (about 190 Hz) switches between the two digits |
| `sources_1/new/counter.v` | 4-bit counter |
| `sources_1/new/top_module.v` | Frequency divider + counter |
| `sources_1/new/segment.v` | Top level: turns the count into two digits, drives the segments and switches the anodes |
| `sources_1/new/decoder.v`, `mux_2x1_4bit.v` | Digit decoder and digit select mux |
| `constrs_1/new/segment.xdc` | Basys3 pin constraints |
| `sim_1/new/tb_test.v` | Testbench |

Both digits share the same segment pins, so the design lights them one at a
time, fast enough that you see both at once.

## Try it

Open `Segment7_display/Segment7_display.xpr` in Vivado, generate the bitstream
and program the Basys3.
