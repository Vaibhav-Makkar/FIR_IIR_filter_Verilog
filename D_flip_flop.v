module D_flip_flop(input clk, 
				   input [15:0] D, 
				   output reg [15:0] Q);
always @(posedge clk)
Q<=D;
endmodule