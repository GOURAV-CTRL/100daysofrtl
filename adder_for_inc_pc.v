module adder_for_pc(PCINPUT,RESULT);
 input [31:0] PCINPUT;
 output [31:0] RESULT;
 reg RESULT;
 always@(PCINPUT)
 begin
  RESULT = PCINPUT+ 4;
 end
endmodule
