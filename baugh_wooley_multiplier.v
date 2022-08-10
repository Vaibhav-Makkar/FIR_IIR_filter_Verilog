module  baugh_wooley_multiplier(a,b,p);

input [3:0] a,b;
output [7:0] p;
supply1 one;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23;

assign p[0] = a&b;

half_adder HA1(a[1]&b[0],a[0]&b[1],p[1],w1);
half_adder HA2(a[1]&b[0],a[0]&b[2],w2,w3);
half_adder HA3(~(a[3]&b[0]),a[2]&b[1],w4,w5);

Full_Adder_for_BW FA1(w2,w1,a[0]&b[2],p[2],w6);
Full_Adder_for_BW FA2(w4,w3,a[1]&b[2],w7,w8);
Full_Adder_for_BW FA3(w5,a[2]&b[2],~(a[3]&b[1]),w9,w10);

Full_Adder_for_BW FA4(w6,w7,~(a[0]&b[3]),p[3],w11);
Full_Adder_for_BW FA5(w8,w9,~(a[1]&b[3]),w12,w13);
Full_Adder_for_BW FA6(w10,~(a[2]&b[3]),~(a[3]&b[2]),w14,w15);

Full_Adder_for_BW FA7(one,w11,w12,p[4],w16);
half_adder HA4(w13,w14,w17,w18);

half_adder HA6(w16,w17,p[5],w21);
half_adder HA7(w18,w19,w22,w23);

half_adder HA8(w21,w22,p[7],p[6]);

endmodule