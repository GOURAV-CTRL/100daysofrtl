module mealy_seq_det_1010(input clk,rst,d_in,output  detector);
	
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	parameter s3 = 2'b11;

	reg [1:0] present_state,next_state;

	always@(posedge clk)
		begin
			if(rst)
				present_state = 0;
			else
				present_state = next_state;
		end
	always@(*)
		begin
			case(present_state)
				
					2'b00:
						if(d_in == 0)
							next_state <= s0;
						else
							next_state <= s1;
					2'b01:
						if(d_in == 1)
							next_state <= s1;
						else
							next_state <= s2;
					2'b10:
						if(d_in == 1)
							next_state <= s3;
						else
							next_state <= s0;
					2'b11:
						if(d_in == 1)
							next_state <= s0;
							
						else
							next_state <= s0;
				
			endcase
		end

		assign detector = (present_state == s3) ? 1'b1 : 1'b0;
endmodule
			

