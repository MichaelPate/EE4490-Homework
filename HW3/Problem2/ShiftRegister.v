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
        else if (LoadRegister)
        begin
            TheReg[3:0]     <= 4'b0;
            TheReg[7:4]     <= sw[7:4];
            TheReg[11:8]    <= 4'b0;
            TheReg[15:12]   <= sw[15:12];
            TheReg[19:16]   <= 4'b0;
            TheReg[23:20]   <= sw[23:20];
        end
        else if (RotateRegisterLeft)
        begin
            TheReg <= TheReg << 1;
        end
    end


endmodule