module t_flipflop(clk,rst,t_in,q,qn);
	input clk,rst,t_in;
	output q,qn;
	reg temp;
always@(posedge clk)
	begin
		if(rst)
			temp <= 0;
		else if(t_in)
			temp = ~temp;
		else 
			temp = temp;
	end
assign q = temp;
assign qn = ~q;
endmodule
