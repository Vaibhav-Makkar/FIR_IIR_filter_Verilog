module full_adder(output sum, 
				  output carry_out, 
				  input x, 
				  input y, 
				  input carry_in);
				
wire prop, gen, pr_cin;

xor x1(prop,x,y);
xor x2(sum,prop,carry_in);

and a1(pr_cin, prop, carry_in);
and a2(gen, x, y);
or o1(carry_out, gen, pr_cin);

endmodule
