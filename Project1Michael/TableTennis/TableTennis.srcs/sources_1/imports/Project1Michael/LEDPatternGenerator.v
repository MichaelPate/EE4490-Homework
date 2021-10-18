module LEDPatternGenerator(colorOutput, fieldInput);
    input [4:0] fieldInput;
    output reg [119:0] colorOutput;

    always @(fieldInput)
    begin
        case(fieldInput)
            5'b10000:   colorOutput = 120'h00FF00101010101010101010101010;
            5'b01000:   colorOutput = 120'h10101000FF00101010101010101010;
            5'b00100:   colorOutput = 120'h10101000FF00101010101010101010;
            5'b00010:   colorOutput = 120'h10101010101010101000FF00101010;
            5'b00001:   colorOutput = 120'h10101010101010101010101000FF00;
            default:    colorOutput = 120'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
        endcase
    end

endmodule

// 00FF00
// 101010