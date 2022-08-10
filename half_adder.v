module half_adder(x,y,s,cout);
input x,y;
output s,cout;
assign s = x^y;
assign cout = x&y;
endmodule
