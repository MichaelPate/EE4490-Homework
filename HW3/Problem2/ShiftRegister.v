// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// ShiftRegister.v

module ShiftRegister(CurrentBit, sw, LoadRegister, RotateRegisterLeft, clk, reset);
    output CurrentBit;
    input [15:4] sw;
    input LoadRegister, RotateRegisterLeft;
    input clk, reset;

    parameter DEFAULTREG = 24'h0F0F0F;

    reg [23:0] TheReg, nTheReg;

    assign CurrentBit = TheReg[23];

    always @(posedge clk)
    begin
        if (reset)
        begin
            TheReg <= DEFAULTREG;
        end
        else if (LoadRegister == 1)
        begin
            TheReg[3:0]     <= 4'b0;
            TheReg[7:4]     <= sw[7:4];
            TheReg[11:8]    <= 4'b0;
            TheReg[15:12]   <= sw[11:8];
            TheReg[19:16]   <= 4'b0;
            TheReg[23:20]   <= sw[15:12];
        end
        else if (RotateRegisterLeft == 1)
        begin
            TheReg <= {TheReg[22:0], TheReg[23]};
            //TheReg <= (TheReg << 1) | (TheReg >> ~1);
        end
    end


endmodule