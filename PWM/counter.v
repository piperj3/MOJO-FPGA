`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:56 02/14/2017 
// Design Name: 
// Module Name:    counter 
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
module counter (
    input clk,
    input rst,
    output reg [7:0] value
  );
   
  reg[24:0] ctr_d, ctr_q;
   
  always @(ctr_q) begin
    ctr_d = ctr_q + 1'b1;
     
    if (ctr_q[24])
      value = ~ctr_q[23:16];
    else
      value = ctr_q[23:16];
     
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
  end
   
endmodule 
