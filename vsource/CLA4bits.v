`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:56 04/02/2015 
// Design Name: 
// Module Name:    CLA4bits 
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
module CLA4bits(
	input wire [3:0] A,
	input wire [3:0] B,
	input wire c,
	output wire [3:0] sum,
	output wire [4:1] carry,
	output wire p,
	output wire g
    );
	wire [3:0] pp;
	wire [3:0] gg;
	
	PFA pf0(A[0],B[0],c,sum[0],pp[0],gg[0]);
	PFA pf1(A[1],B[1],carry[1],sum[1],pp[1],gg[1]);	
	PFA pf2(A[2],B[2],carry[2],sum[2],pp[2],gg[2]);
	PFA pf3(A[3],B[3],carry[3],sum[3],pp[3],gg[3]);
	
	CLA cl0(pp, gg, c, carry, p, g);

endmodule
