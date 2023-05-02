module mealy_seq_det_1010_tb;

  // Declare signals for the testbench
  reg clk;
  reg rst;
  reg d_in;
  wire detector;

  // Instantiate the design under test (DUT)
  mealy_seq_det_1010 dut (
    .clk(clk),
    .rst(rst),
    .d_in(d_in),
    .detector(detector)
  );

  // Initialize the testbench signals
  initial begin
    clk = 0;
    rst = 1;
    d_in = 0;
    #5 rst = 0; // Assert reset for 5 time units
  end

  // Toggle the clock signal every time unit
  always #1 clk = ~clk;

  // Stimulate the DUT with test vectors
  initial begin
    // Test vector 1: input sequence does not match
    d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 0;
    //assert(!detector) $display("Test vector 1 failed: detector should be 0");

    // Test vector 2: input sequence matches
    d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    //assert(detector) $display("Test vector 2 failed: detector should be 1");

    // Test vector 3: input sequence matches twice
    d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    //assert(detector) $display("Test vector 3 failed: detector should be 1");

#1000 $finish;
  end

endmodule

