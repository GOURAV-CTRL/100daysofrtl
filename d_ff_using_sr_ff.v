module d_ff_using_sr_ff(clk,rst,d_in,q,qn);
	
	input clk,rst,d_in;
	output q,qn;
	
	wire temp1,temp2,temp3;

	sr_flipflop inst(clk,rst,temp1,temp2,temp3,qn);
	
	assign temp1 = d_in;
	assign temp2 = ~d_in;
	assign q = temp3;
	
endmodule

