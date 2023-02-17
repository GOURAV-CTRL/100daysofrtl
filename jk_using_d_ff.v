module jk_using_d_ff(clk,rst,j,k,q,qn);
	
	input clk,rst,j,k;
	output q,qn;
	wire temp1,temp2,temp3;

	d_flipflop inst(clk,rst,temp1,temp2,temp3);
		
	assign temp1 = (((j & (qn))) | ((~k) & q));
	
	assign q = temp2;
	
	assign qn = temp3;

	endmodule

