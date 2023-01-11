module binary_to_grey_converter(data_in,data_out);
	input [3:0] data_in;
	output [3:0]data_out;


assign data_out[3] = data_in[3];
assign data_out[2] = data_in[3] ^ data_in[2];
assign data_out[1] = data_in[2] ^ data_in[1];
assign data_out[0] = data_in[1] ^ data_in[0];

endmodule
