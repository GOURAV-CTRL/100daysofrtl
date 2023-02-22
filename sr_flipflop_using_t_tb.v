module sr_flipflop_using_t_tb();
	reg clk,rst,s,r;
	wire q,qn;
sr_flipflop_using_t dut(clk,rst,s,r,q,qn);

task initialize();
	begin
		{clk,rst,s,r} = 0;
	end
endtask

always #10 clk = ~clk;

task reset_dut();
	begin
		@(negedge clk)
		rst = 1;
		@(negedge clk)
		rst = 0;
	end
endtask

initial
	begin
		initialize();
		#10;
		reset_dut();
		#10;
		s = 0;r=0;
		#10;
		s = 0;r=1;
		#10;
		s = 1;r=0;
		#10 $finish;
	end
endmodule

