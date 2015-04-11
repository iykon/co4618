`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:12:19 04/09/2015
// Design Name:
// Module Name:    div_float
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
module div_float(
    input clk,
    input [31:0] dnd,
    input [31:0] der,
    output reg err,
    output reg [31:0] quo
    );

reg s1 = 0, s2 = 0, s = 0;
reg [8:0]e = 0;
reg [7:0]e1 = 0;
reg [7:0]e2 = 0;
reg [22:0]m = 0;
reg [23:0]m1 = 0;
reg [23:0]m2 = 0;
reg [31:0]mdnd = 0;
reg [31:0]mder = 0;
reg [63:0]A = 0;
reg [63:0]B = 0;
reg [63:0]P = 0;
reg [6:0]i = 0;

//div_intu m0(.clk(clk), .dnd(mdnd), .der(mder), .quo(mquo));
always @(posedge clk) begin
    // initialization
    s1 = dnd[31];
    s2 = der[31];
    e1 = dnd[30:23];
    e2 = der[30:23];
    m1[23] = 1;
    m1[22:0] = dnd[22:0];
    m2[23] = 1;
    m2[22:0] = der[22:0];
    e = e1 - e2 + 127;

    // mantissa division
    A = 0;
    A[63:40] = m1;
    B = 0;
    B[23:0] = m2;
    P = 64'b0;
    for (i = 0; i < 63; i = i + 1) begin
		P = P << 1;
		P[0] = A[63];
		A = A << 1;

		if (P[63] == 1) begin
			P = P + B;
		end
		else begin
			P = P - B;
		end

		if (P[63] == 1) begin
			A[0] = 0;
		end
		else begin
			A[0] = 1;
		end
    end

    // quotient mantissa shift
    while (A[63] == 0) begin
        e = e - 1;
        A = A << 1;
    end

    // record/align the result
    s = s1 ^ s2;
    e = e - 40 + 64;
    m = A[62:40];

    // quotient output
    quo[31] = s;
    quo[30:23] = e[7:0];
    quo[22:0] = m;

    // overflow dectection
    if ((e1[7] == e2[7]) && (e1[7] != e[7])) begin
        err = 1;
    end
    else begin
        err = 0;
    end
end

endmodule
