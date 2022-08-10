module iir_filter_tb;

reg clk,rst;
reg [3:0] a,x;
wire [3:0]y;

iir_filter f1(clk,rst,a,x,y);

initial 
begin
	clk = 0;
end

always 	
	# 5 clk = ~ clk;

initial
begin
	rst = 1;
	a  = 'd2;
	x  = 'd1;
	# 10 rst = 0;
	a  = 'd2;
	x  = 'd1;
	# 10 rst = 1;
	a  = 'd7;
	x = 'd10;
	# 20 $finish;
end

endmodule