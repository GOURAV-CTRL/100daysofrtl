module synch_lifo_tb();
	reg clk,rst,wr_enb,rd_enb;
	reg [7:0] data_in;
	wire full,empty;
	wire [7:0] data_out;

	synch_lifo_16_8 dut(clk,rst,wr_enb,rd_enb,data_in,data_out,full,empty);

	initial
		begin
			{clk,rst,wr_enb,rd_enb,data_in} = 0;
		end

	always #10 clk = ~clk;

	task reset_dut();
		begin
			@(negedge clk)
				rst = 1;
			@(negedge clk)
				rst = 0;
		end
	endtask

	task write_stimulus(input i);
		begin
			@(negedge clk)
				wr_enb = i;
		end
	endtask

	task read_stimulus(input j);
		begin
			@(negedge clk)
				rd_enb = j;
		end
	endtask

	task data_stimulus(input [7:0] k);
		begin
			@(negedge clk)
				data_in = k;
		end
	endtask


	initial
		begin
			reset_dut();
			#10;
			read_stimulus(1'b1);
			#10;
			read_stimulus(1'b0);
			#10;
			reset_dut();
			#10;
			write_stimulus(1'b1);
			#10;
			data_stimulus($random%64);
			#10;
			data_stimulus($random%64);
			#10;
			data_stimulus($random%64);
			#10;
			data_stimulus($random%64);
			#10;
			data_stimulus($random%64);
			#10;
			read_stimulus(1'b1);
			#10;
			reset_dut();
			#1000 $finish;
		end
endmodule

