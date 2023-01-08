module fifo_16_8(clk,rst,write_enable,read_enable,data_in,empty,full,data_out);

input clk,rst,write_enable,read_enable;

input [7:0]data_in;

output empty,full;

output reg [7:0]data_out;

reg [3:0] wr_ptr = 4'b0;
reg [3:0] rd_ptr = 4'b0;
reg [4:0] fifo_counter;

reg [7:0] mem[15:0];

integer i;

assign empty = (fifo_counter == 5'b0) ? 1'b1 : 1'b0;
assign full  = (fifo_counter > 5'b01111);

always@(posedge clk)
begin

if(rst)
for(i=0;i<16;i=i+1)
begin
mem[i] = 0;
wr_ptr = 0;
end


else 

if(write_enable == 1 && !full)
mem[wr_ptr] = data_in;
wr_ptr = wr_ptr +1;
fifo_counter =  fifo_counter + 1;
end

always@(posedge clk)
begin
if(rst)
data_out = 0;
else if(read_enable && !empty)

data_out = mem[rd_ptr];

end
endmodule




