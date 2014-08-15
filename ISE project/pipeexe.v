`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:08 05/23/2014 
// Design Name: 
// Module Name:    pipeexe 
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
module pipeexe(ealuc,ealuimm,ea,eb,eimm,esa,eshift,ern0,epc4,ejal,ern,ealu);
input wire [3:0] ealuc;
input wire ealuimm,eshift,ejal;
input wire [7:0] epc4;
input wire [31:0] ea,eb,eimm;
input wire [4:0] esa,ern0;
output wire [4:0] ern;
output wire [31:0] ealu;
wire [31:0] a,b,r;
assign ern=(ejal==1)?31:ern0;
assign a=(eshift==1)?{27'b0,esa}:ea;
assign b=(ealuimm==1)?eimm:eb;
alu alu(a,b,ealuc,r);
assign ealu=(ejal==1)?({24'b0,epc4}+4):r;
endmodule
