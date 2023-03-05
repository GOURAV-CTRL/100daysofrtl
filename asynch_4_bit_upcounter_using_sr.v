module asynch_4_bit_upcounter_using_sr(clk,rst,op1,op2,op3,op4);
	input clk,rst;
	output op1,op2,op3,op4;

	sr_flipflop inst1(clk,rst,temp1,temp2,temp3,temp4);
	sr_flipflop inst2(clk,rst,temp5,temp6,temp7,temp8);
	sr_flipflop inst3(clk,rst,temp9,temp10,temp11,temp12);
	sr_flipflop inst4(clk,rst,temp13,temp14,temp15,temp16);
	
	assign temp1 = ((temp12 & temp4) | (temp8 & temp4) | (temp16 & temp4));
	assign temp5 = ((temp8 & temp3));
	assign temp9 = ((temp12 & temp8 & temp3));
	assign temp13 = ((temp16 & temp11 & temp7 & temp3));

	assign temp2 = ((temp15 & temp11 & temp7 & temp4) | (temp3 & temp16) | (temp12 & temp3));
	assign temp6 = ((temp8 & temp4) | (temp7 & temp3 & temp16) | (temp15 & temp12 & temp7));
	assign temp10 = ((temp16 & temp11 & temp7 & temp3) | (temp15 & temp7 & temp3) | (temp15 & temp7 & temp4));
	assign temp14 = ((temp11 & temp7 & temp4));
 
	assign op1 = temp3;
	assign op2 = temp7;
	assign op3 = temp11;
	assign op4 = temp15;


endmodule

