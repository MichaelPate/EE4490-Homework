module LEDPatternGenerator(colorOutput, fieldInput);
    input [4:0] fieldInput;
    output reg [119:0] colorOutput;

    always @(fieldInput)
    begin
        case(fieldInput)
            5'b10000:   colorOutput = 120'h00FF00000000000000000000000000;
            5'b01000:   colorOutput = 120'h00000000FF00000000000000000000;
            5'b00100:   colorOutput = 120'h00000000000000FF00000000000000;
            5'b00010:   colorOutput = 120'h00000000000000000000FF00000000;
            5'b00001:   colorOutput = 120'h00000000000000000000000000FF00;
            5'b00000:   colorOutput = 120'h000000000000000000000000000000;
            default:    colorOutput = 120'hFFFFFF000000000000000000000000;
        endcase
    end

endmodule

// 00FF00
// 101010 -> FF0000 -> 000000