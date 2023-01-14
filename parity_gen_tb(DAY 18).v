module parity_gen_tb;

reg x,y,z;
wire result;

parity dut(x,y,z,result);

initial begin

// Initialize Inputs

x = 0;

y = 0;

z = 0;

// Wait 100 ns for global reset to finish

#100;

// Add stimulus here

x = 0;

y = 0;

z = 1;

// Wait 100 ns for global reset to finish

#100;

x = 0;

y = 1;

z = 0;

// Wait 100 ns for global reset to finish

#100;

x = 0;

y = 1;

z = 1;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 0;

z = 0;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 0;

z = 1;

#100;

x = 1;

y = 1;

z = 0;

#100;

x = 1;

y = 1;

z = 1;



#100;

end

endmodule
