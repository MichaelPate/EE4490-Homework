module ShiftRegister(CurrentBit, sw, LoadRegister, RotateRegisterLeft, clk, reset);
    output CurrentBit;
    input [15:4] sw;
    input LoadRegister, RotateRegisterLeft;
    input clk, reset

    parameter DEFAULTREG = 24'h0F0F0F;

    reg [23:0] TheReg, nTheReg;

    

endmodule