module display(clk,disp_reg,disp_ctrl,digit_anode,segment);
input clk;
input wire [159:0] disp_reg;
input wire [3:0]   disp_ctrl;
output reg [11:0]  digit_anode;
output reg [7:0]   segment;
wire [47:0]disp_num;
reg [12:0] cnt=0;
reg [3:0] num;

always@(posedge clk)begin//时钟
		case(cnt[12:9])//分屏显示的时间间隔，将13位计数器的最高3位作为变换的频率
			4'b0000:begin//000时显示0-3位，即第一个数字，以下类似
			  digit_anode <= 12'b111111111110;
        num <= disp_num[3:0];
			  end
			4'b0001:begin
			  digit_anode <= 12'b111111111101;
			  num <= disp_num[7:4];
			  end
			4'b0010:begin
			  digit_anode <= 12'b111111111011;
				num <= disp_num[11:8];
			  end
			4'b0011:begin
			  digit_anode <= 12'b111111110111;
			  num <= disp_num[15:12];
			  end
			4'b0100:begin
			  digit_anode <= 12'b111111101111;
			  num <= disp_num[19:16];
			  end
			4'b0101:begin
			  digit_anode <= 12'b111111011111;
			  num <= disp_num[23:20];
			  end
			4'b0110:begin
			  digit_anode <= 12'b111110111111;
				num <= disp_num[27:24];
			  end
      4'b0111:begin
        digit_anode <= 12'b111101111111;
        num <= disp_num[31:28];
        end
      4'b1000:begin
        digit_anode <= 12'b111011111111;
        num <= disp_num[35:32];
        end
      4'b1001:begin
        digit_anode <= 12'b110111111111;
        num <= disp_num[39:36];
        end
      4'b1010:begin
        digit_anode <= 12'b101111111111;
        num <= disp_num[43:40];
        end
      4'b1011:begin
        digit_anode <= 12'b011111111111;
        num <= disp_num[47:44];
        end
		endcase
    case(num)//在LED灯上将要显示的数字对应的数码管点亮以显示数字num
			4'b0000:segment<=8'b11000000;
			4'b0001:segment<=8'b11111001;
			4'b0010:segment<=8'b10100100;
			4'b0011:segment<=8'b10110000;
			4'b0100:segment<=8'b10011001;
			4'b0101:segment<=8'b10010010;
			4'b0110:segment<=8'b10000010;
			4'b0111:segment<=8'b11111000;
			4'b1000:segment<=8'b10000000;
			4'b1001:segment<=8'b10010000;
			4'b1010:segment<=8'b10001000;
			4'b1011:segment<=8'b10000011;
			4'b1100:segment<=8'b11000110;
			4'b1101:segment<=8'b10100001;
			4'b1110:segment<=8'b10000110;
			4'b1111:segment<=8'b10001110;
		endcase
    case(disp_ctrl)
			4'b0000:disp_num <= {[15:0]disp_reg,[127:96]disp_reg};
			4'b0001:disp_num <= {[15:0]disp_reg,[95:64]disp_reg};
			4'b0010:disp_num <= {[15:0]disp_reg,[159:128]disp_reg};
			4'b0011:disp_num <= {[15:0]disp_reg,32'b0};
			4'b0100:disp_num <= {[31:16]disp_reg,[127:96]disp_reg};
			4'b0101:disp_num <= {[31:16]disp_reg,[95:64]disp_reg};
			4'b0110:disp_num <= {[31:16]disp_reg,[159:128]disp_reg};
			4'b0111:disp_num <= {[31:16]disp_reg,32'b0};
			4'b1000:disp_num <= {[47:32]disp_reg,[127:96]disp_reg};
			4'b1001:disp_num <= {[47:32]disp_reg,[95:64]disp_reg};
			4'b1010:disp_num <= {[47:32]disp_reg,[159:128]disp_reg};
			4'b1011:disp_num <= {[47:32]disp_reg,32'b0};
			4'b1100:disp_num <= {[63:48]disp_reg,[127:96]disp_reg};
			4'b1101:disp_num <= {[63:48]disp_reg,[95:64]disp_reg};
			4'b1110:disp_num <= {[63:48]disp_reg,[159:128]disp_reg};
			4'b1111:disp_num <= {[63:48]disp_reg,32'b0};
    endcase
	end

	always@(posedge clk) begin //计时器+1
			cnt<=cnt+1;
	end
endmodule
