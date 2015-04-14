`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:57 04/11/2015 
// Design Name: 
// Module Name:    mul_int_unit 
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
module mul_int_unit(
			input wire mark,
			input wire [31:0]adda,
			input wire [63:0]addb,
			output wire [63:0]sum
			//output [63:0]tmp,
			//output [63:0]tmp_shifted
		);
	wire [63:0]tmp;
	wire [63:0]tmp_shifted;
	wire sf;
	wire cf;
	wire of;

	assign tmp[0] = addb[0];
	assign tmp[1] = addb[1];
	assign tmp[2] = addb[2];
	assign tmp[3] = addb[3];
	assign tmp[4] = addb[4];
	assign tmp[5] = addb[5];
	assign tmp[6] = addb[6];
	assign tmp[7] = addb[7];
	assign tmp[8] = addb[8];
	assign tmp[9] = addb[9];
	assign tmp[10] = addb[10];
	assign tmp[11] = addb[11];
	assign tmp[12] = addb[12];
	assign tmp[13] = addb[13];
	assign tmp[14] = addb[14];
	assign tmp[15] = addb[15];
	assign tmp[16] = addb[16];
	assign tmp[17] = addb[17];
	assign tmp[18] = addb[18];
	assign tmp[19] = addb[19];
	assign tmp[20] = addb[20];
	assign tmp[21] = addb[21];
	assign tmp[22] = addb[22];
	assign tmp[23] = addb[23];
	assign tmp[24] = addb[24];
	assign tmp[25] = addb[25];
	assign tmp[26] = addb[26];
	assign tmp[27] = addb[27];
	assign tmp[28] = addb[28];
	assign tmp[29] = addb[29];
	assign tmp[30] = addb[30];
	assign tmp[31] = addb[31];
	
	CLA32bits adder_32bits(adda[31:0], addb[63:32], 0, tmp[63:32], sf, cf, of);
	lrs64 lrs1(tmp[63:0], tmp_shifted[63:0]);
	
	assign sum[0] = tmp_shifted[0];
	assign sum[1] = tmp_shifted[1];
	assign sum[2] = tmp_shifted[2];
	assign sum[3] = tmp_shifted[3];
	assign sum[4] = tmp_shifted[4];
	assign sum[5] = tmp_shifted[5];
	assign sum[6] = tmp_shifted[6];
	assign sum[7] = tmp_shifted[7];
	assign sum[8] = tmp_shifted[8];
	assign sum[9] = tmp_shifted[9];
	assign sum[10] = tmp_shifted[10];
	assign sum[11] = tmp_shifted[11];
	assign sum[12] = tmp_shifted[12];
	assign sum[13] = tmp_shifted[13];
	assign sum[14] = tmp_shifted[14];
	assign sum[15] = tmp_shifted[15];
	assign sum[16] = tmp_shifted[16];
	assign sum[17] = tmp_shifted[17];
	assign sum[18] = tmp_shifted[18];
	assign sum[19] = tmp_shifted[19];
	assign sum[20] = tmp_shifted[20];
	assign sum[21] = tmp_shifted[21];
	assign sum[22] = tmp_shifted[22];
	assign sum[23] = tmp_shifted[23];
	assign sum[24] = tmp_shifted[24];
	assign sum[25] = tmp_shifted[25];
	assign sum[26] = tmp_shifted[26];
	assign sum[27] = tmp_shifted[27];
	assign sum[28] = tmp_shifted[28];
	assign sum[29] = tmp_shifted[29];
	assign sum[30] = tmp_shifted[30];
	assign sum[31] = (tmp_shifted[31] && mark) || (addb[32] && ~mark);
	assign sum[32] = (tmp_shifted[32] && mark) || (addb[33] && ~mark);
	assign sum[33] = (tmp_shifted[33] && mark) || (addb[34] && ~mark);
	assign sum[34] = (tmp_shifted[34] && mark) || (addb[35] && ~mark);
	assign sum[35] = (tmp_shifted[35] && mark) || (addb[36] && ~mark);
	assign sum[36] = (tmp_shifted[36] && mark) || (addb[37] && ~mark);
	assign sum[37] = (tmp_shifted[37] && mark) || (addb[38] && ~mark);
	assign sum[38] = (tmp_shifted[38] && mark) || (addb[39] && ~mark);
	assign sum[39] = (tmp_shifted[39] && mark) || (addb[40] && ~mark);
	assign sum[40] = (tmp_shifted[40] && mark) || (addb[41] && ~mark);
	assign sum[41] = (tmp_shifted[41] && mark) || (addb[42] && ~mark);
	assign sum[42] = (tmp_shifted[42] && mark) || (addb[43] && ~mark);
	assign sum[43] = (tmp_shifted[43] && mark) || (addb[44] && ~mark);
	assign sum[44] = (tmp_shifted[44] && mark) || (addb[45] && ~mark);
	assign sum[45] = (tmp_shifted[45] && mark) || (addb[46] && ~mark);
	assign sum[46] = (tmp_shifted[46] && mark) || (addb[47] && ~mark);
	assign sum[47] = (tmp_shifted[47] && mark) || (addb[48] && ~mark);
	assign sum[48] = (tmp_shifted[48] && mark) || (addb[49] && ~mark);
	assign sum[49] = (tmp_shifted[49] && mark) || (addb[50] && ~mark);
	assign sum[50] = (tmp_shifted[50] && mark) || (addb[51] && ~mark);
	assign sum[51] = (tmp_shifted[51] && mark) || (addb[52] && ~mark);
	assign sum[52] = (tmp_shifted[52] && mark) || (addb[53] && ~mark);
	assign sum[53] = (tmp_shifted[53] && mark) || (addb[54] && ~mark);
	assign sum[54] = (tmp_shifted[54] && mark) || (addb[55] && ~mark);
	assign sum[55] = (tmp_shifted[55] && mark) || (addb[56] && ~mark);
	assign sum[56] = (tmp_shifted[56] && mark) || (addb[57] && ~mark);
	assign sum[57] = (tmp_shifted[57] && mark) || (addb[58] && ~mark);
	assign sum[58] = (tmp_shifted[58] && mark) || (addb[59] && ~mark);
	assign sum[59] = (tmp_shifted[59] && mark) || (addb[60] && ~mark);
	assign sum[60] = (tmp_shifted[60] && mark) || (addb[61] && ~mark);
	assign sum[61] = (tmp_shifted[61] && mark) || (addb[62] && ~mark);
	assign sum[62] = (tmp_shifted[62] && mark) || (addb[63] && ~mark);
	assign sum[63] = 0;
	
endmodule
