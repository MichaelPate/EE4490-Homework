// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 1 - August 30, 2021
// divby5.v

module divby5(D, BCD);
	input [3:0] BCD;
	output D;
	
	// We want D high if our BCD is an integer (ie less than 10) and 
	// is easily divided by 5 (modulo 5 is zero)
	assign D = (BCD < 4'd10) & (BCD % 5 == 0) ? 1'b1 : 1'b0;
endmodule