module jk_using_sr(clk,rst,j,k,q,qn);
	input clk,rst,j,k;
	output  q,qn;
	 wire temp1,temp2;
	sr_flipflop inst(clk,rst,j,k,q,qn);

	assign temp1 = j & qn;
	assign temp2 = k & q;
	
	endmodule
	
