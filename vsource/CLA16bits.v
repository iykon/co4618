`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:03:03 04/02/2015 
// Design Name: 
// Module Name:    CLA16bits 
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
module CLA16bits(
	input wire [15:0] A,
	input wire [15:0] B,
	input wire c,
	output wire  [15:0]sum,
	output wire [16:1] carry
    );

	wire [3:0] pp;
	wire [3:0] gg;
	wire [4:1] mc;
	wire [16:1] mmc;
	
	wire p;
	wire g;

	assign carry[4]=mc[1];
	assign carry[8]=mc[2];
	assign carry[12]=mc[3];
	assign carry[16]=mc[4];
	
	assign carry[3:1] = mmc[3:1];
	assign carry[7:5] = mmc[7:5];
	assign carry[11:9]= mmc[11:9];
	assign carry[15:13]=mmc[15:13]; 
	
	CLA4bits c4b0(A[3:0], B[3:0], c, sum[3:0], mmc[4:1], pp[0], gg[0]);
	CLA4bits c4b1(A[7:4], B[7:4], carry[4],sum[7:4], mmc[8:5], pp[1], gg[1]);
	CLA4bits c4b2(A[11:8], B[11:8], carry[8], sum[11:8], mmc[12:9], pp[2], gg[2]);
	CLA4bits c4b3(A[15:12], B[15:12], carry[12], sum[15:12], mmc[16:13], pp[3], gg[3]);
	CLA cla0(pp, gg, c, mc, p, g);
endmodule
