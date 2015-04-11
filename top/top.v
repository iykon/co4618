`timescale 1ns / 1ps

mudule top(num1,num2);
input clk;
input [63:0]num1;
input [31:0]num2;
input [2:0]button_disp;
input [3:0]button_cclt;//4 bits button_calculate
input [7:0]inc;
output [7:0]anode;
output [7:0]segment;
wire [63:0]lastresult,mulir,result;
wire [31:0]andr,orr,norr,notr,asr,csr,llsr,lrsr,asr,csr,addir,subir,diviq,divir,addfr,subrf,mulf,divfr;
wire sltr,sltur,sf,cf,of,error;

and_32 and0([31:0]num1,num2,andr);
or_32 or0([31:0]num1,num2,orr);
nor_32 nor0([31:0]num1,num2,norr);
not_32 not0([31:0]num1,notr);
slt_32 slt0([31:0]num1,num2,,sltr,sltur);

lls lls0([31:0]lastresult,llsr);
lrs lrs0([31:0]lastresult,lrsr);
as as0([31:0]lastresult,asr);
cs cs0([31:0]lastresult,csr);

CLA32bits cla0([31:0]num1,num2,0,addir,sf,cf,of);
CLA32bits cla1([31:0]num1,num2,1,subir,sf,cf,of);

div_int divint0(clk,num1,num2,diviq,divir,error);





display disp0(clk,{num1,num2,result},button_disp,anode,segment);

always @* begin//input to control num1 and num2, the button of increament
  if(button_disp[0]==0) begin
    if(button_disp[1]==0) begin
      always @(posedge inc[0]) num1[3:0] <= num1[3:0]+4'1;
      always @(posedge inc[1]) num1[3:0] <= num1[7:4]+4'1;
      always @(posedge inc[2]) num1[3:0] <= num1[11:8]+4'1;
      always @(posedge inc[3]) num1[3:0] <= num1[15:12]+4'1;
      always @(posedge inc[4]) num1[3:0] <= num1[19:16]+4'1;
      always @(posedge inc[5]) num1[3:0] <= num1[23:20]+4'1;
      always @(posedge inc[6]) num1[3:0] <= num1[27:24]+4'1;
      always @(posedge inc[7]) num1[3:0] <= num1[31:28]+4'1;
    end
    else begin
      always @(posedge inc[0]) num1[3:0] <= num1[35:32]+4'1;
      always @(posedge inc[1]) num1[3:0] <= num1[39:36]+4'1;
      always @(posedge inc[2]) num1[3:0] <= num1[43:40]+4'1;
      always @(posedge inc[3]) num1[3:0] <= num1[47:44]+4'1;
      always @(posedge inc[4]) num1[3:0] <= num1[51:48]+4'1;
      always @(posedge inc[5]) num1[3:0] <= num1[55:52]+4'1;
      always @(posedge inc[6]) num1[3:0] <= num1[59:56]+4'1;
      always @(posedge inc[7]) num1[3:0] <= num1[63:60]+4'1;
    end
  end
  else begin
    always @(posedge inc[0]) num2[3:0] <= num2[3:0]+4'1;
    always @(posedge inc[1]) num2[3:0] <= num2[7:4]+4'1;
    always @(posedge inc[2]) num2[3:0] <= num2[11:8]+4'1;
    always @(posedge inc[3]) num2[3:0] <= num2[15:12]+4'1;
    always @(posedge inc[4]) num2[3:0] <= num2[19:16]+4'1;
    always @(posedge inc[5]) num2[3:0] <= num2[23:20]+4'1;
    always @(posedge inc[6]) num2[3:0] <= num2[27:24]+4'1;
    always @(posedge inc[7]) num2[3:0] <= num2[31:28]+4'1;
  end
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

endmodule
