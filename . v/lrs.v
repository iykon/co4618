`timescale 1ns / 1ps

module lrs(num,result);//logic left shift
input [31:0]num;
output wire [31:0]result;

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
assign result[31] = 0;

endmodule
