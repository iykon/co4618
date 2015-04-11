`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:52 04/11/2015 
// Design Name: 
// Module Name:    as_23 
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

module as_23(//algebra shift
		input [22:0]num,
		input A1,
		output [22:0]result
	);
	
	assign result[0] = A1;
	assign result[1] = num[0];
	assign result[2] = num[1];
	assign result[3] = num[2];
	assign result[4] = num[3];
	assign result[5] = num[4];
	assign result[6] = num[5];
	assign result[7] = num[6];
	assign result[8] = num[7];
	assign result[9] = num[8];
	assign result[10] = num[9];
	assign result[11] = num[10];
	assign result[12] = num[11];
	assign result[13] = num[12];
	assign result[14] = num[13];
	assign result[15] = num[14];
	assign result[16] = num[15];
	assign result[17] = num[16];
	assign result[18] = num[17];
	assign result[19] = num[18];
	assign result[20] = num[19];
	assign result[21] = num[20];
	assign result[22] = num[21];

endmodule

