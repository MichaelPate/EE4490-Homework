`timescale 10ns/100ps
module tb_ShiftRegister;
    reg t_clk, t_reset;
    wire t_CurrentBit;

    reg t_LoadRegister, t_Rotate;
    reg [15:4] t_sw;

    ShiftRegister uut(t_CurrentBit, t_sw, t_LoadRegister, t_Rotate, t_clk, t_reset);

    initial begin $dumpfile("tb_ShiftRegister.vcd"); $dumpvars(0, tb_ShiftRegister);
    end

    initial begin t_clk = 0; forever #1 t_clk = ~t_clk; end

    initial begin t_LoadRegister=0; t_Rotate=0; t_sw=12'b0; t_reset=1; end

    initial
        fork
            #10 $finish;
        join
endmodule