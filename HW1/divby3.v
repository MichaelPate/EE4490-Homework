// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 1 - August 30, 2021
// divby3.v

module divby3(D, BCD);
	input [3:0] BCD;
	output D;
	
	// We want D high if our BCD is an integer (ie less than 10) and 
	// is easily divided by 3 (modulo 3 is zero)
	assign D = (BCD < 4'd10) & (BCD % 3 == 0) ? 1'b1 : 1'b0;
endmodule