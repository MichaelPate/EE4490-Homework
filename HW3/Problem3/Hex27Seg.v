// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// Hex27Seg.v

module Hex27Seg(Leds, HexVal);
    output [0:6] Leds;
    input [3:0] HexVal;
    reg [0:6] Leds;

    always @(HexVal)
    begin
        case (HexVal)
            4'b0000: Leds = 7'b1111110;
            4'b0001: Leds = 7'b0110000;
            4'b0010: Leds = 7'b1101101;
            4'b0011: Leds = 7'b1111001;
            4'b0100: Leds = 7'b0110011;
            4'b0101: Leds = 7'b1011011;
            4'b0110: Leds = 7'b1011111;
            4'b0111: Leds = 7'b1110000;
            4'b1000: Leds = 7'b1111111;
            4'b1001: Leds = 7'b1111011;
            4'b1010: Leds = 7'b1110111;
            4'b1011: Leds = 7'b0011111;
            4'b1100: Leds = 7'b1001110;
            4'b1101: Leds = 7'b0111101;
            4'b1110: Leds = 7'b1001111;
            4'b1111: Leds = 7'b1000111;
        endcase
    end


endmodule