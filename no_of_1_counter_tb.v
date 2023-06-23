module no_of_1_counter_tb();
	reg [2:0]a,b;
		reg c;

		wire [1:0] count;

	wire [2:0] sum,carry;

	ones_counter_3bit_using_fa dut(a,b,c,sum,carry);
	
initial
	begin
		{a,b,c} = 0;
	end

initial
	begin
		a = 1'b0;
		b = 1'b1;
		c = 1'b0;

		#10;
		
		a = 1'b1;
		b = 1'b1;
		c = 1'b1;
	
		
		
		//#100 $finish;
	end

	assign count = {carry[0],sum[0]};

	initial
		begin
			$monitor("the no.of 1's are equal to %b",count);
			#100 $finish;

		end

endmodule

