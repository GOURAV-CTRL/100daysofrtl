module xor_using_mux(in1,in2,sel,y);
	input in1,in2;
	input sel;
	output y;
	reg temp;
	
	
	
	
always@(*)
	begin
		
	temp = (sel & in1) | (sel & ~in1);

end
assign y = temp;
endmodule

