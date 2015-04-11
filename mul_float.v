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
			output reg[31:0]c,
			output reg overflow
		);
			
	reg [31:0]tmp;
	reg [7:0]e1;
	reg [7:0]e2;
	reg [7:0]e;
	reg s1, s2, sign;
	reg g, r, s;
	reg [22:0]P;
	reg [22:0]A;
	wire [31:0]m1;
	wire [31:0]m2;
	reg [63:0]m;
	
	assign m1[31:0] = a[22:0];
	assign m2[31:0] = b[22:0];
	
	reg [6:0]i;
	always @(posedge clk) begin
		m = 64'b0;
		for (i = 0; i < 32; i = i + 1) begin
			if (m1[i] == 1'b1) begin
				m[63:32] = m2[31:0] + m[63:32]; 	//adder_32bits adder(b[31:0] + c[63:32] => c[63:32]), maybe need a tmp varible here.
			end
			m = m >> 1; 	//lrs(c, 1);
		end
	
		s1 = a[31];
		s2 = b[31];
		sign = s1 ^ s2;

		e1 = a[30:23];
		e2 = b[30:23];
		e = e1 - 8'b0111_1111 + e2;

		P[22:0] = m[45:23];
		A[22:0] = m[22:0];
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

		c[31] = sign;
		c[30:23] = e[7:0];
		c[22:0] = P[22:0];
	end

endmodule
