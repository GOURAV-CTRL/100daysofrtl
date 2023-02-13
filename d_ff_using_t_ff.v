module d_ff_using_t_ff(clk,rst,d_in,q,qn);
	input clk,rst,d_in;
	output q,qn;
	wire temp1;
	wire temp2;

t_flipflop inst(clk,rst,temp1,temp2,qn);

assign temp1 =  d_in ^ temp2;
assign q = temp2;


endmodule

