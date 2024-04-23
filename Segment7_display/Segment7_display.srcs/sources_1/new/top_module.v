`timescale 1ns / 1ps

// top module
module top_module(
input clk,arst,
output [3:0]out
    );
    
 wire clk_out_wire;
 
 // Frequency divider instance
 freq_divider INST1(.clk(clk),.arst(arst),.clk_out(clk_out_wire));
 
 // counter instance
 counter INST2(.clk(clk_out_wire),.arst(arst),.counter_out(out));

endmodule