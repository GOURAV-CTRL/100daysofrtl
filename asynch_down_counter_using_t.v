module asynch_down_counter_using_t(clk,rst,cout1,cout2,cout3);
	input clk,rst;
	output cout1,cout2,cout3;
	
	wire temp1,temp5,temp8;

     wire temp2,temp6;
	



	t_flipflop inst1(clk,rst,temp1,temp2,cout1);
	
	t_flipflop inst2(temp3,rst,temp5,temp6,cout2);
	
	t_flipflop inst3(temp7,rst,temp8,temp9,cout3);

	assign temp1 = 1;
	assign temp5 = 1;
	assign temp8 = 1;

	assign temp3 = cout1;
	assign temp7 = cout2;
	


	
endmodule

