`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:59 04/15/2015 
// Design Name: 
// Module Name:    mul_2booth 
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
module mul_2booth(
			input clk,
			input [31:0]a,
			input [31:0]b,
			output [63:0]ans,
			output of							// mark of overflow
		);
	reg [3:0] cnt;
	reg [63:0] tmp;
	reg [63:0] c;
	reg last;									// used for choosing 2 booth's status
	reg overflow;
	wire [31:0] b_double;
	
	assign of = overflow;
	assign ans = c;
	
	initial begin
		tmp = 64'b0;							// initialize
		overflow = 1'b0;
		cnt = 4'b0;
	end
	
	assign b_double = b << 1;					// calculate double of b
			
	always @(posedge clk) begin				
		if (cnt == 4'b0) begin
			c[63:0] = tmp[63:0];		// get the result
			if (b_double[31] != b[31]) overflow = 1'b1; 		// detect overflow
			if (a[31] && b[31] && !c[63])	overflow = 1'b1;
			if (!a[31] && b[31] && c[63]) overflow = 1'b1;
			if (a[31] && !b[31] && c[63]) overflow = 1'b1;
			if (!a[31] && !b[31] && !c[63]) overflow = 1'b1;
			last = 1'b0;		
			tmp[63:0] = {32'b0, a[31:0]};		
		end
		case ({tmp[1:0], last}) 		// 2 booth (for)
			3'b001: begin tmp[63:32] = tmp[63:32] + b[31:0]; end
			3'b010: begin tmp[63:32] = tmp[63:32] + b[31:0]; end
			3'b011: begin tmp[63:32] = tmp[63:32] + b_double[31:0]; end
			3'b100: begin tmp[63:32] = tmp[63:32] - b_double[31:0]; end
			3'b101: begin tmp[63:32] = tmp[63:32] - b[31:0]; end
			3'b110: begin tmp[63:32] = tmp[63:32] - b[31:0]; end
		endcase
		last = tmp[1];		
		tmp = tmp >> 2;			// there should use your function: signed right shift 2 
		if (tmp[61] == 1'b1) begin
			tmp[63] = 1;
			tmp[62] = 1;
		end
		cnt = cnt + 4'b1;	
	end
	
endmodule
