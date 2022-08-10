module fir_3tap_tb;

reg clk;
reg [7:0] Xin;
reg [7:0] H0;
reg [7:0] H1;
reg [7:0] H2;
wire [15:0] Yout;

fir_3tap uut(clk,Xin,H0,H1,H2,Yout);

initial
	 clk = 0;

always # 5 clk = ~ clk;

initial 
begin
	H0 = 'd10;
	H1 = 'd20;
	H2 = 'd30;
	Xin = 0;
	# 40 Xin = 3;
	# 10 Xin = 1;
	# 10 Xin = 1;
	# 10 Xin = 2;
	# 10 Xin = 1;
	# 10 Xin = 4;
	# 10 Xin = 5;
	# 10 Xin = 6;
	# 10 Xin = 0;
	# 10 $finish;
end

endmodule