`timescale 1ns / 1ps
module or_32(num1,num2,result);
input [31:0]num1,num2;
output [31:0]result;

OR2 or0(.I0(num1[0]),.I1(num2[0]),.O(result[0]));
OR2 or1(.I0(num1[1]),.I1(num2[1]),.O(result[1]));
OR2 or2(.I0(num1[2]),.I1(num2[2]),.O(result[2]));
OR2 or3(.I0(num1[3]),.I1(num2[3]),.O(result[3]));
OR2 or4(.I0(num1[4]),.I1(num2[4]),.O(result[4]));
OR2 or5(.I0(num1[5]),.I1(num2[5]),.O(result[5]));
OR2 or6(.I0(num1[6]),.I1(num2[6]),.O(result[6]));
OR2 or7(.I0(num1[7]),.I1(num2[7]),.O(result[7]));
OR2 or8(.I0(num1[8]),.I1(num2[8]),.O(result[8]));
OR2 or9(.I0(num1[9]),.I1(num2[9]),.O(result[9]));
OR2 or10(.I0(num1[10]),.I1(num2[10]),.O(result[10]));
OR2 or11(.I0(num1[11]),.I1(num2[11]),.O(result[11]));
OR2 or12(.I0(num1[12]),.I1(num2[12]),.O(result[12]));
OR2 or13(.I0(num1[13]),.I1(num2[13]),.O(result[13]));
OR2 or14(.I0(num1[14]),.I1(num2[14]),.O(result[14]));
OR2 or15(.I0(num1[15]),.I1(num2[15]),.O(result[15]));
OR2 or16(.I0(num1[16]),.I1(num2[16]),.O(result[16]));
OR2 or17(.I0(num1[17]),.I1(num2[17]),.O(result[17]));
OR2 or18(.I0(num1[18]),.I1(num2[18]),.O(result[18]));
OR2 or19(.I0(num1[19]),.I1(num2[19]),.O(result[19]));
OR2 or20(.I0(num1[20]),.I1(num2[20]),.O(result[20]));
OR2 or21(.I0(num1[21]),.I1(num2[21]),.O(result[21]));
OR2 or22(.I0(num1[22]),.I1(num2[22]),.O(result[22]));
OR2 or23(.I0(num1[23]),.I1(num2[23]),.O(result[23]));
OR2 or24(.I0(num1[24]),.I1(num2[24]),.O(result[24]));
OR2 or25(.I0(num1[25]),.I1(num2[25]),.O(result[25]));
OR2 or26(.I0(num1[26]),.I1(num2[26]),.O(result[26]));
OR2 or27(.I0(num1[27]),.I1(num2[27]),.O(result[27]));
OR2 or28(.I0(num1[28]),.I1(num2[28]),.O(result[28]));
OR2 or29(.I0(num1[29]),.I1(num2[29]),.O(result[29]));
OR2 or30(.I0(num1[30]),.I1(num2[30]),.O(result[30]));
OR2 or31(.I0(num1[31]),.I1(num2[31]),.O(result[31]));

endmodule
