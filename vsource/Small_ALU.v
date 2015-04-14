`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:36 04/09/2015 
// Design Name: 
// Module Name:    Small_ALU 
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
module Small_ALU(
	input wire clk,
	input wire [7:0] exp_A,
	input wire [7:0] exp_B,
	output reg [8:0] exp_diff,
	output reg [7:0] larger
    );
	 
	always@(posedge clk) begin
		if(exp_A>exp_B) begin
			exp_diff[7:0]=exp_A[7:0]-exp_B[7:0];
			larger=exp_A;
			exp_diff[8]=0;
		end
		else begin
			exp_diff[7:0]=exp_B[7:0]-exp_A[7:0];
			larger=exp_B;
			exp_diff[8]=1;
		end
	end


endmodule
