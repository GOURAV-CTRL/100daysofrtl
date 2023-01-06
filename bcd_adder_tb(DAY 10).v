module bcd_adder_tb;
	reg  a,b,c_in;
	wire [3:0] sum;
	wire carry;
	
	bcd_adder dut(a,b,c_in,sum,carry);

initial
	begin
		a = 0;  b = 0;  c_in = 0;   #100;
        a = 6;  b = 9;  c_in = 0;   #100;
        a = 3;  b = 3;  c_in = 1;   #100;
        a = 4;  b = 5;  c_in = 0;   #100;
        a = 8;  b = 2;  c_in = 0;   #100;
        a = 9;  b = 9;  c_in = 1;   #100;

	end
endmodule
