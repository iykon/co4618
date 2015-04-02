`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:44:51 04/02/2015 
// Design Name: 
// Module Name:    CLA32bits 
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
module CLA32bits(
	input wire [31:0] A,
	input wire [31:0] B,
	input wire op,
	output wire [31:0] sum,
	output wire sf,
	output wire cf, 
	output wire of
    );
	 
	 wire [31:0] c_B;
	 
	 wire p; //useless
	 wire g;
	 
	 
	 xor(c_B[0], op,B[0]);
	 xor(c_B[1], op,B[1]);
	 xor(c_B[2], op,B[2]);
	 xor(c_B[3], op,B[3]);
	 xor(c_B[4], op,B[4]);
	 xor(c_B[5], op,B[5]);
	 xor(c_B[6], op,B[6]);
	 xor(c_B[7], op,B[7]);
	 xor(c_B[8], op,B[8]);
	 xor(c_B[9], op,B[9]);
	 xor(c_B[10], op,B[10]);
	 xor(c_B[11], op,B[11]);
	 xor(c_B[12], op,B[12]);
	 xor(c_B[13], op,B[13]);
	 xor(c_B[14], op,B[14]);
	 xor(c_B[15], op,B[15]);
	 xor(c_B[16], op,B[16]);
	 xor(c_B[17], op,B[17]);
	 xor(c_B[18], op,B[18]);
	 xor(c_B[19], op,B[19]);
	 xor(c_B[20], op,B[20]);
	 xor(c_B[21], op,B[21]);
	 xor(c_B[22], op,B[22]);
	 xor(c_B[23], op,B[23]);
	 xor(c_B[24], op,B[24]);
	 xor(c_B[25], op,B[25]);
	 xor(c_B[26], op,B[26]);
	 xor(c_B[27], op,B[27]);
	 xor(c_B[28], op,B[28]);
	 xor(c_B[29], op,B[29]);
	 xor(c_B[30], op,B[30]);
	 xor(c_B[31], op,B[31]);
	
	CLA16bits cla16b0(A[15:0], c_B[15:0],op, sum[15:0], carry[16:1]);
	CLA16bits cla16b1(A[31:16], c_B[31:16],carry[16],sum[31:16],carry[32:17]);
	assign sf=sum[31];
	assign cf=carry[32];
	xor (of,carry[32], carry[31]);
	
endmodule
