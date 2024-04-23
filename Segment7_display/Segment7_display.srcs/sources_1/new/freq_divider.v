`timescale 1ns / 1ps


module freq_divider(
input clk,arst,
output clk_out,
output refresh_rate
    );
    reg [26:0]count_reg;
    
    always @(posedge clk or posedge arst)
     begin
     if(arst)
       count_reg <= 'h0;
     else
       count_reg <= count_reg + 'h1;
     end
     
     assign clk_out = count_reg[26];
     assign refresh_rate = count_reg[18];
     
endmodule