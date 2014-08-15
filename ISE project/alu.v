`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:31 05/23/2014 
// Design Name: 
// Module Name:    alu 
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
module alu(a, b, aluc, result);
input wire [31:0] a; //the first input number
input wire [31:0] b; //the second input number
input wire [3:0] aluc; //operation code from aluc module
output reg [31:0] result; //output
wire [31:0] addresult;
wire [31:0] subresult;
wire co1,co2; //of no use
assign addresult=a+b;
assign subresult=a-b;
//adder_32bits m0(a, b, 1'b0, addresult, co1); // full-adder (do add)
//adder_32bits m1(a, b, 1'b1, subresult, co2); // full-adder (do sub)
always @* begin
case(aluc)
4'b0001: begin result<=a & b; end //and
4'b1001: begin result<=a & b; end //and
4'b0101: begin result<=a|b; end //or
4'b1101: begin result<=a|b; end //or
4'b1010: begin result<=a^b; end //xor
4'b0010: begin result<=a^b; end //xor
4'b0110: begin result<=b<<16;end//lui
4'b1110: begin result<=b<<16;end//lui
4'b0000: begin result<=addresult; end //add
4'b1000: begin result<=addresult; end //add
4'b0100: begin result<=subresult; end //sub
4'b1100: begin result<=subresult; end //sub
4'b0011: begin result<=b<<a; end//sll
4'b0111: begin result<=b>>a; end//srl
4'b1111: begin result<=($signed(b))>>>a; end//sra
default: begin result<=addresult; end
//3'b111:begin result<=a<b?32'b1:32'b0; end //slt
endcase end
endmodule

