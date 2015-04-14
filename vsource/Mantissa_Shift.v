`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:36 04/09/2015 
// Design Name: 
// Module Name:    Mantissa_Shift 
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
module Mantissa_Shift(
	input wire clk,
	input wire [31:0] A,
	input wire [31:0] B,
	input wire [8:0] exp_diff,
	output reg [25:0] mant_A,
	output reg [25:0] mant_B
    );
	 reg [25:0]amant;
	 reg [25:0]bmant;
		
	always@(posedge clk)begin
		amant[22:0]=A[22:0];
		bmant[22:0]=B[22:0];
		amant[23]=1;
		bmant[23]=1;
		amant[25:24]=2'b00;
		bmant[25:24]=2'b00;
		if(exp_diff[7:0]!=0) begin
			if(exp_diff[8]) begin
				amant=amant>>exp_diff[7:0];
			end
			else begin
				bmant=bmant>>exp_diff[7:0];
			end
		end
		mant_A=amant;
		mant_B=bmant;
	end

endmodule
