module divby3or5(D, BCD);
	input [3:0] BCD;
	output D;
	wire divd3, divd5;
	
	divby3 check3(divd3, BCD);
	divby5 check5(divd5, BCD);
	or output(D, divd3, divd5);
	
endmodule

module divby3(D, BCD);
	input [3:0] BCD;
	output D;
	
	assign D = BCD % 3 ? 1'b0 : 1'b1;
endmodule

module divby5(D, BCD);
	input [3:0] BCD;
	output D;
	
	assign D = BCD % 5 ? 1'b0 : 1'b1;
endmodule