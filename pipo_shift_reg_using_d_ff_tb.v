module pipo_reg_using_d_ff_tb();

	reg clk,rst,p_in1,p_in2,p_in3,p_in4;
	
	wire p_out1,p_out2,p_out3,p_out4;

	pipo_shift_reg_using_d_ff dut(clk,rst,p_in1,p_in2,p_in3,p_in4,p_out1,p_out2,p_out3,p_out4);
	
	task initialize();
		begin
			{clk,rst,p_in1,p_in2,p_in3,p_in4} = 0;
		end
	endtask

	always #10 clk = ~clk;

	task stimulus_dut(input c,d,e,f);
		begin
			
			@(negedge clk)
				 p_in1 = c;
				 p_in2 = d;
				 p_in3 = e;
				 p_in4 = f;
		end
	endtask
	
	initial
		begin
 			initialize();
			@(negedge clk)
			rst = 1;
			@(negedge clk)
			rst = 0;
			stimulus_dut(1,0,1,1);
		 	stimulus_dut(1,1,1,1);
		 stimulus_dut(0,1,1,1);
		 stimulus_dut(1,1,0,1);
		#200 $finish;
		end
	endmodule
