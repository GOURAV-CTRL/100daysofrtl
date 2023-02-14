module t_ff_using_d_ff(clk,rst,t_in,q,qn);
	input clk,rst,t_in;
	output q,qn;
	wire temp1,temp2;
d_flipflop inst(clk,rst,temp1,temp2,qn);
assign temp1 = t_in ^ temp2;
assign q = temp2;
endmodule
