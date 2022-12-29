module d_ff(clk,rst,d_in,q,qb);

input clk,rst,d_in;

output reg q;
output wire qb;

always@(posedge clk)
begin

if(rst)

q<= 1'b0;

else 

q<=d_in;


end
assign qb =~q;

endmodule
