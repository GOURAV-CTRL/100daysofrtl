module sr_ff_using_t_ff(clk,rst,s,r,q,qn);
	input clk,rst,s,r;
	output q,qn;
	
	wire temp1,temp2,temp3;

	t_flipflop inst(clk,rst,temp1,temp2,temp3);
	
	assign temp1 = (s & temp3) | (r & temp2);
	assign q = temp2;
	assign qn = temp3;

endmodule
