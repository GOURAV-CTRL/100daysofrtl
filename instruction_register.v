
module IR (
output wire [7:0] I,

input  clk,
input  CLB,
input LoadIR,
input [7:0] Instruction
);

reg [7:0] I_out;
assign I = I_out;

always @(posedge clk || CLB) begin
	if (CLB == 1'b0) begin
		I_out <= 0;
	end
	else begin
		if (LoadIR == 1'b1) begin
			I_out <= Instruction;
		end
	end

end

endmodule
