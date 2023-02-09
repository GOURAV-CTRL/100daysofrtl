module sr_flipflop( clk,rst,s,r,q,qn);
input clk,rst,s,r;
reg temp;
output q,qn;

	always@(posedge clk)
		begin
		if(rst)
			begin
				temp <= 0;
				 
			end
		else if(s == 0 && r == 0)
			begin
				temp <= q;
				//qn <=qn;
			end
		else if(s == 1 && r == 0)
			begin
				temp <= 1;
				//qn <= 0;
			end
		
		end
	assign q = temp;
	assign qb = ~q;
endmodule
