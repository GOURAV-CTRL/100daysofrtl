module t_flipflop_tb();
	reg clk,rst,t_in;
	wire q,qn;

t_flipflop dut(clk,rst,t_in,q,qn);

task initialize();
	begin
		clk = 0;
		rst = 0;
		t_in = 0;
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

initial
	begin
		initialize();
		#10;
		reset_dut();
		#10;
		t_in = 1;
		#10; 
		t_in = 0;
		#10;
		t_in = 1;
		#10 $finish;
	end
endmodule

