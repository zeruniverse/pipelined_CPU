`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:55 05/22/2014 
// Design Name: 
// Module Name:    pipepc 
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
module pipepc(i_pc,wpcir,clk,rst,o_pc);
  input wire wpcir,clk, rst;
  input wire [7:0] i_pc;
  output reg [7:0] o_pc;
  always @(posedge clk) begin
  if (rst) o_pc <= 0; 
//if reset signal is given, turn to the first instruction
  else begin 
	if(wpcir) o_pc <= i_pc;  else o_pc<=o_pc;
	end
//PC count change (how to change is determined by i_pc)
  end
endmodule

