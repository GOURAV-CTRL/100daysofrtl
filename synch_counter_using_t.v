module synch_counter_using_t(input clk,rst,output cout1,cout2,cout3,cout4);

	t_flipflop t4(clk,rst,temp10,temp2,temp3);
	t_flipflop t3(clk,rst,temp7,temp5,temp6);
	t_flipflop t2(clk,rst,temp4,temp8,temp9);
	t_flipflop t1(clk,rst,temp1,temp11,temp12);

	assign temp1 = temp8 & temp5 & temp2;
	assign temp4 = temp5 & temp2;
	assign temp7 = temp2;
	assign temp10 = 1;

assign cout1 = temp2;
assign cout2 = temp5;
assign cout3 = temp8;
assign cout4 = temp11;

endmodule

