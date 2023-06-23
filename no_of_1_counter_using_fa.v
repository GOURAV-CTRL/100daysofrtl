module ones_counter_3bit_using_fa(input [2:0]a,input [2:0]b,input c,output reg [2:0]sum,output reg [2:0]carry);

	always@(*)
		begin
			carry = ((a&b) | (b&c) | (c&a));
			sum = a^b^c;
		end
endmodule

