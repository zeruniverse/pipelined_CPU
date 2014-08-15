`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:10 05/23/2014 
// Design Name: 
// Module Name:    mem_stage 
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
module pipemem(mwmem,malu,mb,clock,memclock,mmo);
input wire mwmem,clock,memclock;
input wire [31:0] malu,mb;
output wire [31:0] mmo;
data_mem dmem(memclock,mwmem,malu[7:2],mb,mmo);
endmodule
