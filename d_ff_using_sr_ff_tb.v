module d_ff_using_sr_ff_tb();
	reg clk,rst,d_in;
	wire q,qn;
	
	d_ff_using_sr_ff dut (clk,rst,d_in,q,qn);
		
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
			@(negedge clk)
			d_in = 1;
			@(negedge clk)
			d_in = 0;
			@(negedge clk)
			d_in = 1;
			#10;
			#20 $finish;
		end
endmodule

