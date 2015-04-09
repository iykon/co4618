`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:45 04/09/2015 
// Design Name: 
// Module Name:    mul_int_1booth 
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
module mul_int_1booth(
		input clk,
		input wire [31:0]a,
		input wire [31:0]b,
		output reg [63:0]c
		);
	reg [6:0] i;
	reg [64:0] tmp;

	always @(posedge clk) begin
		tmp = 65'b0;				// initialize		
		tmp[32:1] = a[31:0];
		for (i = 0; i < 32; i = i + 1) begin
			if ((tmp[1] == 1'b1) && (tmp[0] == 1'b0))
				tmp[64:33] = tmp[64:33] - b[31:0];
			if ((tmp[1] == 1'b0) && (tmp[0] == 1'b1))
				tmp[64:33] = tmp[64:33] + b[31:0];
				
			tmp = tmp >> 1;			// here is a signed right shift
			if (tmp[63] == 1'b1)
				tmp[64] = 1;
				
		end
		c[63:0] = tmp[64:1];		// get the result
	end
	
endmodule
