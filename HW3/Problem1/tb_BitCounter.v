// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// tb_BitCounter.v

`timescale 10ns/100ps
module tb_BitCounter;
    wire [7:0] t_Count;

    reg t_ClearCounter, t_IncCounter;
    reg t_clk, t_reset;

    BitCounter uut(t_Count, t_ClearCounter, t_IncCounter, t_clk, t_reset);

    initial begin $dumpfile("tb_BbitCounter.vcd"); $dumpvars(0, tb_BitCounter);
    end

    initial begin t_clk = 0; forever #1 t_clk = ~t_clk; end

    initial begin t_ClearCounter = 0; t_IncCounter = 0; t_reset = 1; end

    initial
        fork
            #2      begin t_reset = 0; t_IncCounter = 1; end
            #10     t_IncCounter = 0;
            #18     t_IncCounter = 1;
            #22     t_IncCounter = 0;
            #26     t_ClearCounter = 1;
            #28     t_ClearCounter = 0;
            #30     t_IncCounter = 1;
            #33     t_ClearCounter = 1;
            #35     t_ClearCounter = 0;
            #36     t_reset = 1;
            #38     t_reset = 0;
            #45     t_IncCounter = 0;
            #50     t_ClearCounter = 0;
            #55     t_IncCounter = 1;
            #100    $finish;
        join
endmodule