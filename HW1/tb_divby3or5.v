// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 1 - August 30, 2021
// tb_divby3or5.v

// Time scale 10ns with 100ps resolution
`timescale 10ns/100ps
module tb_divby3or5();
	reg [3:0] t_BCD;
	wire t_D;
	
	// Determines the length of the simulation
	parameter stopTime = 200;
	
	// Define our unit under test
	divby3or5 uut(t_D, t_BCD);
	
	// Variable monitoring
	initial
	begin
		$monitor("%b | %b", t_BCD, t_D);
	end
	initial
		$display(" BCD | D\n--------");
	
	// Simulation time control
	initial
	begin
		#stopTime $finish;
	end
	
	// Stimulus generation
	initial
	begin
		// There are 16 numbers to check, lets just loop
		t_BCD = 4'b0000;
		repeat(15)
		begin
			// Increment each cycle to check all 4 bit values
			#10 t_BCD = t_BCD + 1;
		end
	end
endmodule
