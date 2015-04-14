`timescale 1ns / 1ps
module and_32(num1,num2,result);
input [31:0]num1,num2;
output [31:0]result;

AND2 and0(.I0(num1[0]),.I1(num2[0]),.O(result[0]));
AND2 and1(.I0(num1[1]),.I1(num2[1]),.O(result[1]));
AND2 and2(.I0(num1[2]),.I1(num2[2]),.O(result[2]));
AND2 and3(.I0(num1[3]),.I1(num2[3]),.O(result[3]));
AND2 and4(.I0(num1[4]),.I1(num2[4]),.O(result[4]));
AND2 and5(.I0(num1[5]),.I1(num2[5]),.O(result[5]));
AND2 and6(.I0(num1[6]),.I1(num2[6]),.O(result[6]));
AND2 and7(.I0(num1[7]),.I1(num2[7]),.O(result[7]));
AND2 and8(.I0(num1[8]),.I1(num2[8]),.O(result[8]));
AND2 and9(.I0(num1[9]),.I1(num2[9]),.O(result[9]));
AND2 and10(.I0(num1[10]),.I1(num2[10]),.O(result[10]));
AND2 and11(.I0(num1[11]),.I1(num2[11]),.O(result[11]));
AND2 and12(.I0(num1[12]),.I1(num2[12]),.O(result[12]));
AND2 and13(.I0(num1[13]),.I1(num2[13]),.O(result[13]));
AND2 and14(.I0(num1[14]),.I1(num2[14]),.O(result[14]));
AND2 and15(.I0(num1[15]),.I1(num2[15]),.O(result[15]));
AND2 and16(.I0(num1[16]),.I1(num2[16]),.O(result[16]));
AND2 and17(.I0(num1[17]),.I1(num2[17]),.O(result[17]));
AND2 and18(.I0(num1[18]),.I1(num2[18]),.O(result[18]));
AND2 and19(.I0(num1[19]),.I1(num2[19]),.O(result[19]));
AND2 and20(.I0(num1[20]),.I1(num2[20]),.O(result[20]));
AND2 and21(.I0(num1[21]),.I1(num2[21]),.O(result[21]));
AND2 and22(.I0(num1[22]),.I1(num2[22]),.O(result[22]));
AND2 and23(.I0(num1[23]),.I1(num2[23]),.O(result[23]));
AND2 and24(.I0(num1[24]),.I1(num2[24]),.O(result[24]));
AND2 and25(.I0(num1[25]),.I1(num2[25]),.O(result[25]));
AND2 and26(.I0(num1[26]),.I1(num2[26]),.O(result[26]));
AND2 and27(.I0(num1[27]),.I1(num2[27]),.O(result[27]));
AND2 and28(.I0(num1[28]),.I1(num2[28]),.O(result[28]));
AND2 and29(.I0(num1[29]),.I1(num2[29]),.O(result[29]));
AND2 and30(.I0(num1[30]),.I1(num2[30]),.O(result[30]));
AND2 and31(.I0(num1[31]),.I1(num2[31]),.O(result[31]));


endmodule
