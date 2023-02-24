module siso_shift_reg_using_jk_ff_tb();
	reg clk,rst,s_in;
	wire s_out;

	siso_shift_reg_using_jk dut(clk,rst,s_in,s_out);

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
			#10;
			#200 $finish;
		end
endmodule


