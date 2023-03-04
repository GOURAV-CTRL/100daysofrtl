module pipo_shift_reg_using_d_ff(input clk,rst,p_in1,p_in2,p_in3,p_in4,output p_out1,p_out2,p_out3,p_out4);
	
	d_flipflop inst1(clk,rst,p_in1,p_out1,temp1);
	d_flipflop inst2(clk,rst,p_in2,p_out2,temp2);
	d_flipflop inst3(clk,rst,p_in3,p_out3,temp3);
	d_flipflop inst4(clk,rst,p_in4,p_out4,temp4);
endmodule
