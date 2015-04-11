`timescale 1ns / 1ps
module slt_32(num1,num2,result,resultu);
input [31:0]num1,num2;
output result,resultu;

wire [31:0] sub;
wire sf,cf,of;

CLA32bits cla0(num1,num2,1,sub,sf,cf,of);

assign resultu <= cf;
XOR4 xor0(.I0(num1[31]),.I1(num2[31]),.I2(cf),.I3(of),.O(result));

endmodule
