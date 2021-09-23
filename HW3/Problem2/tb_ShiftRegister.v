// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// tb_ShiftRegister.v

`timescale 10ns/10ps
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
            #2  t_reset = 0;
            #2  t_sw = 12'hABC;
            #4  t_LoadRegister = 1;
            #6  t_LoadRegister = 0;
            #10 t_Rotate = 1;

            #20 t_Rotate = 0;
            #20 t_sw = 12'hDEF;
            #25 t_LoadRegister = 1;
            #28 t_LoadRegister = 0;
            #30 t_Rotate = 1;

            #60 $finish;
        join
endmodule