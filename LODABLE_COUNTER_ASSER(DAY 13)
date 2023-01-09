module up_down_counter(clk,rst,load,data_in,up_enb,down_enb,data_out);

	input clk,rst,load;
	input up_enb,down_enb;
	input [3:0] data_in;
	output logic [3:0] data_out;

	always@(posedge clk)
		begin
			if(rst)
				begin
					data_out <= 0;
				end
			else if(up_enb)
				begin
					if(data_out == 4'd12)
						data_out <= 4'd0000;
					else

						for(int i=0;i<13;i++)
						data_out <= data_out + 1'b1;
				end
			else if(down_enb)
				begin
					if(data_out == 4'd0000)
						data_out <= 4'd1011;
					else
						for(int i = 0;i<13;i++)
						data_out = data_out -1'b1;
				end
			else if(load)
				begin
					for(int i = 0;i<13;i++)
						data_out = data_in + 1'b1;
				end
		end

		property counter;
			@(posedge clk) up_enb |=> data_out == ($past(data_out,1))+1'b1;
		endproperty
		
		assert property(counter)
			$display("assertion sucessfully completed");


endmodule
					
