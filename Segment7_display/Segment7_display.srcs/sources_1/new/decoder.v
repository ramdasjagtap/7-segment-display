`timescale 1ns / 1ps


module decoder(
 input [3:0]bcd_i,
 output reg [6:0]segment_o
    );

    always @(*)
    begin
       case(bcd_i)           //ABCDEFG
       4'b0000: segment_o = 7'b0000001;
       4'b0001: segment_o = 7'b1001111;
       4'b0010: segment_o = 7'b0010010;
       4'b0011: segment_o = 7'b0000110;
       4'b0100: segment_o = 7'b1001100;
       4'b0101: segment_o = 7'b0100100;
       4'b0110: segment_o = 7'b0100000;
       4'b0111: segment_o = 7'b0001111;
       4'b1000: segment_o = 7'b0000000;
       4'b1001: segment_o = 7'b0000100;
       default: segment_o = 7'b0000001;
       endcase
    end
   
endmodule