module jkff_test;
reg J,K, CLK;
wire Q, QBAR;

//2. Instantiate the module we want to test. We have instantiated the jkff_behavior
jk_flipflop dut(.q(Q), .qbar(QBAR), .j(J), .k(K), .clk(CLK)); // instantiation by port name.
initial
	begin
//3. Monitor TB ports
$monitor("simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QBAR);
end
//4. apply test vectors
initial begin
  CLK=0;
     forever #10 CLK = ~CLK;  
end 
initial begin 
 J= 1; K= 0;
 #100; J= 0; K= 1; 
 #100; J= 0; K= 0; 
 #100; J= 1; K=1; 
end 
endmodule
