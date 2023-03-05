module asynch_4_bit_upcounter_using_sr_tb();
	reg clk,rst,cin;
	wire cout;

	asynch_4_bit_upcounter_using_sr dut(clk,rst,op1,op2,op3,op4);

	task initialize();
		begin
			{clk,rst,cin} = 0;
		end
	endtask

	task reset_dut();
		begin
			@(negedge clk)
				rst = 1;
			@(negedge clk)
				rst = 0;
		end
	endtask

	always #10 clk = ~clk;

	initial
		begin
			initialize();
			#10;
			reset_dut();
			#800 $finish;
		end
endmodule

