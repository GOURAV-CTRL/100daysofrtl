module candy_vending_machine_using_moore_tb();
	

  // Define inputs and outputs
  reg clk;
  reg rst;
  reg [3:0] coin; // 4-bit input to represent Rs. 5 or Rs. 10
  wire candy;
//Instantiate the vending machine module
  candy_vending_machine_using_moore vm (
    .clk(clk),
    .rst(rst),
    .coin(coin),
    .candy(candy));
  
  // Clock generation
  always #5 clk = ~clk;

initial
	begin
		{clk,rst} = 0;
		coin = 0;
	end

  
  // Reset generation
  initial begin
    rst = 1;
    #10 rst = 0;
  end
  
  // Testcase 1: Input Rs. 5, then Rs. 10 -> Output Rs. 15
  initial begin
    // Input Rs. 5
    coin = 4'b0101;
    #10;
    // Input Rs. 10
    coin = 4'b1010;
    #10;
    // Check for output Rs. 15
   
  end
  
  // Testcase 2: Input Rs. 10, then Rs. 5 -> Output Rs. 15
  initial begin
    // Input Rs. 10
    coin = 4'b1010;
    #10;
    // Input Rs. 5
    coin = 4'b0101;
    #10;
    // Check for output Rs. 15
   
  end
  
  // Testcase 3: Input Rs. 5, then Rs. 5, then Rs. 10 -> Output Rs. 20 with Rs. 5 credit
  initial begin
    // Input Rs. 5
    coin = 4'b0101;
    #10;
    // Input Rs. 5
    coin = 4'b0101;
    #10;
    // Input Rs. 10
    coin = 4'b1010;
    #10;
    // Check for output Rs. 20 with Rs. 5 credit
    
  end
  
  // Testcase 4: Input Rs. 10, then Rs. 10 -> No Output
  initial begin
    // Input Rs. 10
    coin = 4'b1010;
    #10;
    // Input Rs. 10
    coin = 4'b0101;
    #10;
    // Check for no output


	#1000 $finish;

  end
  
endmodule

