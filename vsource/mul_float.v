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
	wire [7:0]e;
	wire s1, s2, sign;
	wire g, r, s;
	wire [22:0]P;
	wire [22:0]A;
	wire [31:0]m1;
	wire [31:0]m2;
	wire [63:0]m;
	
	wire [22:0]P_shifted;
	wire [22:0]P_final;
	wire [22:0]P_real_final;
	
	wire s_final;
	wire g_final;
	wire [7:0]e_final;
	
	
	assign m1[31:0] = a[22:0];
	assign m2[31:0] = b[22:0];
	
	mul_int mul_int_0(m1[31:0], m2[31:0], m[63:0]);
	
	assign s1 = a[31];
	assign s2 = b[31];
	assign sign = s1 ^ s2;
	assign e1 = a[30:23];
	assign e2 = b[30:23];
	assign e = e1 - 8'b0111_1111 + e2;
	assign P[22:0] = m[45:23];
	assign A[22:0] = m[22:0];
	assign g = A[22];
	assign r = A[21];
	assign s = A[0] | A[1] | A[2] | A[3] | A[4] | A[5] | A[6] | A[7] | A[8] | A[8] | A[9] | A[10] | A[11] | A[12] | A[13] | A[14] | A[15] | A[16] | A[17] | A[18] | A[19];
		
	as_23 as_23_0(P[22:0], A[22], P_shifted);
	
	assign P_final[0] = (P[22] && P[0]) || (~P[22] && P_shifted[0]);
	assign P_final[1] = (P[22] && P[1]) || (~P[22] && P_shifted[1]);
	assign P_final[2] = (P[22] && P[2]) || (~P[22] && P_shifted[2]);
	assign P_final[3] = (P[22] && P[3]) || (~P[22] && P_shifted[3]);
	assign P_final[4] = (P[22] && P[4]) || (~P[22] && P_shifted[4]);
	assign P_final[5] = (P[22] && P[5]) || (~P[22] && P_shifted[5]);
	assign P_final[6] = (P[22] && P[6]) || (~P[22] && P_shifted[6]);
	assign P_final[7] = (P[22] && P[7]) || (~P[22] && P_shifted[7]);
	assign P_final[8] = (P[22] && P[8]) || (~P[22] && P_shifted[8]);
	assign P_final[9] = (P[22] && P[9]) || (~P[22] && P_shifted[9]);
	assign P_final[10] = (P[22] && P[10]) || (~P[22] && P_shifted[10]);
	assign P_final[11] = (P[22] && P[11]) || (~P[22] && P_shifted[11]);
	assign P_final[12] = (P[22] && P[12]) || (~P[22] && P_shifted[12]);
	assign P_final[13] = (P[22] && P[13]) || (~P[22] && P_shifted[13]);
	assign P_final[14] = (P[22] && P[14]) || (~P[22] && P_shifted[14]);
	assign P_final[15] = (P[22] && P[15]) || (~P[22] && P_shifted[15]);
	assign P_final[16] = (P[22] && P[16]) || (~P[22] && P_shifted[16]);
	assign P_final[17] = (P[22] && P[17]) || (~P[22] && P_shifted[17]);
	assign P_final[18] = (P[22] && P[18]) || (~P[22] && P_shifted[18]);
	assign P_final[19] = (P[22] && P[19]) || (~P[22] && P_shifted[19]);
	assign P_final[20] = (P[22] && P[20]) || (~P[22] && P_shifted[20]);
	assign P_final[21] = (P[22] && P[21]) || (~P[22] && P_shifted[21]);
	assign P_final[22] = (P[22] && P[22]) || (~P[22] && P_shifted[22]);
	
	assign s_final = (P[22] && (s | r )) || (~P[22] && s);
	assign r_final = (P[22] && g) || (~P[22] && s);
	
	/*if (!P[22]) begin
		P = P << 1;
		P[0] = A[22];
	end else begin
		s = s | r;
		r = g;
		e = e + 8'b1;
	end*/
	
	Get_final_e final_e(e[7:0], P[22], e_final[7:0]);		// if P[22] e = e + 8'b1;
	Get_real_final_P real_final_P(P_final[22:0], r, s, P_real_final[22:0]);  	 //if (r && s) P = P + 23'b1;

	assign c[31] = sign;
	assign c[30:23] = e_final[7:0];
	assign c[22:0] = P_real_final[22:0];

endmodule
