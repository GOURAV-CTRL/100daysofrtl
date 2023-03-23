module asynch_up_counter_using_jk_ff(input clk,rst,output cout1,cout2,cout3,cout4);

wire temp1,temp2,temp3,temp7,temp8,temp11,temp12,temp15,temp16;

	

	jk_flipflop jk1(clk,rst,temp1,temp2,temp3,temp4);
	jk_flipflop jk2(~temp3,rst,temp1,temp2,temp7,temp8);
	jk_flipflop jk3(~temp7,rst,temp1,temp2,temp11,temp12);
	jk_flipflop jk4(~temp11,rst,temp1,temp2,temp15,temp16);

assign temp1 = 1;
assign temp2 = 1;

assign cout1 = temp3;
assign cout2 = temp7;
assign cout3 = temp11;
assign cout4 = temp15;
	
endmodule
