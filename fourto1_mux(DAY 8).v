module fourto1_mux(i,s,y);

input [3:0]i;
input [1:0]s;

output y;

wire w1,w2;

twoto1_mux m1(i[3],i[2],s[1],w1);

twoto1_mux m2(i[1],i[0],s[1],w2);

twoto1_mux m3(w1,w2,s[0],y);
endmodule
