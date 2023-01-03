module twotofour_decoder(a,b,enb,y1,y2,y3,y4);

input a,b,enb;
output y1,y2,y3,y4;

assign y1 = (enb) & (~a) & (~b);
assign y2 = (enb)&(~a) & (b);
assign y3 = (enb)&(a) & (~b);
assign y4 = (enb)& (a) & (b);
endmodule
