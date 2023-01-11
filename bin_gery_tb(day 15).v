module binary_to_grey_converter_tb;
	reg [3:0] data_in;
	wire [3:0] data_out;

 binary_to_grey_converter dut(data_in,data_out);
initial
	begin
		data_in = 0;
		#10;
		data_in = 2;
		#10;
		data_in = 3;
	end
endmodule
	
