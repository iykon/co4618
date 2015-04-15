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
module div_int(
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
reg signND, signER;

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
		if ((PA[63] == 0) && (PA[62:32] != 0)) begin
			errf = 1;
		end;

		if (signER == 1) begin
			if (signND == 1) begin
				res[127:64] = -res[127:64];
			end
			else begin
				res[63:0] = -res[63:0];
			end
		end
		else begin
			if (signND == 1) begin
				res[63:0] = -res[63:0];
				res[127:64] = -res[127:64];
			end
			else begin
			end
		end

		//=============================
		B[31:0] = der;
		B[63:32] = {der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],
								der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31],der[31]};
		PA = {64'b0, dnd};

		if (B[63] == 1) begin
			signER = 1;
			B = {~B[63], ~B[62], ~B[61], ~B[60], ~B[59], ~B[58], ~B[57], ~B[56], ~B[55], ~B[54], ~B[53], ~B[52], ~B[51], ~B[50], ~B[49], ~B[48],
					 ~B[47], ~B[46], ~B[45], ~B[44], ~B[43], ~B[42], ~B[41], ~B[40], ~B[39], ~B[38], ~B[37], ~B[36], ~B[35], ~B[34], ~B[33], ~B[32],
					 ~B[31], ~B[30], ~B[29], ~B[28], ~B[27], ~B[26], ~B[25], ~B[24], ~B[23], ~B[22], ~B[21], ~B[20], ~B[19], ~B[18], ~B[17], ~B[16],
					 ~B[15], ~B[14], ~B[13], ~B[12], ~B[11], ~B[10], ~B[9], ~B[8], ~B[7], ~B[6], ~B[5], ~B[4], ~B[3], ~B[2], ~B[1], ~B[0]} + 1;
		end
		else begin
			signER = 0;
		end
		if (PA[63] == 1) begin
			signND = 1;
			PA = {~PA[63], ~PA[62], ~PA[61], ~PA[60], ~PA[59], ~PA[58], ~PA[57], ~PA[56], ~PA[55], ~PA[54], ~PA[53], ~PA[52], ~PA[51], ~PA[50], ~PA[49], ~PA[48],
						~PA[47], ~PA[46], ~PA[45], ~PA[44], ~PA[43], ~PA[42], ~PA[41], ~PA[40], ~PA[39], ~PA[38], ~PA[37], ~PA[36], ~PA[35], ~PA[34], ~PA[33], ~PA[32],
						~PA[31], ~PA[30], ~PA[29], ~PA[28], ~PA[27], ~PA[26], ~PA[25], ~PA[24], ~PA[23], ~PA[22], ~PA[21], ~PA[20], ~PA[19], ~PA[18], ~PA[17], ~PA[16],
						~PA[15], ~PA[14], ~PA[13], ~PA[12], ~PA[11], ~PA[10], ~PA[9], ~PA[8], ~PA[7], ~PA[6], ~PA[5], ~PA[4], ~PA[3], ~PA[2], ~PA[1], ~PA[0]} + 1;
		end
		else begin
			signND = 0;
		end

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
