module braun_multiplier(input [7:0] a, 
			input [7:0] b, 
			output [15:0] prod);

wire prod_buff [62:0];  // 63 buffers 
wire carry_buff [54:0] ; // Carry buffers
wire sum_buff [41:0] ; // 

// Partial Products with 64 AND Gates

and a1(prod[0],a[0],b[0]);  // No full adders needed 

and a2(prod_buff[0],a[1],b[0]);
and a3(prod_buff[1],a[0],b[1]);

and a4(prod_buff[2],a[2],b[0]);
and a5(prod_buff[3],a[1],b[1]);
and a6(prod_buff[4],a[0],b[2]);

and a7(prod_buff[5],a[3],b[0]);
and a8(prod_buff[6],a[2],b[1]);
and a9(prod_buff[7],a[1],b[2]);
and a10(prod_buff[8],a[0],b[3]);

and a11(prod_buff[9],a[4],b[0]);
and a12(prod_buff[10],a[3],b[1]);
and a13(prod_buff[11],a[2],b[2]);
and a14(prod_buff[12],a[1],b[3]);
and a15(prod_buff[13],a[0],b[4]);

and a16(prod_buff[14],a[5],b[0]);
and a17(prod_buff[15],a[4],b[1]);
and a18(prod_buff[16],a[3],b[2]);
and a19(prod_buff[17],a[2],b[3]);
and a20(prod_buff[18],a[1],b[4]);
and a21(prod_buff[19],a[0],b[5]);

and a22(prod_buff[20],a[6],b[0]);
and a23(prod_buff[21],a[5],b[1]);
and a24(prod_buff[22],a[4],b[2]);
and a25(prod_buff[23],a[3],b[3]);
and a26(prod_buff[24],a[2],b[4]);
and a27(prod_buff[25],a[1],b[5]);
and a28(prod_buff[26],a[0],b[6]);

and a29(prod_buff[27],a[7],b[0]);
and a30(prod_buff[28],a[6],b[1]);
and a31(prod_buff[29],a[5],b[2]);
and a32(prod_buff[30],a[4],b[3]);
and a33(prod_buff[31],a[3],b[4]);
and a34(prod_buff[32],a[2],b[5]);
and a35(prod_buff[33],a[1],b[6]);
and a36(prod_buff[34],a[0],b[7]);

and a37(prod_buff[35],a[7],b[1]);
and a38(prod_buff[36],a[6],b[2]);
and a39(prod_buff[37],a[5],b[3]);
and a40(prod_buff[38],a[4],b[4]);
and a41(prod_buff[39],a[3],b[5]);
and a42(prod_buff[40],a[2],b[6]);
and a43(prod_buff[41],a[1],b[7]);

and a44(prod_buff[42],a[7],b[2]);
and a45(prod_buff[43],a[6],b[3]);
and a46(prod_buff[44],a[5],b[4]);
and a47(prod_buff[45],a[4],b[5]);
and a48(prod_buff[46],a[3],b[6]);
and a49(prod_buff[47],a[2],b[7]);

and a50(prod_buff[48],a[7],b[3]);
and a51(prod_buff[49],a[6],b[4]);
and a52(prod_buff[50],a[5],b[5]);
and a53(prod_buff[51],a[4],b[6]);
and a54(prod_buff[52],a[3],b[7]);

and a55(prod_buff[53],a[7],b[4]);
and a56(prod_buff[54],a[6],b[5]);
and a57(prod_buff[55],a[5],b[6]);
and a58(prod_buff[56],a[4],b[7]);

and a59(prod_buff[57],a[7],b[5]);
and a60(prod_buff[58],a[6],b[6]);
and a61(prod_buff[59],a[5],b[7]);

and a62(prod_buff[60],a[7],b[6]);
and a63(prod_buff[61],a[6],b[7]);

and a64(prod_buff[62],a[7],b[7]);


// Adders arrays - 8*7 = 56 full adders

