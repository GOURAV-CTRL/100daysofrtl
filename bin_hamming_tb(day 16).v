module bin_hamming_tb;
reg clk;
reg [4:1] d;
wire [7:1] c;

bin_hamming dut(clk,d,c);

initial
begin
forever
begin
clk=1;
#50 clk=0;
#50 clk=1;
end
end
initial
begin
d=4'b0000;
#100 d=4'b0001;
#100 d=4'b0010;
#100 d=4'b0011;
#100 d=4'b0100;
#100 d=4'b0101;
#100 d=4'b0110;
#100 d=4'b0111;
#100 d=4'b1000;
#100 d=4'b1001;
#100 d=4'b1010;
#100 d=4'b1011;
#100 d=4'b1100;
#100 d=4'b1101;
#100 d=4'b1110;
#100 d=4'b1111;
end
initial
begin
$monitor($time,"clk=%b,d=%b,c=%b",clk,d,c);
end
endmodule 
