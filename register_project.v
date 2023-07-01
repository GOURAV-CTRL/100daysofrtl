module reg_file(input [7:0] in,input[2:0] in_address,input [2:0]out1_address,input [2:0] out2_address,input clk,input rst,input write,output [7:0] out_1,output [7:0] out_2);

integer i;

reg [7:0] regfile [0:7];

always@(*)
	begin
		if(rst)
			begin
				#2;
					for(i = 0;i<8;i=i+1)
						regfile[i] = 8'b00000000;
end


	
		else if(write == 1'b1 && rst == 1'b0)
		begin
			#2;
				regfile[in_address] = in;
		end
end



assign #2 out_1 = regfile[out1_address];
assign #2 out_2 = regfile[out2_address];

endmodule

