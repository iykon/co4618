`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:22 04/09/2015 
// Design Name: 
// Module Name:    Big_ALU 
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
module Big_ALU(
	input wire clk,
	input wire [25:0]A,
	input wire [25:0]B,
	input wire op,
	output wire [24:0]res,
	output reg sign
    );
	 reg [25:0] midres;
	 assign res=midres[24:0];
	always @(posedge clk) begin
		if(op) begin
			midres=A-B;
		end
		else begin
			midres=A+B;
		end
		if(midres[25])begin
			midres=~midres+1;
			sign=1;
		end
		else begin
			sign=0;
		end
	end
endmodule
