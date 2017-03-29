`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:02 03/09/2017 
// Design Name: 
// Module Name:    message_rom 
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
module message_rom (
    input clk,
    input [3:0] addr, // this can have a value ou to 15 
    output [7:0] data //this is due to the 1 byte data that equals 8 bits
  );
 
  wire [7:0] rom_data [13:0];
 
  assign rom_data[0] = "H";
  assign rom_data[1] = "e";
  assign rom_data[2] = "l";
  assign rom_data[3] = "l";
  assign rom_data[4] = "o";
  assign rom_data[5] = " ";
  assign rom_data[6] = "D";
  assign rom_data[7] = "a";
  assign rom_data[8] = "n";
  assign rom_data[9] = "i";
  assign rom_data[10] = "e";
  assign rom_data[11] = "l";
  assign rom_data[12] = "\n";
  assign rom_data[13] = "\r";
 
  reg [7:0] data_d, data_q;
 
  assign data = data_q;
 
 // this part of the code is to provide a default case when addr goes up to 13 (out of boundaries) 
 // since addr can have a value up to 15 it goes out of boundaries for 14 and 15
  always @(*) begin
    if (addr > 4'd13)
      data_d = " ";
    else
      data_d = rom_data[addr];
  end
 
  always @(posedge clk) begin
    data_q <= data_d;
  end
 
endmodule 
