`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:39 02/23/2017 
// Design Name: 
// Module Name:    basic_and_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module basic_and_tb();
   
  reg [3:0] a, b;
  wire [3:0] out;
   
  basic_and #(.WIDTH(4)) DUT (
    .a(a),
    .b(b),
    .out(out)
  );
   
  initial begin
    a = 4'b1111;
    b = 4'b1111;
    #20
    a = 4'b0001;
    b = 4'b0101;
    #20
    a = 4'b0010;
    b = 4'b1111;
    #20 
    a = 4'b0011;
    b = 4'b0011;
    #20
    a = 4'b0100;
    b = 4'b1010;
    #20
    $finish;
  end
   
endmodule 
