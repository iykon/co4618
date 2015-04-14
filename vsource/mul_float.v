`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:09 04/10/2015 
// Design Name: 
// Module Name:    mul_float 
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
module mul_float(
			input clk,
			input wire[31:0]a,
			input wire[31:0]b,
			output wire[31:0]c,
			output wire overflow
		);
			
	wire [7:0]e1;
	wire [7:0]e2;
	wire [22:0]A;
	wire [63:0]m;
	wire s1, s2, sign;
	
	reg [7:0]e;
	reg [22:0]P; 
	reg g, r, s;
	
	mul_int mul_int_0(clk, {9'b0, a[22:0]}, {9'b0, b[22:0]}, m[63:0]);
	
	assign s1 = a[31];
	assign s2 = b[31];
	assign sign = s1 ^ s2;
	assign e1 = a[30:23];
	assign e2 = b[30:23];
	assign A[22:0] = m[22:0];
	
	always @(*) begin
		e = e1 - 8'b0111_1111 + e2;
		P[22:0] = m[45:23];
		g = A[22];
		r = A[21];
		s = A[0] | A[1] | A[2] | A[3] | A[4] | A[5] | A[6] | A[7] | A[8] | A[8] | A[9] | A[10] | A[11] | A[12] | A[13] | A[14] | A[15] | A[16] | A[17] | A[18] | A[19];
		if (!P[22]) begin
			P = P << 1;
			P[0] = A[22];
		end else begin
			s = s | r;
			r = g;
			e = e + 8'b1;
		end
		if (r && s) P = P + 23'b1;
	end

	assign c[31] = sign;
	assign c[30:23] = e[7:0];
	assign c[22:0] = P[22:0];

endmodule