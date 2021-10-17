// Ean Hughes
// HW 4 
// 8 number counter from 0 to 8
module Hex27Seg(Leds,HexVal);
	output	[6:0] Leds;
	input	[3:0] HexVal;
	reg		[6:0] Leds;
	
	always @(HexVal)
	begin
	case(HexVal)
			4'h0:	Leds <= 7'b000_0001; //0
			4'h1:	Leds <= 7'b100_1111; //1
			4'h2:	Leds <= 7'b001_0010; //2
			4'h3:	Leds <= 7'b000_0110; //3
			4'h4:	Leds <= 7'b100_1100; //4
			4'h5:	Leds <= 7'b010_0100; //5
			4'h6:	Leds <= 7'b010_0000; //6
			4'h7:	Leds <= 7'b000_1111; //7
			4'h8:	Leds <= 7'b000_0000; //8
			4'h9:	Leds <= 7'b000_1100; //9
			4'hA:	Leds <= 7'b000_1000; //A
			4'hB:	Leds <= 7'b110_0000; //B
			4'hC:	Leds <= 7'b011_0001; //C
			4'hD:	Leds <= 7'b100_0010; //D
			4'hE:	Leds <= 7'b011_0000; //E
			4'hF:	Leds <= 7'b011_1000; //F
			default:	Leds <= 7'b111_1111; //off
	 endcase
	end
endmodule