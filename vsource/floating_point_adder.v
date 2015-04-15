`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:23:13 04/09/2015 
// Design Name: 
// Module Name:    floating_point_adder 
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
module floating_point_adder(
	input wire clk,
	input wire [31:0] A,
	input wire [31:0] B,
	input wire op,	
	output wire [31:0] res,
	output reg error
	    );
	 
	wire operator;
	wire [8:0]exp_diff;
	wire [25:0] mant_A;
	wire [25:0] mant_B;
 

	 
	 wire [7:0]lexp;
	 wire [24:0]temp_res;
	 wire temp_sign;
	 reg [24:0]rtemp;
	 reg [7:0]etemp;	 
	 reg [22:0]final_res;
	 reg [7:0]final_exp;
	 reg [5:0] count;
	 reg last;
	 initial begin 
		count[5:0]=6'b000000;
		error=0;
		last=0;
	 end
	assign operator=B[31]^A[31]^op;
	assign	res[31]=A[31]^temp_sign; 
	assign res[22:0]=final_res;
	assign res[30:23]=final_exp;
	Small_ALU SA_instance(clk, A[30:23], B[30:23],exp_diff[8:0],lexp);
	Mantissa_Shift MS_instance(clk,A, B,exp_diff,mant_A, mant_B);
	Big_ALU BA_instance(clk, mant_A, mant_B, operator, temp_res, temp_sign);
	
	always@(posedge clk)begin
		if(count==0) begin
			rtemp[24:0]=temp_res[24:0];
			etemp=lexp;
			count[5:0]=count[5:0]+1'b1;
			error=0;
			last=0;
		end
		else begin
			if(etemp==0) begin
				final_res=0;
				fianl_exp=0;
				count[5:0]=6'b000000;
			end
			else if(etemp==8'hff) begin
				if(rtemp==0) begin
					final_res=23'h7fffff;
					final_exp=8'hff;
				end
				else begin
					error=1;
				end
			end
			else if(rtemp>=25'h1000000)begin
				last=rtemp[0];
				rtemp=rtemp>>1'b1;
				etemp=etemp+1;
				count[5:0]=count[5:0]+1'b1;
			end
			else if(rtemp<=25'h0800000)begin
				rtemp=rtemp<<1'b1;
				etemp=etemp-1;
				count[5:0]=count[5:0]+1'b1;
			end 
			else begin
				rtemp=rtemp+last;
				final_res<=rtemp[22:0];
				final_exp<=etemp;
				count[5:0]=6'b000000;
			end
		end
	end
endmodule
