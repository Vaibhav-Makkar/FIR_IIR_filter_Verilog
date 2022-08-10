module Full_Adder_for_BW(x,y,cin,s,cout);

input x,y,cin;
output s,cout;

assign s = x^y^cin;
assign cout = (x&y)|(y&cin)|(x&cin);

endmodule