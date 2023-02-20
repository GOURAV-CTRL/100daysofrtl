module jk_ff_using_t_ff(clk,rst,j,k,q,qn);
	input clk,rst,j,k,q,qn;
	
	wire temp1,temp2,temp3;

	t_flipflop inst(clk,rst,temp,temp1,temp2);

	assign temp = (k & temp1) | (j & temp2);
	assign q = temp1;
	assign qn = temp2;
	
endmodule
