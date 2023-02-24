module siso_shift_reg_using_jk(clk,rst,s_in,s_out);
	input clk,rst,s_in;
	output s_out;

	wire temp1,temp2,temp3,temp4,temp7,temp8,temp9;
	
	

				

	jk_flipflop inst1(clk,rst,s_in,~s_in,temp1,temp2);
	jk_flipflop inst2(clk,rst,temp1,temp2,temp3,temp4);
	jk_flipflop inst3(clk,rst,temp3,temp4,temp5,temp6);
	jk_flipflop inst4(clk,rst,temp5,temp6,temp7,temp8);
	
	assign s_out = temp7;
	
endmodule

