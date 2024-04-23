`timescale 1ns / 1ps

// test bench
module tb_test();

reg tb_clk;
reg tb_arst;
reg tb_AN2_in;
reg tb_AN3_in;
wire [6:0] tb_display_o;
wire tb_AN0;
wire tb_AN1;
wire tb_AN2;
wire tb_AN3;
wire [3:0] tb_out;

//top_module DUT(
// .clk(tb_clk),
// .arst(tb_arst),
// .out(tb_out)
//);
//// modiule instance
////top_module DUT(.clk(tb_clk),.arst(tb_arst),.out(tb_out));

segment DUT(
 .clk(tb_clk),
 .arst(tb_arst),
 .AN2_in(tb_AN2_in),
 .AN3_in(tb_AN3_in),
 .AN0(tb_AN0),
 .AN1(tb_AN1),
 .AN2(tb_AN2),
 .AN3(tb_AN3),
 .display_o(tb_display_o)
);

// clock 
always #1 tb_clk = ~tb_clk;

// stimulus
initial
 begin
   tb_clk <= 1'b0;
   tb_arst <= 1'b1;
   tb_AN2_in <= 1'b1;
   tb_AN3_in <= 1'b1;
   #10;
   tb_arst <= 1'b0;
   #1000;
   tb_arst <= 1'b0;
    #20;
    tb_arst <= 1'b0;
    #2000;
   $finish();
 end
 
 /*
 // monitor window
 initial
  begin
    $monitor("tb_arst - %d | tb_AN0 - %b | tb_AN1 - %b",tb_arst,tb_AN0,tb_AN1);
  end
  */
endmodule