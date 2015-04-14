`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:13 04/08/2015 
// Design Name: 
// Module Name:    mul_int 
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
module mul_int(
		input wire [31:0]a,
		input wire [31:0]b,
		output wire [63:0]c
		);
		
	wire [63:0] tmp_0;
	wire [63:0] tmp_1;
	wire [63:0] tmp_2;
	wire [63:0] tmp_3;
	wire [63:0] tmp_4;
	wire [63:0] tmp_5;
	wire [63:0] tmp_6;
	wire [63:0] tmp_7;
	wire [63:0] tmp_8;
	wire [63:0] tmp_9;
	wire [63:0] tmp_10;
	wire [63:0] tmp_11;
	wire [63:0] tmp_12;
	wire [63:0] tmp_13;
	wire [63:0] tmp_14;
	wire [63:0] tmp_15;
	wire [63:0] tmp_16;
	wire [63:0] tmp_17;
	wire [63:0] tmp_18;
	wire [63:0] tmp_19;
	wire [63:0] tmp_20;
	wire [63:0] tmp_21;
	wire [63:0] tmp_22;
	wire [63:0] tmp_23;
	wire [63:0] tmp_24;
	wire [63:0] tmp_25;
	wire [63:0] tmp_26;
	wire [63:0] tmp_27;
	wire [63:0] tmp_28;
	wire [63:0] tmp_29;
	wire [63:0] tmp_30;
	wire [63:0] tmp_31;
	wire [63:0] tmp_32;
	
	mul_int_unit unit0(a[0], b[31:0], 64'b0, tmp_0[63:0]);
	mul_int_unit unit1(a[1], b[31:0], tmp_0[63:0], tmp_1[63:0]);
	mul_int_unit unit2(a[2], b[31:0], tmp_1[63:0], tmp_2[63:0]);
	mul_int_unit unit3(a[3], b[31:0], tmp_2[63:0], tmp_3[63:0]);
	mul_int_unit unit4(a[4], b[31:0], tmp_3[63:0], tmp_4[63:0]);
	mul_int_unit unit5(a[5], b[31:0], tmp_4[63:0], tmp_5[63:0]);
	mul_int_unit unit6(a[6], b[31:0], tmp_5[63:0], tmp_6[63:0]);
	mul_int_unit unit7(a[7], b[31:0], tmp_6[63:0], tmp_7[63:0]);
	mul_int_unit unit8(a[8], b[31:0], tmp_7[63:0], tmp_8[63:0]);
	mul_int_unit unit9(a[9], b[31:0], tmp_8[63:0], tmp_9[63:0]);
	mul_int_unit unit10(a[10], b[31:0], tmp_9[63:0], tmp_10[63:0]);
	mul_int_unit unit11(a[11], b[31:0], tmp_10[63:0], tmp_11[63:0]);
	mul_int_unit unit12(a[12], b[31:0], tmp_11[63:0], tmp_12[63:0]);
	mul_int_unit unit13(a[13], b[31:0], tmp_12[63:0], tmp_13[63:0]);
	mul_int_unit unit14(a[14], b[31:0], tmp_13[63:0], tmp_14[63:0]);
	mul_int_unit unit15(a[15], b[31:0], tmp_14[63:0], tmp_15[63:0]);
	mul_int_unit unit16(a[16], b[31:0], tmp_15[63:0], tmp_16[63:0]);
	mul_int_unit unit17(a[17], b[31:0], tmp_16[63:0], tmp_17[63:0]);
	mul_int_unit unit18(a[18], b[31:0], tmp_17[63:0], tmp_18[63:0]);
	mul_int_unit unit19(a[19], b[31:0], tmp_18[63:0], tmp_19[63:0]);
	mul_int_unit unit20(a[20], b[31:0], tmp_19[63:0], tmp_20[63:0]);
	mul_int_unit unit21(a[21], b[31:0], tmp_20[63:0], tmp_21[63:0]);
	mul_int_unit unit22(a[22], b[31:0], tmp_21[63:0], tmp_22[63:0]);
	mul_int_unit unit23(a[23], b[31:0], tmp_22[63:0], tmp_23[63:0]);
	mul_int_unit unit24(a[24], b[31:0], tmp_23[63:0], tmp_24[63:0]);
	mul_int_unit unit25(a[25], b[31:0], tmp_24[63:0], tmp_25[63:0]);
	mul_int_unit unit26(a[26], b[31:0], tmp_25[63:0], tmp_26[63:0]);
	mul_int_unit unit27(a[27], b[31:0], tmp_26[63:0], tmp_27[63:0]);
	mul_int_unit unit28(a[28], b[31:0], tmp_27[63:0], tmp_28[63:0]);
	mul_int_unit unit29(a[29], b[31:0], tmp_28[63:0], tmp_29[63:0]);
	mul_int_unit unit30(a[30], b[31:0], tmp_29[63:0], tmp_30[63:0]);
	mul_int_unit unit31(a[31], b[31:0], tmp_30[63:0], c[63:0]);
	
endmodule

