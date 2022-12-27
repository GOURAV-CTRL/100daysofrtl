module counter_mod12_tb();

reg clk,rst,count_enb;

reg [3:0] d_in;

wire [3:0] count;



counter_mod12 dut(clk,rst,d_in,count_enb,count);

task initialize();
begin
d_in = 4'b0;
count_enb = 1'b0;
rst = 1'b0;
clk = 1'b0;
end
endtask

always #10 clk = ~clk;

task reset();
begin
@(negedge clk)
rst = 1'b1;
@(negedge clk)
rst = 1'b0;
end
endtask

task stimulus(input [3:0] i);
begin
d_in = i;
end
endtask

task counting();
begin
count_enb = 1'b1;
end
endtask


initial
begin

	initialize();
	reset();
	//counting();
	stimulus(4'd10);
end
endmodule
	
