module dec_bin_tb

#(parameter no_of_bits = 8,

parameter time_period = 20)(

);

wire [(no_of_bits/2) - 1 :0] COUNTER;

wire [(no_of_bits) - 1 : 0] BIN;

reg CLK, RESET;

reg [7:0] IN;

dec_bin db1 (.counter(COUNTER), .bin(BIN), .clk(CLK), .reset(RESET), .in(IN));

initial

begin

CLK = 1'b0;

RESET = 1'b0;

#time_period RESET = 1'b1;

IN = 50;

#time_period RESET = 1'b0;

#580 RESET = 1'b1;

#time_period RESET = 1'b0;

end

always

#time_period CLK = ~CLK;

endmodule
