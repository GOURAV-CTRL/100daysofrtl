module fifo_16_8_tb();

reg clk,rst,write_enable,read_enable;

wire empty,full;

reg [7:0] data_in;

wire [7:0] data_out;

fifo_16_8 dut(clk,rst,write_enable,read_enable,data_in,empty,full,data_out);

parameter cycle = 10;


always 
begin
#(cycle/2)
clk = 1'b0;

#(cycle/2)
clk = 1'b1;
end

task reset();
begin
@(posedge clk)
rst = 1'b1;
@(posedge clk)
rst = 1'b0;
end
endtask
task write_task(input [7:0]i);






begin
@(negedge clk)
write_enable = 1'b1;

data_in = i;

end
endtask

task read_task();
begin
@(negedge clk)

read_enable = 1'b1;

end
endtask

initial

begin
reset;
#10;
repeat(10)
write_task(8'b1);

repeat(10)
read_task();
end
endmodule

