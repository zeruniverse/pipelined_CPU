`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:27 05/22/2014 
// Design Name: 
// Module Name:    pipeif 
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
module pipeif(pcsource,pc,bpc,da,jpc,npc,pc4,ins);
input wire [1:0] pcsource;
input wire [7:0] pc,bpc,jpc;
input wire [31:0] da;
output wire [31:0] ins;
output wire [7:0] npc,pc4;
assign pc4=pc+4;
assign npc=(pcsource==0)?pc4:((pcsource==1)?bpc:((pcsource==2)?da[7:0]:jpc));
mem_ins mem(pc[7:2],ins);
endmodule
