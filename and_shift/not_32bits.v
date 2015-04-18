`timescale 1ns / 1ps
module not_32(num,result);
input [31:0]num;
output [31:0]result;

INV inv0(.I(num[0]),.O(result[0]));
INV inv1(.I(num[1]),.O(result[1]));
INV inv2(.I(num[2]),.O(result[2]));
INV inv3(.I(num[3]),.O(result[3]));
INV inv4(.I(num[4]),.O(result[4]));
INV inv5(.I(num[5]),.O(result[5]));
INV inv6(.I(num[6]),.O(result[6]));
INV inv7(.I(num[7]),.O(result[7]));
INV inv8(.I(num[8]),.O(result[8]));
INV inv9(.I(num[9]),.O(result[9]));
INV inv10(.I(num[10]),.O(result[10]));
INV inv11(.I(num[11]),.O(result[11]));
INV inv12(.I(num[12]),.O(result[12]));
INV inv13(.I(num[13]),.O(result[13]));
INV inv14(.I(num[14]),.O(result[14]));
INV inv15(.I(num[15]),.O(result[15]));
INV inv16(.I(num[16]),.O(result[16]));
INV inv17(.I(num[17]),.O(result[17]));
INV inv18(.I(num[18]),.O(result[18]));
INV inv19(.I(num[19]),.O(result[19]));
INV inv20(.I(num[20]),.O(result[20]));
INV inv21(.I(num[21]),.O(result[21]));
INV inv22(.I(num[22]),.O(result[22]));
INV inv23(.I(num[23]),.O(result[23]));
INV inv24(.I(num[24]),.O(result[24]));
INV inv25(.I(num[25]),.O(result[25]));
INV inv26(.I(num[26]),.O(result[26]));
INV inv27(.I(num[27]),.O(result[27]));
INV inv28(.I(num[28]),.O(result[28]));
INV inv29(.I(num[29]),.O(result[29]));
INV inv30(.I(num[30]),.O(result[30]));
INV inv31(.I(num[31]),.O(result[31]));

endmodule
