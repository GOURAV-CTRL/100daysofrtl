module synch_counter_using_t_tb();

	reg clk,rst;
	wire cout1,cout2,cout3,cout4;

	synch_counter_using_t dut(clk,rst,cout1,cout2,cout3,cout4);

	task initialize();
		begin
			{clk,rst} =0;
		end
	endtask
	
	always #10 clk = ~clk;

	task reset_dut();
		begin
			@(negedge clk)
				rst = 1;
			@(negedge clk)
				rst = 0;
			#1000 $finish;
		end
	endtask

initial
	begin
		initialize();
		reset_dut();
	end
endmodule

