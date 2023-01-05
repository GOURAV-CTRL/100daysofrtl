module ripple_carry_adder(a,b,cin,sum,carry);

input [3:0]a;
input [3:0]b;
input cin;
output [3:0]sum;
output carry;


wire w1,w2,w3;

full_adder fa1(a[3],b[3],cin,sum[3],w1);
full_adder fa2(a[2],b[2],w1,sum[2],w2);
full_adder fa3(a[1],b[1],w2,sum[1],w3);
full_adder fa4(a[0],b[0],w3,sum[0],carry);





endmodule
