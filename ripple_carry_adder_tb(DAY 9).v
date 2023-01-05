module ripple_carry_adder_tb();

reg [3:0]a;
reg [3:0]b;
reg cin;

wire [3:0]sum;
wire carry;

integer i;
integer j;



ripple_carry_adder dut(a,b,cin,sum,carry);

initial 
begin
 a = 4'b0000;
 b = 4'b0000;
 cin = 0;
 end
 
 initial 
 begin
 
 for(j=0;j<2;j=j+1)
 begin


 for(i=0;i<32;i=i+1)
 
 begin
 
 cin = j;
 {a,b} = i;
#100;
end
end
end
endmodule
 