module fir_3tap (input clk, 
				 input [7:0] Xin, 
				 input [7:0] H0, 
				 input [7:0] H1,
				 input [7:0] H2,
				 output reg [15:0] Yout);

wire [15:0] M0,M1,M2, add_out1, add_out2;
wire [15:0] Q1,Q2;
//Braun Multipliers Instantiation

braun_multiplier m1(Xin,H2,M2);
braun_multiplier m2(Xin,H1,M1);
braun_multiplier m3(Xin,H0,M0);

//Adders
RCA_16bit r1(.sum(add_out1),.a(Q1),.b(M1));
RCA_16bit r2(.sum(add_out2),.a(Q2),.b(M0));

// D-flip flops for Delays x(n-1) etc
D_flip_flop dff1(clk,M2,Q1);
D_flip_flop dff2(clk,add_out1,Q2);

// Last adder output for final output 
always @(posedge clk)
Yout <= add_out2;

endmodule