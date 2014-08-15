`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:59 05/22/2014 
// Design Name: 
// Module Name:    pipeid 
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
module pipeid(mwreg,mrn,ern,ewreg,em2reg,mm2reg,dpc4,inst,wrn,wdi,ealu,malu,mmo,wwreg,clock,resetn,bpc,jpc,pcsource,wpcir,dwreg,dm2reg,dwmem,daluc,daluimm,da,db,dimm,drn,dshift,djal,dsa,testreg,testdat);
input wire mwreg,ewreg,em2reg,mm2reg,clock,resetn,wwreg;
input wire [4:0] mrn,ern,wrn,testreg;
input wire [31:0] dpc4,inst,wdi,ealu,malu,mmo;
output wire [7:0] bpc,jpc;
output wire [1:0] pcsource;
output wire wpcir,dwreg,dm2reg,dwmem,daluimm,dshift,djal;
output wire [3:0] daluc;
output wire [31:0] da,db,dimm,testdat;
output wire [4:0] drn,dsa;
wire [7:0] bpcadd;
wire [31:0] q1,q2,bpcadd1;
wire regrt,sext,rsrtequ;
wire [1:0] fwda,fwdb;
regfile regid(inst[25:21],inst[20:16],wwreg,testreg,wdi,wrn,~clock,q1,q2,resetn,testdat);
sign_extend ext(sext,inst[15:0],dimm);
control_unit ctr(pcsource,wpcir,inst[31:26],inst[5:0],inst[25:21],inst[20:16],mrn,mm2reg,mwreg,ern,em2reg,ewreg,dwreg,dm2reg,dwmem,djal,daluc,daluimm,dshift,rsrtequ,regrt,sext,fwdb,fwda);
assign dsa={27'b0,inst[10:6]};
assign jpc={inst[4:0],2'b0};
sign_extend ext2(1'b1,inst[15:0],bpcadd1);
assign bpcadd=bpcadd1[7:0];
assign bpc=dpc4+(bpcadd<<2);
assign drn=(regrt == 0)?inst[15:11]:inst[20:16];
assign rsrtequ=(da==db)?1:0;
assign da=(fwda==0)?q1:((fwda==1)?ealu:((fwda==2)?malu:mmo));
assign db=(fwdb==0)?q2:((fwdb==1)?ealu:((fwdb==2)?malu:mmo));
endmodule
