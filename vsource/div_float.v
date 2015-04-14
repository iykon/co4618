`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:12:19 04/09/2015
// Design Name:
// Module Name:    div_float
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
module div_float(
    input clk,
    input [31:0] dnd,
    input [31:0] der,
    output [31:0] quo,
	 output err
    );

reg errf;
reg [5:0] cnt;
reg [5:0] sft;
reg [7:0]e = 0;
reg [127:0] PA;
reg [63:0] B;
reg [31:0] res;

assign err = errf;
assign quo = res;

initial begin
	cnt = 6'b0;
	PA = 128'b0;
	res = 32'b0;
end

always @(posedge clk) begin
	if (cnt == 0) begin
		if (PA[63] == 1) begin
			sft = 0;
		end
		else if (PA[62] == 1) begin
			sft = 1;
		end
		else if (PA[61] == 1) begin
			sft = 2;
		end
		else if (PA[60] == 1) begin
			sft = 3;
		end
		else if (PA[59] == 1) begin
			sft = 4;
		end
		else if (PA[58] == 1) begin
			sft = 5;
		end
		else if (PA[57] == 1) begin
			sft = 6;
		end
		else if (PA[56] == 1) begin
			sft = 7;
		end
		else if (PA[55] == 1) begin
			sft = 8;
		end
		else if (PA[54] == 1) begin
			sft = 9;
		end
		else if (PA[53] == 1) begin
			sft = 10;
		end
		else if (PA[52] == 1) begin
			sft = 11;
		end
		else if (PA[51] == 1) begin
			sft = 12;
		end
		else if (PA[50] == 1) begin
			sft = 13;
		end
		else if (PA[49] == 1) begin
			sft = 14;
		end
		else if (PA[48] == 1) begin
			sft = 15;
		end
		else if (PA[47] == 1) begin
			sft = 16;
		end
		else if (PA[46] == 1) begin
			sft = 17;
		end
		else if (PA[45] == 1) begin
			sft = 18;
		end
		else if (PA[44] == 1) begin
			sft = 19;
		end
		else if (PA[43] == 1) begin
			sft = 20;
		end
		else if (PA[42] == 1) begin
			sft = 21;
		end
		else if (PA[41] == 1) begin
			sft = 22;
		end
		else if (PA[40] == 1) begin
			sft = 23;
		end
		else if (PA[39] == 1) begin
			sft = 24;
		end
		else if (PA[38] == 1) begin
			sft = 25;
		end
		else if (PA[37] == 1) begin
			sft = 26;
		end
		else if (PA[36] == 1) begin
			sft = 27;
		end
		else if (PA[35] == 1) begin
			sft = 28;
		end
		else if (PA[34] == 1) begin
			sft = 29;
		end
		else if (PA[33] == 1) begin
			sft = 30;
		end
		else if (PA[32] == 1) begin
			sft = 31;
		end
		else if (PA[31] == 1) begin
			sft = 32;
		end
		else if (PA[30] == 1) begin
			sft = 33;
		end
		else if (PA[29] == 1) begin
			sft = 34;
		end
		else if (PA[28] == 1) begin
			sft = 35;
		end
		else if (PA[27] == 1) begin
			sft = 36;
		end
		else if (PA[26] == 1) begin
			sft = 37;
		end
		else if (PA[25] == 1) begin
			sft = 38;
		end
		else if (PA[24] == 1) begin
			sft = 39;
		end
		else if (PA[23] == 1) begin
			sft = 40;
		end
		
		e = e - (sft+1) - 40 + 64;
		PA = PA << (sft+1);
		
		if ((dnd[30] == der[30]) && (dnd[30] != e[7]))
			errf = 1;
		else
			errf = 0;

		res[31] = dnd[31] ^ der[31];
		res[30:23] = e;
		res[22:0] = PA[63:41];

		// initialization
		PA = 0;
		PA[63:40] = {1, dnd[22:0]};
		B = 0;
		B[23:0] = {1, der[22:0]};
		e = dnd[30:23] - der[30:23] + 127;
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
