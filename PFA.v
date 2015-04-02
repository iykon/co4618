`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:05 04/02/2015 
// Design Name: 
// Module Name:    PFA 
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
module PFA(
	input wire A,
	input wire B,
	input wire c,
	output wire sum,
	output wire p,
	output wire g
    );
	xor(p, A, B);
	and (g, A, B);
	xor (sum, p, c);

endmodule
