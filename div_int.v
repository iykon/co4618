`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:24 04/08/2015 
// Design Name: 
// Module Name:    IntDiv 
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
module div_int(
	 input clk,
    input [63:0] dnd,
    input [31:0] der,
    output reg [31:0] quo,
    output reg [31:0] rem,
    output reg err
    );

reg [63:0] B = 64'b0;
reg [63:0] P = 64'b0;
reg [63:0] A = 64'b0;
reg [7:0] i;

always @(posedge clk) begin
	B[31:0] = der;
	A = dnd;
	P = 64'b0;
	for (i = 0; i < 64; i = i + 1) begin
		P = P << 1;
		P[0] = A[63];
		A = A << 1;
		
		if (P[63] == 1) begin
			P = P + B;
		end
		else begin
			P = P - B;
		end
		
		if (P[63] == 1) begin
			A[0] = 0;
		end
		else begin
			A[0] = 1;
		end
	end
	if (P[63] == 1) begin
		P = P + B;
	end
	
	if ((A[63:32] != 0)||((dnd[63]^der[31] == 0) && (A[63]==1))) begin
		err = 1;
	end
	else begin
		err = 0;
	end
	quo = A;
	rem = P;
end

endmodule
