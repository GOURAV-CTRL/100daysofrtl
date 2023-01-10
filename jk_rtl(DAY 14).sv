module jk_ff(clk,rst,j,k,q,qb);
	input logic clk,rst,j,k;
	output logic q,qb;
	
	always@(posedge clk)
		begin
			if(rst)
				q <= 0;
				qb <= 1;
			
			else if(j == 0 && k == 0)
				q<= q;
				qb<=qb;
				
			else if(j == 0 && k == 1)
				q <= 0;
				qb <= 1;
			
			else if(j == 1 && k == 0)
				q <= 1;
				qb <= 0;
			
			else if(j== 1 && k == 1)
				q<= ~q;
				qb <= ~qb;
		end
		
		property rst_ppt;
			@(posedge clk) rst |=> ((q == 0) && (qb == 1));
		endproperty
		
		assert property rst_ppt;
		
		
		sequence set_seq;
			((j == 1) && (k == 0));
		endsequence
		
		property set_ppt;
			@(posedge clk) set_seq |=> ((q == 1) && (qb == 0));
		endproperty
		
		assert property set_ppt;
		
		sequence reset_seq;
			((j == 0) && (k == 1));
		endsequence
		
		property reset_ppt;
			@(posedge clk) reset_ppt |=> ((q == 0) && (qb == 1));
		endproperty
		
		assert property reset_ppt;
		
endmodule

