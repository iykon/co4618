`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:41:47 04/12/2015 
// Design Name: 
// Module Name:    Get_real_final_P 
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
module Get_real_final_P(
    input [22:0]P_final,
    input markr,
    input marks,
    output [22:0]P_real_final
    );
	 
	wire [31:0]tmp;
	wire sf;
	wire cf;
	wire of;
	
	CLA32bits adder_32bits({9'b0, P_final[22:0]}, 32'b1, 0, tmp[31:0], sf, cf, of);
	
	assign P_real_final[0] = ((markr && marks) && tmp[0]) || (~(markr && marks) && P_final[0]);
	assign P_real_final[1] = ((markr && marks) && tmp[1]) || (~(markr && marks) && P_final[1]);
	assign P_real_final[2] = ((markr && marks) && tmp[2]) || (~(markr && marks) && P_final[2]);
	assign P_real_final[3] = ((markr && marks) && tmp[3]) || (~(markr && marks) && P_final[3]);
	assign P_real_final[4] = ((markr && marks) && tmp[4]) || (~(markr && marks) && P_final[4]);
	assign P_real_final[5] = ((markr && marks) && tmp[5]) || (~(markr && marks) && P_final[5]);
	assign P_real_final[6] = ((markr && marks) && tmp[6]) || (~(markr && marks) && P_final[6]);
	assign P_real_final[7] = ((markr && marks) && tmp[7]) || (~(markr && marks) && P_final[7]);
	assign P_real_final[8] = ((markr && marks) && tmp[8]) || (~(markr && marks) && P_final[8]);
	assign P_real_final[9] = ((markr && marks) && tmp[9]) || (~(markr && marks) && P_final[9]);
	assign P_real_final[10] = ((markr && marks) && tmp[10]) || (~(markr && marks) && P_final[10]);
	assign P_real_final[11] = ((markr && marks) && tmp[11]) || (~(markr && marks) && P_final[11]);
	assign P_real_final[12] = ((markr && marks) && tmp[12]) || (~(markr && marks) && P_final[12]);
	assign P_real_final[13] = ((markr && marks) && tmp[13]) || (~(markr && marks) && P_final[13]);
	assign P_real_final[14] = ((markr && marks) && tmp[14]) || (~(markr && marks) && P_final[14]);
	assign P_real_final[15] = ((markr && marks) && tmp[15]) || (~(markr && marks) && P_final[15]);
	assign P_real_final[16] = ((markr && marks) && tmp[16]) || (~(markr && marks) && P_final[16]);
	assign P_real_final[17] = ((markr && marks) && tmp[17]) || (~(markr && marks) && P_final[17]);
	assign P_real_final[18] = ((markr && marks) && tmp[18]) || (~(markr && marks) && P_final[18]);
	assign P_real_final[19] = ((markr && marks) && tmp[19]) || (~(markr && marks) && P_final[19]);
	assign P_real_final[20] = ((markr && marks) && tmp[20]) || (~(markr && marks) && P_final[20]);
	assign P_real_final[21] = ((markr && marks) && tmp[21]) || (~(markr && marks) && P_final[21]);
	assign P_real_final[22] = ((markr && marks) && tmp[22]) || (~(markr && marks) && P_final[22]);
		
endmodule
