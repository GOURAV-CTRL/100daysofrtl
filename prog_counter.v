//program counter
//This is provided by instructors
module program_counter(
output wire [7:0] address,

input wire [7:0] regIn,
input wire [3:0] imm,
input wire CLB,
input wire clk,
input wire IncPC,
input wire LoadPC,
input wire selPC
);

reg [7:0] pc;
assign address = pc;

always @(posedge clk or CLB)
begin
	if(CLB == 1'b0) begin
		pc <= 8'b0;
	end
	else begin
		if (LoadPC == 1'b1) begin
			pc <= selPC?regIn:{4'b0, imm};
		end
		else begin
			pc <= IncPC? (pc + 1) : pc;
		end
	end
end

endmodule
