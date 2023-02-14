module t_ff_using_d_ff_tb;
	reg clk,rst,t_in;
	wire q,qn;

	t_ff_using_d_ff dut(clk,rst,t_in,q,qn);

	task initialize();
		begin
			{clk,rst,t_in} = 0;
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
			t_in = 1;
			#10;
			t_in = 0;
			#10;
			t_in = 1;
		end
endmodule

