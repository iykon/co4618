`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:15 04/10/2015 
// Design Name: 
// Module Name:    top 
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
module top(clk,button_disp,button_cclt,inc_in,dec,anode,segment);
input clk;
input [3:0]button_disp;
input [3:0]button_cclt;//4 bits button_calculate
input [7:0]inc_in;
input dec;
output [11:0]anode;
output [15:0]segment;
reg [63:0]lastresult,mulir,result;
wire [31:0]andr,orr,norr,notr,asr,csr,llsr,lrsr,addir,subir,diviq,divir,addfr,subfr,mulfr,divfr;
wire sltr,sltur,sf0,cf0,of0,error,sf1,cf1,of1;
wire [7:0]inc;
reg [63:0]num1;
reg [31:0]num2;
reg [3:0]incdec;

and_32 and0(num1[31:0],num2,andr);
or_32 or0(num1[31:0],num2,orr);
nor_32 nor0(num1[31:0],num2,norr);
not_32 not0(num1[31:0],notr);
slt_32 slt0(num1[31:0],num2,sltr,sltur);

lls lls0(lastresult[31:0],llsr);
lrs lrs0(lastresult[31:0],lrsr);
as as0(lastresult[31:0],asr);
cs cs0(lastresult[31:0],csr);

CLA32bits cla0(num1[31:0],num2,0,addir,sf0,cf0,of0);
CLA32bits cla1(num1[31:0],num2,1,subir,sf1,cf1,of1);

//div_int divint0(clk,num1,num2,diviq,divir,error);

display_16 disp0(clk,result,button_disp[3:2],anode[11:8],segment[7:0]);
display_32 disp1(clk,{num1,num2},button_disp,anode[7:0],segment[15:8]);

always @* begin
	if(dec==1)
		incdec = 4'b1111;
	else
		incdec = 4'b0001;
end

always @(posedge inc[0]) begin
  case(button_disp[1:0])
    2'b00:num1[3:0] <= num1[3:0]+incdec;
    2'b10:num1[35:32] <= num1[35:32]+incdec;
    2'b01:num2[3:0] <= num2[3:0]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[1]) begin
  case(button_disp[1:0])
    2'b00:num1[7:4] <= num1[7:4]+incdec;
    2'b10:num1[39:36] <= num1[39:36]+incdec;
    2'b01:num2[7:4] <= num2[7:4]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[2]) begin
  case(button_disp[1:0])
    2'b00:num1[11:8] <= num1[11:8]+incdec;
    2'b10:num1[43:40] <= num1[43:40]+incdec;
    2'b01:num2[11:8] <= num2[11:8]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[3]) begin
  case(button_disp[1:0])
    2'b00:num1[15:12] <= num1[15:12]+incdec;
    2'b10:num1[47:44] <= num1[47:44]+incdec;
    2'b01:num2[15:12] <= num2[15:12]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[4]) begin
  case(button_disp[1:0])
    2'b00:num1[19:16] <= num1[19:16]+incdec;
    2'b10:num1[51:48] <= num1[51:48]+incdec;
    2'b01:num2[19:16] <= num2[19:16]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[5]) begin
  case(button_disp[1:0])
    2'b00:num1[23:20] <= num1[23:20]+incdec;
    2'b10:num1[55:52] <= num1[55:52]+incdec;
    2'b01:num2[23:20] <= num2[23:20]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[6]) begin
  case(button_disp[1:0])
    2'b00:num1[27:24] <= num1[27:24]+incdec;
    2'b10:num1[59:56] <= num1[59:56]+incdec;
    2'b01:num2[27:24] <= num2[27:24]+incdec;
    2'b11:;
  endcase
end
always @(posedge inc[7]) begin
  case(button_disp[1:0])
    2'b00:num1[31:28] <= num1[31:28]+incdec;
    2'b10:num1[63:60] <= num1[63:60]+incdec;
    2'b01:num2[31:28] <= num2[31:28]+incdec;
    2'b11:;
  endcase
end


always @* begin
  case(button_cclt)//4 bits button_calculate,most left refers to 4ze or not, a bit inferior to it refers to int,float,or shift
    4'b0000:begin
      lastresult <= result;
      result <= {32'b0,addir};
    end
    4'b0001:begin
      lastresult <= result;
      result <= {32'b0,subir};
    end
    4'b0010:begin
      lastresult <= result;
      result <= mulir;
    end
    4'b0011:begin
      lastresult <= result;
      result <= {32'b0,divir};
    end
    4'b0100:begin
      lastresult <= result;
      result <= {32'b0,addfr};
    end
    4'b0101:begin
      lastresult <= result;
      result <= {32'b0,subfr};
    end
    4'b0110:begin
      lastresult <= result;
      result <= {32'b0,mulfr};
    end
    4'b0111:begin
      lastresult <= result;
      result <= {32'b0,divfr};
    end
    4'b1000:begin
      lastresult <= result;
      result <= {32'b0,andr};
    end
    4'b1001:begin
      lastresult <= result;
      result <= {32'b0,orr};
    end
    4'b1010:begin
      lastresult <= result;
      result <= {32'b0,norr};
    end
    4'b1011:begin
      lastresult <= result;
      result <= {32'b0,notr};
    end
    4'b1100:begin
      lastresult <= result;
      result <= {32'b0,llsr};
    end
    4'b1101:begin
      lastresult <= result;
      result <= {32'b0,lrsr};
    end
    4'b1110:begin
      lastresult <= result;
      result <= {32'b0,asr};
    end
    4'b1111:begin
      lastresult <= result;
      result <= {32'b0,csr};
    end
  endcase
end

pbdebounce pb0(clk,inc_in[0],inc[0]);
pbdebounce pb1(clk,inc_in[1],inc[1]);
pbdebounce pb2(clk,inc_in[2],inc[2]);
pbdebounce pb3(clk,inc_in[3],inc[3]);
pbdebounce pb4(clk,inc_in[4],inc[4]);
pbdebounce pb5(clk,inc_in[5],inc[5]);
pbdebounce pb6(clk,inc_in[6],inc[6]);
pbdebounce pb7(clk,inc_in[7],inc[7]);

endmodule