full_adder fa1  (prod[1],carry_buff[0],prod_buff[0],prod_buff[1],1'b0);
full_adder fa2  (sum_buff[0],carry_buff[1],prod_buff[2],prod_buff[3],carry_buff[0]);
full_adder fa3  (sum_buff[1],carry_buff[2],prod_buff[5],prod_buff[6],carry_buff[1]);
full_adder fa4  (sum_buff[2],carry_buff[3],prod_buff[9],prod_buff[10],carry_buff[2]);
full_adder fa5  (sum_buff[3],carry_buff[4],prod_buff[14],prod_buff[15],carry_buff[3]);
full_adder fa6  (sum_buff[4],carry_buff[5],prod_buff[20],prod_buff[21],carry_buff[4]);
full_adder fa7  (sum_buff[5],carry_buff[6],prod_buff[27],prod_buff[28],carry_buff[5]);
full_adder fa8  (sum_buff[6],carry_buff[7],prod_buff[35],1'b0,carry_buff[6]);

full_adder fa9  (prod[2],carry_buff[8],sum_buff[0],prod_buff[4],1'b0);
full_adder fa10 (sum_buff[7],carry_buff[9],sum_buff[1],prod_buff[7],carry_buff[8]);
full_adder fa11 (sum_buff[8],carry_buff[10],sum_buff[2],prod_buff[11],carry_buff[9]);
full_adder fa12 (sum_buff[9],carry_buff[11],sum_buff[3],prod_buff[16],carry_buff[10]);
full_adder fa13 (sum_buff[10],carry_buff[12],sum_buff[4],prod_buff[22],carry_buff[11]);
full_adder fa14 (sum_buff[11],carry_buff[13],sum_buff[5],prod_buff[29],carry_buff[12]);
full_adder fa15 (sum_buff[12],carry_buff[14],sum_buff[6],prod_buff[36],carry_buff[13]);
full_adder fa16 (sum_buff[13],carry_buff[15],prod_buff[42],carry_buff[7],carry_buff[14]);

full_adder fa17 (prod[3],carry_buff[16],sum_buff[7],prod_buff[8],1'b0);
full_adder fa18 (sum_buff[14],carry_buff[17],sum_buff[8],prod_buff[12],carry_buff[16]);
full_adder fa19 (sum_buff[15],carry_buff[18],sum_buff[9],prod_buff[17],carry_buff[17]);
full_adder fa20 (sum_buff[16],carry_buff[19],sum_buff[10],prod_buff[23],carry_buff[18]);
full_adder fa21 (sum_buff[17],carry_buff[20],sum_buff[11],prod_buff[30],carry_buff[19]);
full_adder fa22 (sum_buff[18],carry_buff[21],sum_buff[12],prod_buff[37],carry_buff[20]);
full_adder fa23 (sum_buff[19],carry_buff[22],sum_buff[13],prod_buff[43],carry_buff[21]);
full_adder fa24 (sum_buff[20],carry_buff[23],prod_buff[48],carry_buff[15],carry_buff[22]);

full_adder fa25 (prod[4],carry_buff[24],sum_buff[14],prod_buff[13],1'b0);
full_adder fa26 (sum_buff[21],carry_buff[25],sum_buff[15],prod_buff[18],carry_buff[24]);
full_adder fa27 (sum_buff[22],carry_buff[26],sum_buff[16],prod_buff[24],carry_buff[25]);
full_adder fa28 (sum_buff[23],carry_buff[27],sum_buff[17],prod_buff[31],carry_buff[26]);
full_adder fa29 (sum_buff[24],carry_buff[28],sum_buff[18],prod_buff[38],carry_buff[27]);
full_adder fa30 (sum_buff[25],carry_buff[29],sum_buff[19],prod_buff[44],carry_buff[28]);
full_adder fa31 (sum_buff[26],carry_buff[30],sum_buff[20],prod_buff[49],carry_buff[29]);
full_adder fa32 (sum_buff[27],carry_buff[31],prod_buff[53],carry_buff[23],carry_buff[30]);

full_adder fa33 (prod[5],carry_buff[32],sum_buff[21],prod_buff[19],1'b0);
full_adder fa34 (sum_buff[28],carry_buff[33],sum_buff[22],prod_buff[25],carry_buff[32]);
full_adder fa35 (sum_buff[29],carry_buff[34],sum_buff[23],prod_buff[32],carry_buff[33]);
full_adder fa36 (sum_buff[30],carry_buff[35],sum_buff[24],prod_buff[39],carry_buff[34]);
full_adder fa37 (sum_buff[31],carry_buff[36],sum_buff[25],prod_buff[45],carry_buff[35]);
full_adder fa38 (sum_buff[32],carry_buff[37],sum_buff[26],prod_buff[50],carry_buff[36]);
full_adder fa39 (sum_buff[33],carry_buff[38],sum_buff[27],prod_buff[54],carry_buff[37]);
full_adder fa40 (sum_buff[34],carry_buff[39],prod_buff[57],carry_buff[31],carry_buff[38]);

full_adder fa41 (prod[6],carry_buff[40],sum_buff[28],prod_buff[26],1'b0);
full_adder fa42 (sum_buff[35],carry_buff[41],sum_buff[29],prod_buff[33],carry_buff[40]);
full_adder fa43 (sum_buff[36],carry_buff[42],sum_buff[30],prod_buff[40],carry_buff[41]);
full_adder fa44 (sum_buff[37],carry_buff[43],sum_buff[31],prod_buff[46],carry_buff[42]);
full_adder fa45 (sum_buff[38],carry_buff[44],sum_buff[32],prod_buff[51],carry_buff[43]);
full_adder fa46 (sum_buff[39],carry_buff[45],sum_buff[33],prod_buff[55],carry_buff[44]);
full_adder fa47 (sum_buff[40],carry_buff[46],sum_buff[34],prod_buff[58],carry_buff[45]);
full_adder fa48 (sum_buff[41],carry_buff[47],prod_buff[60],carry_buff[39],carry_buff[46]);

full_adder fa49 (prod[7],carry_buff[48],sum_buff[35],prod_buff[34],1'b0);
full_adder fa50 (prod[8],carry_buff[49],sum_buff[36],prod_buff[41],carry_buff[48]);
full_adder fa51 (prod[9],carry_buff[50],sum_buff[37],prod_buff[47],carry_buff[49]);
full_adder fa52 (prod[10],carry_buff[51],sum_buff[38],prod_buff[52],carry_buff[50]);
full_adder fa53 (prod[11],carry_buff[52],sum_buff[39],prod_buff[56],carry_buff[51]);
full_adder fa54 (prod[12],carry_buff[53],sum_buff[40],prod_buff[59],carry_buff[52]);
full_adder fa55 (prod[13],carry_buff[54],sum_buff[41],prod_buff[61],carry_buff[53]);
full_adder fa56 (prod[14],prod[15],prod_buff[62],carry_buff[47],carry_buff[54]);

endmodule