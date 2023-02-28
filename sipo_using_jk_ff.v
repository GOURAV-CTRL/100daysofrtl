module sipo_using_jk_ff(clk,rst,sin,pout1,pout2,pout3,pout4);

	input clk,rst,sin;
	output pout1,pout2,pout3,pout4;

	jk_flipflop inst1(clk,rst,sin,~sin,pout1,temp1);
	jk_flipflop inst2(clk,rst,pout1,~pout1,pout2,temp1);
	jk_flipflop inst3(clk,rst,pout2,~pout2,pout3,temp2);
	jk_flipflop inst4(clk,rst,pout3,~pout3,pout4,temp3);
		
endmodule

	
