module twotofour_decoder_tb();

reg a,b;
wire y1,y2,y3,y4;

integer i;

twotofour_decoder dut(a,b,y1,y2,y3,y4);

initial
begin

a = 1'b0;
b = 1'b0;

end

initial
begin

for (i=0;i<5;i=i+1)

begin

{a,b} = i;

#100;


end
end



initial
$monitor("a=%b,b=%b,y1=%b,y2=%b,y3=%b,y4=%b",a,b,y1,y2,y3,y4);

initial #100 $finish;




endmodule
