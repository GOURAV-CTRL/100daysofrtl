module fourto1_mux_tb();

reg a,b,c,d;
reg [1:0]s;
wire y;

integer k;
integer j;

fourto1_mux dut(a,b,c,d,s,y);

initial
begin
{a,b,c,d}=4'b0000;
s=2'b00;
end

initial
begin

for(k=0;k<4;k=k+1)


for (j=0;j<16;j=j+1)

begin
s=k;
{a,b,c,d}=j;


#10;
end
end
endmodule
