`timescale 1ns / 1ps

module as(clock,s,result);//algebra shift
input clock;
input s;
output [31:0]result;
wire [31:0]d;

AND2 and0(.I0(s),.I1(result[1]),.O(d[0]));
AND2 and1(.I0(s),.I1(result[2]),.O(d[1]));
AND2 and2(.I0(s),.I1(result[3]),.O(d[2]));
AND2 and3(.I0(s),.I1(result[4]),.O(d[3]));
AND2 and4(.I0(s),.I1(result[5]),.O(d[4]));
AND2 and5(.I0(s),.I1(result[6]),.O(d[5]));
AND2 and6(.I0(s),.I1(result[7]),.O(d[6]));
AND2 and7(.I0(s),.I1(result[8]),.O(d[7]));
AND2 and8(.I0(s),.I1(result[9]),.O(d[8]));
AND2 and9(.I0(s),.I1(result[10]),.O(d[9]));
AND2 and10(.I0(s),.I1(result[11]),.O(d[10]));
AND2 and11(.I0(s),.I1(result[12]),.O(d[11]));
AND2 and12(.I0(s),.I1(result[13]),.O(d[12]));
AND2 and13(.I0(s),.I1(result[14]),.O(d[13]));
AND2 and14(.I0(s),.I1(result[15]),.O(d[14]));
AND2 and15(.I0(s),.I1(result[16]),.O(d[15]));
AND2 and16(.I0(s),.I1(result[17]),.O(d[16]));
AND2 and17(.I0(s),.I1(result[18]),.O(d[17]));
AND2 and18(.I0(s),.I1(result[19]),.O(d[18]));
AND2 and19(.I0(s),.I1(result[20]),.O(d[19]));
AND2 and20(.I0(s),.I1(result[21]),.O(d[20]));
AND2 and21(.I0(s),.I1(result[22]),.O(d[21]));
AND2 and22(.I0(s),.I1(result[23]),.O(d[22]));
AND2 and23(.I0(s),.I1(result[24]),.O(d[23]));
AND2 and24(.I0(s),.I1(result[25]),.O(d[24]));
AND2 and25(.I0(s),.I1(result[26]),.O(d[25]));
AND2 and26(.I0(s),.I1(result[27]),.O(d[26]));
AND2 and27(.I0(s),.I1(result[28]),.O(d[27]));
AND2 and28(.I0(s),.I1(result[29]),.O(d[28]));
AND2 and29(.I0(s),.I1(result[30]),.O(d[29]));
AND2 and30(.I0(s),.I1(result[31]),.O(d[30]));
AND2 and31(.I0(s),.I1(result[31]),.O(d[31]));

FD fdq0(.C(clock),.D(d[0]),.Q(result[0]));
FD fdq1(.C(clock),.D(d[1]),.Q(result[1]));
FD fdq2(.C(clock),.D(d[2]),.Q(result[2]));
FD fdq3(.C(clock),.D(d[3]),.Q(result[3]));
FD fdq4(.C(clock),.D(d[4]),.Q(result[4]));
FD fdq5(.C(clock),.D(d[5]),.Q(result[5]));
FD fdq6(.C(clock),.D(d[6]),.Q(result[6]));
FD fdq7(.C(clock),.D(d[7]),.Q(result[7]));
FD fdq8(.C(clock),.D(d[8]),.Q(result[8]));
FD fdq9(.C(clock),.D(d[9]),.Q(result[9]));
FD fdq10(.C(clock),.D(d[10]),.Q(result[10]));
FD fdq11(.C(clock),.D(d[11]),.Q(result[11]));
FD fdq12(.C(clock),.D(d[12]),.Q(result[12]));
FD fdq13(.C(clock),.D(d[13]),.Q(result[13]));
FD fdq14(.C(clock),.D(d[14]),.Q(result[14]));
FD fdq15(.C(clock),.D(d[15]),.Q(result[15]));
FD fdq16(.C(clock),.D(d[16]),.Q(result[16]));
FD fdq17(.C(clock),.D(d[17]),.Q(result[17]));
FD fdq18(.C(clock),.D(d[18]),.Q(result[18]));
FD fdq19(.C(clock),.D(d[19]),.Q(result[19]));
FD fdq20(.C(clock),.D(d[20]),.Q(result[20]));
FD fdq21(.C(clock),.D(d[21]),.Q(result[21]));
FD fdq22(.C(clock),.D(d[22]),.Q(result[22]));
FD fdq23(.C(clock),.D(d[23]),.Q(result[23]));
FD fdq24(.C(clock),.D(d[24]),.Q(result[24]));
FD fdq25(.C(clock),.D(d[25]),.Q(result[25]));
FD fdq26(.C(clock),.D(d[26]),.Q(result[26]));
FD fdq27(.C(clock),.D(d[27]),.Q(result[27]));
FD fdq28(.C(clock),.D(d[28]),.Q(result[28]));
FD fdq29(.C(clock),.D(d[29]),.Q(result[29]));
FD fdq30(.C(clock),.D(d[30]),.Q(result[30]));
FD fdq31(.C(clock),.D(d[31]),.Q(result[31]));

endmodule
