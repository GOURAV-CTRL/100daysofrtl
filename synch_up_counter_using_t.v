module synch_up_counter_using_t(input clk,rst,output c_out_1,c_out_2);

	t_flipflop inst1(clk,rst,temp1,c_out_1,temp3);
	t_flipflop inst2(clk,rst,c_out_1,temp4,temp5);

	assign temp1 = 1;
	
	
	//assign c_out_1 = temp2;
	assign c_out_2 = temp4;

endmodule

