`timescale 1ns / 1ps

module segment(
 input clk,arst,
 input AN2_in, AN3_in,
 output  AN0,AN1,AN2,AN3,
 output [6:0]display_o
    );
    
    assign AN2 = AN2_in;
    assign AN3 = AN3_in;
    
    wire [3:0] counter_out;
    wire anode_logic;
    wire [3:0] mux_out_dec_in;
    wire clk_out;
    
    top_module COUNTER (
     .clk(clk),
     .arst(arst),
     .out(counter_out)
    );
    
    freq_divider FD(
    .clk(clk),
    .arst(arst),
    .clk_out(clk_out),
    .refresh_rate(anode_logic)
    );
 
 assign AN0 = anode_logic;
 assign AN1 = !anode_logic;
 
 reg [7:0]BCD_out;
always @(*)
 begin
   case(counter_out)
   4'b0000: BCD_out = 7'b00000000;
   4'b0001: BCD_out = 7'b00000001;
   4'b0010: BCD_out = 7'b00000010;
   4'b0011: BCD_out = 7'b00000011;
   4'b0100: BCD_out = 7'b00000100;
   4'b0101: BCD_out = 7'b00000101;
   4'b0110: BCD_out = 7'b00000110;
   4'b0111: BCD_out = 7'b00000111;
   4'b1000: BCD_out = 7'b00001000;
   4'b1001: BCD_out = 7'b00001001;
   4'b1010: BCD_out = 7'b00010000;
   4'b1011: BCD_out = 7'b00010001;
   4'b1100: BCD_out = 7'b00010010;
   4'b1101: BCD_out = 7'b00010011;
   4'b1110: BCD_out = 7'b00010100;
   4'b1111: BCD_out = 7'b00010101;
   default: BCD_out = 7'b00000000;
   endcase
 end
   
  mux_2x1_4bit MUX(
   .in0(BCD_out[3:0]),
   .in1(BCD_out[7:4]),
   .sel(anode_logic),
   .mux_out(mux_out_dec_in)
  );
     
   decoder DEC(
   .bcd_i(mux_out_dec_in),
   .segment_o(display_o)
   );
   
endmodule