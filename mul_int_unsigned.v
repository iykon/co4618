`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:13 04/08/2015 
// Design Name: 
// Module Name:    mul_int 
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
module mul_int(
		input clk,
		input wire [31:0]a,
		input wire [31:0]b,
		output reg [63:0]c
		);
	reg [6:0] i;

	always @(posedge clk) begin
		c = 64'b0;
		for (i = 0; i < 32; i = i + 1) begin
			if (a[i] == 1'b1) begin
				c[63:32] = b[31:0] + c[63:32]; 	//adder_32bits adder(b[31:0] + c[63:32] => c[63:32]), maybe need a tmp varible here.
			end
			c = c >> 1; 	//lrs(c, 1);
		end
	end
	
endmodule

