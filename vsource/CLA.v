`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:42 04/02/2015 
// Design Name: 
// Module Name:    CLA 
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
module CLA(
	input wire [3:0] p,
	input wire [3:0] g,
	input wire c,
	output wire [4:1] carry,
	output wire pp,
	output wire gg
    );
	wire m0;
	wire [1:0]m1;
	wire [2:0]m2;
	wire [2:0]m3;
	wire m4;
	
	and (m0, p[0], c);
	or (carry[1], m0, g[0]);
	
	and (m1[0], p[1], g[0]);
	and (m1[1], p[1], p[0], c);
	or (carry[2], g[1], m1[0], m1[1]);
	
	and (m2[0], p[2], g[1]);
	and (m2[1], p[2], p[1], g[0]);
	and (m2[2], p[2], p[1], p[0], c);
	or (carry[3], g[2], m2[0], m2[1], m2[2]);
	
	and(m3[0],p[3],g[2]);
	and(m3[1],p[3],p[2],g[1]);
	and(m3[2],p[3],p[2],p[1],g[0]);
	
	or(gg, g[3], m3[0], m3[1], m3[2]);
	and(pp,p[3], p[2], p[1], p[0]);
	
	and(m4, c, pp);
	or(carry[4],gg, m4);

endmodule
