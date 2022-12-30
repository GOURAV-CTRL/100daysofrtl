module ring_4bitcounter(clk,rst,out);

	input clk,rst;
	output [3:0]out;
	reg [3:0] a;
	
always@(posedge clk)
	begin
		if(rst)
				a = 4'b0001;
		else
			begin
				a <= a<< 1;
				a[0] <= a[3];
			end
	end
	
	assign out = a;
endmodule

				