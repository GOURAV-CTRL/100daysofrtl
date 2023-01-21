module adder_using_mux(input a,b,cin,output sum,carry);
	
	four_to_1_mux m1(a,b,cin,sum,carry);
endmodule
