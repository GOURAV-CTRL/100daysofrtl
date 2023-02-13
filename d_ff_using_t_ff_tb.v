module d_ff_using_t_ff_tb;
	reg clk,rst,d_in;
	wire q,qn;
t_flipflop dut(clk,rst,d_in,q,qn);

task initialize();
	begin
		{clk,rst,d_in} = 0;
	end
endtask

always #10 clk = ~clk;

initial
	begin
		initialize();
		#10;
		@(negedge clk)
		rst = 1;
		@(negedge clk)
		rst = 0;
		#10;
		@(negedge clk)

		d_in = 1;
		#10;
		@(negedge clk)

		d_in = 0;
		#10 $finish;
	end
endmodule

