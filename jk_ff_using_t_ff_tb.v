module jk_ff_using_t_ff_tb();
	reg clk,rst,j,k;
	wire q,qn;

	jk_ff_using_t_ff dut(clk,rst,j,k,q,qn);

	task initialize();
		begin
			{clk,rst,j,k} = 0;
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

	task stimulus(input m,input n);
		begin
			@(negedge clk)
				j = m;
				k = n;
		end
	endtask

	initial
		begin
			initialize();
			#10;
			reset_dut();
			stimulus(0,0);
			stimulus(1,0);
			stimulus(0,0);
			stimulus(0,1);
			stimulus(0,0);
			stimulus(1,1);
			stimulus(0,0);
			reset_dut();
		end
endmodule

