module candy_vending_machine_using_moore(input clk,rst,[3:0]coin,output reg candy);
	parameter s0 = 4'b0000;
	parameter s5 = 4'b0001;
	parameter s10 = 4'b0010;
	parameter s15 = 4'b0011;
	parameter s20 = 4'b0100;

	parameter rupee5 = 4'b0101;
	parameter rupee10 = 4'b1010;
	
 	
	reg [3:0] present_state,next_state;

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
				
				s0:
					if(coin == rupee5)
						next_state <= s5;
					else if(coin == rupee10)
						next_state <= s10;
					else 
						next_state <= s0;
		
				s5:
					if(coin == rupee5)
						next_state <= s10;
					else if(coin == rupee10)
						next_state <= s15;
					else
						next_state <= s5;
				s10:
					if(coin == rupee5)
						next_state <= s15;
					else if(coin == rupee10)
						next_state <= s20;
					else 
						next_state <= s10;
		
				s15:
					next_state <= s0;
			
				s20:
					if(coin == rupee5)
						next_state <= s10;
					else if(coin == rupee10)
						next_state <= s15;
					else
						next_state <= s0;
			endcase
		end

		assign candy = (present_state == s15 || present_state == s20) ? 1'b1 : 1'b0;
endmodule

