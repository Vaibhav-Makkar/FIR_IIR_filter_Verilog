module iir_filter(clk,rst,a,x,y);

input clk,rst;
input [3:0] a,x;
output [3:0]y;
reg [3:0] y_val;
wire [7:0] baugh_prod_actual;

baugh_wooley_multiplier bw1(a,y_val,baugh_prod_actual);

always @(posedge clk, posedge rst, posedge x, posedge a)
begin
	if(rst)
	begin
		y_val <= x;
	end
	else
	begin
		y_val <= x + baugh_prod_actual[3:0];
	end
end

assign y = y_val;

endmodule