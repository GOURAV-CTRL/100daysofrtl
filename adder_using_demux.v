module adder_using_demux(a,b,cin,sum,carry);

	input a,b,cin;
	output sum,carry;
	reg temp1;
	reg temp2;

	Demultiplexer dut(1,a,b,cin,d0,d1,d2,d3,d4,d5,d6,d7);

	always@(*)
		begin
			temp1 = d1 + d2 +d4 +d7;
			temp2 = d3 + d5 + d6+d7;
		end
	assign sum = temp1;
	assign carry = temp2;
endmodule



