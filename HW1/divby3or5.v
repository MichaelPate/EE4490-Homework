// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 1 - August 30, 2021
// divby3or5.v

module divby3or5(D, BCD);
	// Define IO
	input [3:0] BCD;
	output D;
	
	// Used to connect the two modules below
	wire divd3, divd5;
	
	// Instantiate the modules that actually check the numbers
	divby3 check3(divd3, BCD);
	divby5 check5(divd5, BCD);
	
	// Assign their outputs to the top level module output
	assign D = divd3 | divd5;
endmodule

