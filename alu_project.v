module alu_8bit(input [7:0] data1,input [7:0]data2,input [2:0]alu_opcode,input carry_in,output [7:0]alu_result,output carry_out,output zero_flag,output sign_flag,output parity_flag,output aux_carry_flag);

	reg [7:0]result;
	wire carry_out_int;

	assign zero_flag = (result == 8'b00000000);
	assign sign_flag = (result[7] == 1);
	assign carry_out = result[7];
	assign parity_flag = result[7];
	assign aux_carry_flag = result[5];


	always@(*)
		begin
			case(alu_opcode)
				3'b000 : result = data1 + data2 + carry_in; // add with carry
				3'b001 : result = data1 + data2; // add
				3'b010 : result = data1 - data2;
				3'b011 : result = data1 & data2; // logical and
				3'b100 : result = data1 | data2; // logical or
				3'b101 : result = data1 ^ data2; // logical xor
				3'b110 : result = ~data1;        // logical not
				3'b111 : result = data1 >> data2;// right shift

			endcase
		end
assign alu_result = result;

endmodule


