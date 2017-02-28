`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:52 02/28/2017 
// Design Name: 
// Module Name:    servo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//For our servo controller we need a pulse width of 1ms-2ms. 
//That means it needs to have a compare value from 50,000 - 100,000. 
//The most important part here is that we our neutral is at 75,000. 
//
//This servo controller will be an 8 bit controller. 
//That means we want to have 256 positions for the servo, specified by an input to our module.
//We need to figure out a way to easily make a value from 0-255 range from about 50,000-100,000.
//
//First we need to scale our value. We need 255 to be 50,000, so 50,000/255 = ~196. 
//That is pretty close to 256, so we can just shift our value by 8 bits to the left.
//
//Now we need an offset to make sure our center value is close to 75,000. 
//To find this we do (75,000 - (128 * 2^8)) / 2^8 = ~165. 
//That means we need to just add 165 to our input value and then scale that by 256, by shifting to the left 8 bits.
//Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module servo (
    input clk,
    input rst,
    input [7:0] position,
    output servo
  ); 
   
  reg pwm_d, pwm_q;
//  We want the frequency to be roughly 50Hz, or a 20ms period. 
//  Since we know the Mojo runs at 50MHz, we need to divide that down by 1,000,000. 
//  Log2(1,000,000) = ~19.9, that's pretty close to 20 so we're going to use a 20 bit counter. 
  reg [19:0] ctr_d, ctr_q; //counter of 20 bits for correct servo frequency 
   
  assign servo = pwm_q;
   
  always @(*) begin
    ctr_d = ctr_q + 1'b1;
     
    if (position + 9'd165 > ctr_q[19:8])
      pwm_d = 1'b1;
    else
      pwm_d = 1'b0;
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
     
    pwm_q <= pwm_d;
  end
   
endmodule 
