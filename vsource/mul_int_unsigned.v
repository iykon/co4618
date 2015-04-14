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
	reg [4:0] cnt;
	reg [63:0] tmp;
	
	initial begin
		cnt = 5'b0;
		tmp = 64'b0;
	end
	
	always @(posedge clk) begin
		if (cnt == 5'b0) begin
			c = tmp;
			tmp = 64'b0;
		end
		if (a[cnt] == 1'b1) begin
			tmp[63:32] = b[31:0] + tmp[63:32]; 	//adder_32bits adder(b[31:0] + c[63:32] => c[63:32]), maybe need a tmp varible here.
		end
		tmp = tmp >> 1; 	//lrs(c, 1);
		cnt = cnt + 5'b1;
	end
	
endmodule

