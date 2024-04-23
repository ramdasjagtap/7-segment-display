`timescale 1ns / 1ps


module mux_2x1_4bit(
 input [3:0]in0,in1,
 input sel,
 output  [3:0]mux_out
    );
    
    assign mux_out = sel ? in1: in0;
    
endmodule