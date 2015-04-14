`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:12:20 04/12/2015 
// Design Name: 
// Module Name:    Get_final_e 
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
module Get_final_e(
    input [7:0]e,
    input mark,
    output [7:0]e_final
    );
	 
	wire [15:0]tmp;
	wire [15:0]rubbish;
	
	CLA16bits adder_16bits({8'b0, e[7:0]}, 16'b1, 0, tmp[15:0], rubbish[15:0]);
	
	assign e_final[0] = (mark && tmp[0]) || (~mark && e[0]);
	assign e_final[1] = (mark && tmp[1]) || (~mark && e[1]);
	assign e_final[2] = (mark && tmp[2]) || (~mark && e[2]);
	assign e_final[3] = (mark && tmp[3]) || (~mark && e[3]);
	assign e_final[4] = (mark && tmp[4]) || (~mark && e[4]);
	assign e_final[5] = (mark && tmp[5]) || (~mark && e[5]);
	assign e_final[6] = (mark && tmp[6]) || (~mark && e[6]);
	assign e_final[7] = (mark && tmp[7]) || (~mark && e[7]);
 
endmodule
