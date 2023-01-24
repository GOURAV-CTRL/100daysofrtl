module not_gate_using_mux_tb();
	reg in1;
	wire y;
not_gate_using_mux dut(in1,y);
	
initial
	begin
		in1 = 0;
		#10;
		in1 = 1;
	end
endmodule

