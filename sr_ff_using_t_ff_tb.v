module sr_ff_using_t_ff_tb();
	reg clk,rst,s,r;
	wire q,qn;

	sr_ff_using_t_ff dut(clk,rst,s,r,q,qn);
	
	
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

	task stimulus_dut(input i,input j);
		begin
			@(negedge clk)
				s = i;r = j;
		end
	endtask

	initial
		begin
			initialize();
			#10;
			reset_dut();
			#10;
			stimulus_dut(0,0);
			#10;
			stimulus_dut(1,0);
			#10;
			stimulus_dut(0,0);
			#10;	
			stimulus_dut(0,1);
			#10;
			stimulus_dut(0,0);
			#10;
			reset_dut();
			#50 $finish;
		end
endmodule
	
