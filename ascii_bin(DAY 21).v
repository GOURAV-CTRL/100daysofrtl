module ascii2binaryconverter (in,out,clk,rst,w_RX_dv);
input [7:0] in; 	//ASCII input
input clk;		//Clock Signal
input rst;		
input w_RX_dv;  //This bit goes to 1 if the data byte is received properly

output reg [7:0] out;	//Binary Output

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;  //defining different states for Finite State Machine
reg fsm;		//FSM output					   
reg [7:0] a;
reg [1:0] state;	//Variable for tracking the state


   task ascii2binary;
	input [7:0] w_RX_byte;  
	output [7:0]out;	
	begin
		case (w_RX_byte)
		48: out = 0;		//ASCII value 48 = 0 in Binary
		49: out = 1;		//ASCII value 49 = 1 in Binary
		50: out = 2;		//ASCII value 50 = 2 in Binary
		51: out = 3;		//ASCII value 51 = 3 in Binary
		52: out = 4;		//ASCII value 52 = 4 in Binary
		53: out = 5; 		//ASCII value 53 = 5 in Binary
		54: out = 6;		//ASCII value 54 = 6 in Binary
		55: out = 7;		//ASCII value 55 = 7 in Binary
		56: out = 8;		//ASCII value 56 = 8 in Binary
		57: out = 9;		//ASCII value 57 = 9 in Binary
		endcase
	end
   endtask
	
always @ (posedge clk)begin
	if (rst)begin
		state = s0; out = 0; a =0 ;	
	end
	else begin                     //Finite State Machine: Mealy Machine
	case (state)
		s0: begin
			fsm =0; 
			if (w_RX_dv) begin
				state = s1;
				ascii2binary(in,a);
				out = out +  a * 100;
				$display ($realtime, "ns %d", out);
 			end
			else begin
				state = s0;
			end
		end
		s1: begin
			fsm =0; 
			if (w_RX_dv) begin
				state = s2;
				ascii2binary(in,a);
				out = out + a * 10;
				$display ($realtime, "ns %d", out);
 			end
			else begin
				state = s1;
			end
		end
		s2: begin
			fsm =0; 
			if (w_RX_dv) begin
				state = s3;
				ascii2binary(in,a);
				out = out + a * 1;
				$display ($realtime, "ns %d", out);
 			end
			else begin
				state = s2;
			end
		end
		s3: begin
			fsm =1;
			if (w_RX_dv == 0) begin
				$display ($realtime, "ns %d", out);
				state = s0;
 			end
			else begin
				state = s3;
			end 
		end
	endcase
	end
end
endmodule	
