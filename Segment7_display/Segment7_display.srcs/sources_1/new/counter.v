`timescale 1ns / 1ps


module counter(
input clk,
input arst,
output reg [3:0]counter_out
    );
    always @(posedge clk or posedge arst)
      begin
       if(arst)
        begin
        counter_out <= 'h0;
       end
      else
        begin
         counter_out <= counter_out + 'h1;
        end
      end
      
endmodule