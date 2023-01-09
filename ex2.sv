module up_down_counter_tb();
	reg clk,rst,up_enb,down_enb,load;
	reg [3:0] data_in;
	wire [3:0] data_out;

	up_down_counter dut(.clk(clk),.rst(rst),.load(load),.data_in(data_in),.up_enb(up_enb),.down_enb(down_enb),.data_out(data_out));

	task initialize();
		begin
			clk = 1'b0;
			rst = 1'b0;
			data_in  = 4'd0000;
			load = 1'b0;
			up_enb = 1'b0;
			down_enb = 1'b0;
		end
	endtask

	task up_counting(input i);
		begin
			up_enb = i;
		end
	endtask
	
initial
	begin
		initialize();
		up_counting(1);
	end
endmodule
