//Top block for 8 bit processor
module top_module(
	input wire CLK, // MASTER CLK
	input wire CLB, // RESET
	input wire [7:0] INST, // From INstruction Memory
	output wire [7:0] PC, //TO instruction Memory
	output wire [7:0] ACC //Debugging
);

	//Controller Signals
	wire LoadIR, IncPC, SelPC, LoadPC, LoadReg, LoadAcc,Z,C;
	wire [3:0] SelALU;
	wire [1:0] SelAcc;
	wire [7:0] Opcode;

	//Signals between IR and PC
	wire [7:0] Imm;
	wire [5:0] Imm_to_PC;
	wire [1:0] Imm_to_RF;
	assign Imm_to_PC = Imm[5:0];
	assign Imm_to_RF = Imm[7:5];

	//Accumulator Signals
	wire [7:0] acc_output_bus;

	// RF to ALU
	wire [7:0] rf_output_bus;

	//ALU Output
	wire [7:0] alu_out;

	program_counter inst_program_counter(
				.address (PC), // To instruction memory
				.regIn   (regIn), //From register File
				.imm     (Imm_to_PC), // From Instruction Register
				.CLB     (CLB), //Reset
				.clk     (CLK), //Master Clk
				.IncPC   (IncPC), //From Controller
				.LoadPC  (LoadPC), // From Controller
				.selPC   (SelPC) //From Controller
			);


	controller inst_controller(
			.Z       (Z), //From ALU
			.C       (C), //From ALU
			.CLK     (CLK), //Master Clock
			.CLB     (CLB), //Reset
			.Opcode  (Opcode), // From IR
			.LoadIR  (LoadIR), // To IR
			.IncPC   (IncPC), // To PC
			.SelPC   (SelPC), // To PC
			.LoadPC  (LoadPC), // To PC
			.LoadReg (LoadReg), // To RF
			.LoadAcc (LoadAcc), // To Acc
			.SelAcc  (SelAcc), // To Acc Mux
			.SelALU  (SelALU) // To To ALU
		);


	IR inst_IR (.I(Imm), .clk(CLK), .CLB(CLB), .LoadIR(LoadIR), .Instruction(Opcode));


	

	alu_8bit inst_ALU(
			.a          (acc_output_bus),
			.b          (rf_output_bus),
			.ALU_sel    (SelALU[1:0]),
			.load_shift (SelALU[2:1]),
			.result     (alu_out), // Going to Mux2
			.cout       (C),
			.zout       (Z)
		);





		Accumulator inst_Accumulator(
			.A_Imm    (Imm_to_PC),
			.B_RegOut (rf_output_bus),
			.B_AULOut (alu_out),
			.LoadAcc  (LoadAcc),
			.SelAcc1  (SelAcc[1]),
			.SelAcc0  (SelAcc[0]),
			.CLK      (CLK),
			.CLB      (CLB),
			.AccOut   (acc_output_bus)
		);

endmodule
