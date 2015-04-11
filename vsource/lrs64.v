`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:41 04/11/2015 
// Design Name: 
// Module Name:    lrs64 
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
module lrs64(num, result);//logic right shift
	input [63:0]num;
	output [63:0]result;

	assign result[0] = num[1];
	assign result[1] = num[2];
	assign result[2] = num[3];
	assign result[3] = num[4];
	assign result[4] = num[5];
	assign result[5] = num[6];
	assign result[6] = num[7];
	assign result[7] = num[8];
	assign result[8] = num[9];
	assign result[9] = num[10];
	assign result[10] = num[11];
	assign result[11] = num[12];
	assign result[12] = num[13];
	assign result[13] = num[14];
	assign result[14] = num[15];
	assign result[15] = num[16];
	assign result[16] = num[17];
	assign result[17] = num[18];
	assign result[18] = num[19];
	assign result[19] = num[20];
	assign result[20] = num[21];
	assign result[21] = num[22];
	assign result[22] = num[23];
	assign result[23] = num[24];
	assign result[24] = num[25];
	assign result[25] = num[26];
	assign result[26] = num[27];
	assign result[27] = num[28];
	assign result[28] = num[29];
	assign result[29] = num[30];
	assign result[30] = num[31];
	assign result[31] = num[32];
	assign result[32] = num[33];
	assign result[33] = num[34];
	assign result[34] = num[35];
	assign result[35] = num[36];
	assign result[36] = num[37];
	assign result[37] = num[38];
	assign result[38] = num[39];
	assign result[39] = num[40];
	assign result[40] = num[41];
	assign result[41] = num[42];
	assign result[42] = num[43];
	assign result[43] = num[44];
	assign result[44] = num[45];
	assign result[45] = num[46];
	assign result[46] = num[47];
	assign result[47] = num[48];
	assign result[48] = num[49];
	assign result[49] = num[50];
	assign result[50] = num[51];
	assign result[51] = num[52];
	assign result[52] = num[53];
	assign result[53] = num[54];
	assign result[54] = num[55];
	assign result[55] = num[56];
	assign result[56] = num[57];
	assign result[57] = num[58];
	assign result[58] = num[59];
	assign result[59] = num[60];
	assign result[60] = num[61];
	assign result[61] = num[62];
	assign result[62] = num[63];
	assign result[63] = 0;

endmodule
