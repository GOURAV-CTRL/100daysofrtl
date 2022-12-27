module counter_mod12(clk,rst,d_in,count_enb,count,counter_up);

input clk,rst,count_enb;

input [3:0] d_in;

output reg [3:0] counter_up;

output [3:0] count;



always@(posedge clk)
begin

if(rst)

counter_up <= 4'd0;

else if(count == 4'd13)

counter_up <= 0;

else if(d_in)

counter_up <= counter_up + d_in;

else if(count_enb)
counter_up <= count +4'd1;

end

assign count = counter_up;

endmodule





