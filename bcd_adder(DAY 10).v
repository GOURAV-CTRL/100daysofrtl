module bcd_adder( a,b,c_in, sum,carry);
input a,b,c_in;
output [3:0] sum;
output carry;
reg temp_sum,temp_carry;

always@(a,b,c_in)
	begin
		temp_sum = a + b +c_in;
		
		if(temp_sum >9)
			begin
				temp_sum = temp_sum +6;
				temp_carry = 1;
			end
	
		else
			begin
				temp_carry = 0;
			end
		end
assign sum = temp_sum;
assign carry = temp_carry;
endmodule

