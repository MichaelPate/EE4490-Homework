module LEDPatternGenerator(colorOutput, fieldInput, clk, rst);
    input [4:0] fieldInput;
    output reg [119:0] colorOutput;

    always @(fieldInput)
    begin
        case(fieldInput)
            5'b10000:   colorOutput = 120'h00FF000F0F0F0F0F0F0F0F0F0F0F0F;
            5'b01000:   colorOutput = 120'h0F0F0F00FF000F0F0F0F0F0F0F0F0F;
            5'b00100:   colorOutput = 120'h0F0F0F0F0F0F00FF000F0F0F0F0F0F;
            5'b00010:   colorOutput = 120'h0F0F0F0F0F0F0F0F0F00FF000F0F0F;
            5'b00001:   colorOutput = 120'h0F0F0F0F0F0F0F0F0F0F0F0F00FF00;
            default:    colorOutput = 120'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
        endcase
    end

endmodule

// 00FF00