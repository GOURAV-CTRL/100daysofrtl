module eight_one_mux_tb;
	reg d0,d1,d2,d3,d4,d5,d6,d7;
	reg [2:0]sel;
	wire y;

eight_one_mux dut(d0,d1,d2,d3,d4,d5,d6,d7,sel,y);

task initialize();
	begin
		{d0,d1,d2,d3,d4,d5,d6,d7} = 0;
		sel = 0;
	end
endtask

task stimulus(input [7:0]i,input [2:0] j);
	begin
		#10;
		{d0,d1,d2,d3,d4,d5,d6,d7} = i;
		sel = j;
	end
endtask

initial
	begin
		initialize();
		
		stimulus(8'b00100101,3'b111);
	end
endmodule
