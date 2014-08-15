`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:55 05/22/2014 
// Design Name: 
// Module Name:    pipeir 
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

module pipeir(i_pc,i_ins,wpcir,clk,rst,o_pc,o_ins);
  input wire wpcir,clk, rst;
  input wire [7:0] i_pc;
  input wire [31:0] i_ins;
  output reg [7:0] o_pc;
  output reg [31:0] o_ins;
  always @(posedge clk) begin
  if (rst) begin o_pc <= 0;o_ins<=0; end
//if reset signal is given, turn to the first instruction
  else begin 
	 if(wpcir) begin o_pc <= i_pc; o_ins<=i_ins; end else begin o_pc<=o_pc;o_ins<=o_ins;end 
  end
//PC count change (how to change is determined by i_pc)
  end
endmodule

