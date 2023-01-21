module adder_using_mux_tb();
	reg a,b,cin;
	wire sum,carry;
adder_using_mux dut(a,b,cin,sum,carry);

task initialize();
	begin
		{a,b,cin} = 0;
	end
endtask

task stimulus(input i,j,k);
	begin
		a = i;
		b = j;
		cin = k;
	end
endtask

initial
	begin
		initialize();
		#10;
		stimulus(1,0,0);
		#10;
		stimulus(1,1,0);
		#10;
		stimulus(0,0,1);

	end
endmodule

