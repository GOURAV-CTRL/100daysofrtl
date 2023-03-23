module asynch_up_counter_using_jk_ff_tb();

	reg clk,rst;
	wire cout1,cout2,cout3,cout4;

	asynch_up_counter_using_jk_ff dut(clk,rst,cout1,cout2,cout3,cout4);

	task initialize();
		begin
			{clk,rst} = 0;
		end
	endtask

	always #10 clk = ~clk;

initial
	begin
		initialize();
		@(negedge clk)
		rst = 1;
		@(negedge clk)
		rst = 0;
		#100 $finish;
	end
endmodule


	
