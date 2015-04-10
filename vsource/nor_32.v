`timescale 1ns / 1ps
module nor_32(num1,num2,result);
input [31:0]num1,num2;
output [31:0]result;

NOR2 nor0(.I0(num1[0]),.I1(num2[0]),.O(result[0]));
NOR2 nor1(.I0(num1[1]),.I1(num2[1]),.O(result[1]));
NOR2 nor2(.I0(num1[2]),.I1(num2[2]),.O(result[2]));
NOR2 nor3(.I0(num1[3]),.I1(num2[3]),.O(result[3]));
NOR2 nor4(.I0(num1[4]),.I1(num2[4]),.O(result[4]));
NOR2 nor5(.I0(num1[5]),.I1(num2[5]),.O(result[5]));
NOR2 nor6(.I0(num1[6]),.I1(num2[6]),.O(result[6]));
NOR2 nor7(.I0(num1[7]),.I1(num2[7]),.O(result[7]));
NOR2 nor8(.I0(num1[8]),.I1(num2[8]),.O(result[8]));
NOR2 nor9(.I0(num1[9]),.I1(num2[9]),.O(result[9]));
NOR2 nor10(.I0(num1[10]),.I1(num2[10]),.O(result[10]));
NOR2 nor11(.I0(num1[11]),.I1(num2[11]),.O(result[11]));
NOR2 nor12(.I0(num1[12]),.I1(num2[12]),.O(result[12]));
NOR2 nor13(.I0(num1[13]),.I1(num2[13]),.O(result[13]));
NOR2 nor14(.I0(num1[14]),.I1(num2[14]),.O(result[14]));
NOR2 nor15(.I0(num1[15]),.I1(num2[15]),.O(result[15]));
NOR2 nor16(.I0(num1[16]),.I1(num2[16]),.O(result[16]));
NOR2 nor17(.I0(num1[17]),.I1(num2[17]),.O(result[17]));
NOR2 nor18(.I0(num1[18]),.I1(num2[18]),.O(result[18]));
NOR2 nor19(.I0(num1[19]),.I1(num2[19]),.O(result[19]));
NOR2 nor20(.I0(num1[20]),.I1(num2[20]),.O(result[20]));
NOR2 nor21(.I0(num1[21]),.I1(num2[21]),.O(result[21]));
NOR2 nor22(.I0(num1[22]),.I1(num2[22]),.O(result[22]));
NOR2 nor23(.I0(num1[23]),.I1(num2[23]),.O(result[23]));
NOR2 nor24(.I0(num1[24]),.I1(num2[24]),.O(result[24]));
NOR2 nor25(.I0(num1[25]),.I1(num2[25]),.O(result[25]));
NOR2 nor26(.I0(num1[26]),.I1(num2[26]),.O(result[26]));
NOR2 nor27(.I0(num1[27]),.I1(num2[27]),.O(result[27]));
NOR2 nor28(.I0(num1[28]),.I1(num2[28]),.O(result[28]));
NOR2 nor29(.I0(num1[29]),.I1(num2[29]),.O(result[29]));
NOR2 nor30(.I0(num1[30]),.I1(num2[30]),.O(result[30]));
NOR2 nor31(.I0(num1[31]),.I1(num2[31]),.O(result[31]));

endmodule
