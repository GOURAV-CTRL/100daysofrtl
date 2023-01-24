module not_gate_using_mux(in1,y);
input in1;
output y;

two_to_1_mux m1(~in1,0,0,y);

endmodule

