module bin_hamming(clk,d,c);
input clk;
input [4:1] d;
output reg [7:1] c;
always @ (posedge clk)

begin
c[7]=d[4];
c[6]=d[3];
c[5]=d[2];
c[4]=d[2]^d[3]^d[4];
c[3]=d[1];
c[2]=d[1]^d[3]^d[4];
c[1]=d[1]^d[2]^d[4];
end
endmodule 

