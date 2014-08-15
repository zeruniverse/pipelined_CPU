`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:10:50 05/23/2014
// Design Name:   CPU_top
// Module Name:   E:/3120101980/pipelinecpu/test.v
// Project Name:  pipelinecpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clock;
	reg memclock;
	reg resetn;

	// Outputs
	wire [31:0] pc;
	wire [31:0] inst;
	wire [31:0] ealu;
	wire [31:0] malu;
	wire [31:0] walu;

	// Instantiate the Unit Under Test (UUT)
	CPU_top uut (
		.clock(clock), 
		.memclock(memclock), 
		.resetn(resetn), 
		.pc(pc), 
		.inst(inst), 
		.ealu(ealu), 
		.malu(malu), 
		.walu(walu)
	);

	initial begin
		// Initialize Inputs
		resetn = 1;
		clock=0;
		memclock=0;
		// Wait 100 ns for global reset to finish
		#11; resetn= 0;
		// Add stimulus here

	end
   initial forever begin
	#1; memclock=~memclock;
	#1;memclock=~memclock; clock=~clock;
	end
endmodule

