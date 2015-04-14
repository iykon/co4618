`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    19:53:44 04/11/2015
// Design Name:
// Module Name:    div_int
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
module div_int_u(
	 input clk,
    input [63:0] dnd,
    input [31:0] der,
    output [31:0] quo,
    output [31:0] rem,
    output err
    );

reg [127:0] PA;
reg [127:0] res;
reg [5:0] cnt;
reg [63:0] B = 64'b0;
reg errf;

assign quo = res[31:0];
assign rem = res[95:64];
assign err = errf;

initial begin
	cnt = 6'b0;
	PA = 128'b0;
end

always @(posedge clk) begin
	if (cnt == 0) begin
		if (PA[127] == 1) begin
			PA[127:64] = PA[127:64] + B;
		end
		res = PA;
		if (PA[63:32] != 0) begin
			errf = 1;
		end;

		//=============================
		B = {32'b0, der};
		PA = {64'b0, dnd};

		errf = 0;
		if (B == 0) begin
			errf = 1;
		end
	end
	PA = PA << 1;
	//----------------------
	if (PA[127] == 1) begin
		PA[127:64] = PA[127:64] + B;
	end
	else begin
		PA[127:64] = PA[127:64] - B;
	end
	//----------------------
	if (PA[127] == 1) begin
		PA[0] = 0;
	end
	else begin
		PA[0] = 1;
	end
	//----------------------
	cnt = cnt + 1;
end
endmodule
