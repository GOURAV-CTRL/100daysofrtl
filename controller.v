module controller
(
	input wire Z,
	input wire C,
	input wire CLK,
	input wire CLB, //RESET
	input wire [7:0] Opcode,

	output reg LoadIR,
	output reg IncPC,
	output reg SelPC,
	output reg LoadPC,
	output reg LoadReg,
	output reg LoadAcc,
	output reg [1:0] SelAcc,
	output reg [3:0] SelALU

	);

	`include "parameters.v"
	   
	localparam READY = 0, ADD = 1 ;

	reg [4:0] state, //Current State
			  nextState; //Next State

always @(posedge CLK || CLB) begin
	if (CLB) state <= `S_RESET;
	else 	 state <= nextState;
end


always @(state) begin

	case (state)

		`S_RESET: begin
			//Set Everything to L
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;
			LoadReg <= 1'b0;
			LoadAcc <= 1'b0;
			SelAcc <= 2'b0;
			SelALU <= 4'b0;
			//nextState <= `S_IDLE;
		end

		`S_IDLE:begin
			
		end

		`S_OP_ADD:begin
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;
			LoadReg <= 1'b0;

			SelALU <=  4'b0010;
			SelAcc <= 2'b10;
			LoadAcc <= 1'b1;

			//nextState <= `S_IDLE;
		end

	`S_OP_SUB:begin
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;
			LoadReg <= 1'b0;

            SelALU <=  4'b0011;
            SelAcc <= 2'b10;
            LoadAcc <= 1'b1;

			//nextState <= `S_IDLE;
		end

		`S_OP_NOR:begin
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;
			LoadReg <= 1'b0;

            SelALU <=  4'b0011;
            SelAcc <= 2'b10;
            LoadAcc <= 1'b1;

			//nextState <= `S_IDLE;
		end

		`S_OP_MOVR:begin
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;
			LoadReg <= 1'b0;

			SelAcc <= 2'b10;
			LoadAcc <= 1'b1;

			SelALU <= 4'b0;
			//nextState <= `S_IDLE;
		end

		`S_RESET: begin
			//Set Everything to L
			LoadIR <= 1'b0;
			IncPC <= 1'b0;
			SelPC <= 1'b0;
			LoadPC <= 1'b0;

			LoadReg <= 1'b1;

			LoadAcc <= 1'b0;
			SelAcc <= 2'b0;
			SelALU <= 4'b0;
			//nextState <= `S_IDLE;
		end
   endcase
end
always @(posedge CLK) begin
	case(Opcode)
		`OP_ADD: //ADD
				begin
					nextState <= `S_OP_ADD;
				end
		`OP_SUB: //SUB
				begin
					nextState <= `S_OP_SUB;
				end
		`OP_NOR: //NOR
				begin
					nextState <= `S_OP_NOR;
				end
		`OP_MOVR: //MOVR - Move Register to ACC 
				begin
					nextState <= `S_OP_MOVR;
				end
		`OP_MOVA: //MOVA - Move Acc to Register
				begin
                	nextState <= `S_OP_MOVA;
				end
		`OP_JZR: //JZ rs- Jump if Zeon to Reg Value
				begin
					nextState <= `S_OP_JZR;
				end
		`OP_JZI: //JZ Imm - Jump if Zero to Immediate
				begin
					nextState <= `S_OP_JZI;
				end
		`OP_JCR: //JC rs - Move Register to ACC 
				begin
					nextState <= `S_OP_JCR;
				end
		endcase
	end

endmodule
