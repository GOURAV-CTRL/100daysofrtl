module sipo_using_jk_ff_tb();
	reg clk,rst,s_in;
	wire p_out1,p_out2,p_out3,p_out4;

	sipo_using_jk_ff dut(clk,rst,s_in,p_out1,p_out2,p_out3,p_out4);

	task initialize();
		begin
			{clk,rst,s_in} = 0;
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

	task stimulus(input i);
		begin
			@(negedge clk)

				s_in = i;
		end
	endtask

	initial
		begin
			initialize();
			#10;	
			reset_dut();
			stimulus(0);
			stimulus(1);
			stimulus(0);
			stimulus(1);
			stimulus(0);
			stimulus(1);
			#10;
			#200 $finish;
		end
endmodule