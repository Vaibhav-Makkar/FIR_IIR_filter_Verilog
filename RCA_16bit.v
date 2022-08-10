module RCA_16bit(output [15:0] sum, 
				 output cout, 
				 input [15:0] a,b);

wire [15:1] c;

full_adder faa(sum[0], c[1], a[0], b[0], 1'b0);
full_adder fa[14:1](sum[14:1], c[15:2], a[14:1], b[14:1], c[14:1]);
full_adder fa15(sum[15], cout, a[15], b[15], c[15]);

endmodule
