module synch_lifo_16_8(input clk,rst,wr_enb,rd_enb,input [7:0] data_in,output [7:0] data_out,full,empty);

	reg [4:0] wr_ptr;
	//reg [7:0] rd_ptr;
	reg [7:0] temp;

	reg [7:0]mem[15:0];
	
	integer i;


	always@(posedge clk)
		begin
			if(rst)
				begin
				for(i = 0;i<16;i=i+1)
					begin
					mem[i] <= 0;
					wr_ptr <= 0;
					
					end
				end
			else if(wr_enb == 1 && !full)
				begin
					for(i = 0;i<16;i=i+1)
						begin
							mem[wr_ptr] = data_in;
							wr_ptr = wr_ptr + 1;
						end
				end
		


			//always@(posedge clk)
				//begin

				//if(rst)
					//begin
						//for(i = 0;i<16;i=i+1)
						//	begin
								//mem[i] <= 0;
								//rd_ptr <= 0;
					//end

							//end
				else if(rd_enb && !empty)
					begin
						for(i = 0;i<16;i=i+1)
							begin
								temp <= mem[wr_ptr];
								wr_ptr = wr_ptr - 1 ;
							end
					end
			
		end

		assign data_out = temp;
		assign full = (wr_ptr > 5'b01111);
		assign empty = (wr_ptr == 5'b0) ? 1'b1 :1'b0;
endmodule
