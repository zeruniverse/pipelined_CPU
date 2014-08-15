`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:24 05/22/2014 
// Design Name: 
// Module Name:    control_unit 
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
//pcsource,wpcir,op,func,rs,rt,mrn,mm2reg,mwreg,ern,em2reg,ewreg,wreg,m2reg,wmem,jal,daluc,aluimm,shift,rsrtequ,regrt,sext,fwdb,fwda
//////////////////////////////////////////////////////////////////////////////////
module control_unit(pcsource,wpcir,op,func,rs,rt,mrn,mm2reg,mwreg,ern,em2reg,ewreg,wreg,m2reg,wmem,jal,daluc,aluimm,shift,rsrtequ,regrt,sext,fwdb,fwda);
	//input wire resetn;
	input wire [5:0] op,func;
	input wire [4:0] rs,rt,mrn,ern;
	input wire mm2reg,mwreg,em2reg,ewreg,rsrtequ;
	output wire wpcir,wreg,m2reg,wmem,jal,aluimm,shift,regrt,sext;
	output wire [3:0] daluc;
	output wire [1:0] pcsource,fwda,fwdb;
	wire r,i_and,i_or,i_xor,i_add,i_sub,i_addi,i_andi,i_ori,i_xori,i_lw,i_sw,i_beq,i_bne,i_sll,i_srl,i_sra,i_jr,i_j,i_jal,i_lui,i_rs,i_rt;
	assign r=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0];
	assign i_and=r&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0];
	assign i_or=r&func[5]&~func[4]&~func[3]&func[2]&~func[1]&func[0];
	assign i_xor=r&func[5]&~func[4]&~func[3]&func[2]&func[1]&~func[0];
	assign i_add=r&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];
	assign i_sub=r&func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0];
	assign i_sll=r&~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];
	assign i_srl=r&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0];
	assign i_sra=r&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0];
	assign i_jr=r&~func[5]&~func[4]&func[3]&~func[2]&~func[1]&~func[0];
	assign i_j=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];
	assign i_jal=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
	assign i_addi=~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0];
	assign i_andi=~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0];
	assign i_ori=~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];
	assign i_xori=~op[5]&~op[4]&op[3]&op[2]&op[1]&~op[0];
	assign i_lw=op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
	assign i_sw=op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];
	assign i_beq=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];
	assign i_bne=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0];
	assign i_lui=~op[5]&~op[4]&op[3]&op[2]&op[1]&op[0];
	assign i_rs=i_add|i_sub|i_and|i_or|i_xor|i_jr|i_addi|i_andi|i_ori|i_xori|i_lw|i_sw|i_beq|i_bne;
	assign i_rt=i_add|i_sub|i_and|i_or|i_xor|i_sll|i_srl|i_sra|i_sw|i_beq|i_bne;
	assign daluc[3]=i_sra;
	assign daluc[2]=i_sub|i_beq|i_bne|i_or|i_ori|i_lui|i_srl|i_sra;
	assign daluc[1]=i_xor|i_xori|i_lui|i_sll|i_srl|i_sra;
	assign daluc[0]=i_and|i_andi|i_or|i_ori|i_sll|i_srl|i_sra;
	assign wpcir=~(ewreg&em2reg&(ern!=0)&(i_rs&(ern==rs)|i_rt&(ern==rt)));
	assign wreg=(i_add|i_sub|i_and|i_or|i_xor|i_sll|i_srl|i_sra|i_addi|i_andi|i_ori|i_xori|i_lw|i_lui|i_jal)&wpcir;
	assign wmem=i_sw&wpcir;
	assign m2reg=i_lw;
	assign jal=i_jal;
	assign aluimm=i_addi|i_andi|i_ori|i_xori|i_lui|i_sw|i_lw;
	assign shift=i_sll|i_srl|i_sra;
	assign regrt=i_lui|i_addi|i_andi|i_ori|i_xori|i_lw;
	assign sext=i_lui|i_addi|i_lw|i_sw|i_beq|i_bne;
	assign fwda=(ewreg&(ern!=0)&(ern==rs)&~em2reg)?2'b01:((mwreg&(mrn!=0)&(mrn==rs)&~mm2reg)?2'b10:((mwreg&(mrn!=0)&(mrn==rs)&mm2reg)?2'b11:2'b00));
	assign fwdb=(ewreg&(ern!=0)&(ern==rt)&~em2reg)?2'b01:((mwreg&(mrn!=0)&(mrn==rt)&~mm2reg)?2'b10:((mwreg&(mrn!=0)&(mrn==rt)&mm2reg)?2'b11:2'b00));
	assign pcsource[1]=i_j|i_jr|i_jal;
	assign pcsource[0]=(i_beq&rsrtequ)|(i_bne&~rsrtequ)|i_j|i_jal;
endmodule

