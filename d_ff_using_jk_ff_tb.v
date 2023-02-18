module d_ff_using_jk_ff_tb();
	reg clk,rst,d_in;
	wire q,qn;

	d_ff_using_jk_ff dut(clk,rst,d_in,q,qn);

	task initialize();
		begin
			{clk,rst,d_in} = 0;
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

	task stimulus_dut(input m);
		begin
			@(negedge clk)
			d_in = m;
		end
	endtask

	initial
		begin
			initialize();
			#10;
			reset_dut();
			#10;
			stimulus_dut(0);
			#10;	
			stimulus_dut(1);
			#10;
			stimulus_dut(0);
			#10;
			stimulus_dut(0);
			#10;
			stimulus_dut(1);
			#10;
			stimulus_dut(1);
			#10;
			stimulus_dut(0);
			#50 $finish;
		end
endmodule
		
