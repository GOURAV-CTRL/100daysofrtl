module ring_4bitcountertb();
	reg clk,rst;
	wire [3:0] out;
	
	ring_4bitcounter dut(clk,rst,out);

	task initialize();
		begin
				clk = 1'b0;
				rst = 1'b0;
				
		end
	endtask

always #10 clk = ~clk;

	
	
initial
	begin
		initialize();
		#5;
		rst = 1'b1;
		#20;
		rst = 1'b0;
		#200 $finish;
	end
endmodule

	