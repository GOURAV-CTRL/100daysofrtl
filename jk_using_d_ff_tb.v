module jk_using_d_ff_tb();
	reg clk,rst,j,k;
	wire q,qn;
	
	jk_using_d_ff dut(clk,rst,j,k,q,qn);
	
	task initialize();
		begin
			{clk,rst,j,k} = 0;
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
			j = 1;k=0;
			@(negedge clk)
			j = 0;k=0;
			@(negedge clk)
			j = 0;k = 1;
			@(negedge clk)
			j = 0;k = 0;
			@(negedge clk)
			j = 1;k=1;
			@(negedge clk)
			j = 0;k = 0;
			#10;
			#20 $finish;
	end
endmodule
