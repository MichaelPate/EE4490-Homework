// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 2 - September 13, 2021
// tb_SSStateMachine.v
`timescale 10ns/100ps
module tb_SSStateMachine();

    wire t_shipGRB, t_Ready2Go;
    reg t_allDone, t_Done, t_Go, t_clk, t_reset;

    SSStateMachine uut(t_shipGRB, t_Done, t_Go, t_clk, t_reset, t_allDone, t_Ready2Go);

    // Setup capture device
    initial
    begin
        $dumpfile("tb_SSStateMachine.vcd");
        $dumpvars(0, tb_SSStateMachine);
    end

    // Clock generation and simulation timer
    initial begin t_clk = 0; forever #1 t_clk = ~t_clk; end

    // Initial conditions
    initial
    begin
        t_allDone = 0;
        t_Done = 0;
        t_Go = 0;
        t_reset = 1;
    end

    // Stimulus
    initial
    begin
        #0     begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #40     begin t_allDone = 0; t_Done = 0; t_Go = 1; t_reset = 0; end
        #10     begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #80     begin t_allDone = 0; t_Done = 1; t_Go = 0; t_reset = 0; end
        #10     begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #80     begin t_allDone = 0; t_Done = 0; t_Go = 1; t_reset = 0; end
        #10    begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #80     begin t_allDone = 1; t_Done = 0; t_Go = 0; t_reset = 0; end
        #10     begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #80     begin t_allDone = 0; t_Done = 0; t_Go = 1; t_reset = 0; end
        #80     begin t_allDone = 0; t_Done = 1; t_Go = 1; t_reset = 0; end
        #10     begin t_allDone = 0; t_Done = 0; t_Go = 1; t_reset = 0; end
        #80     begin t_allDone = 1; t_Done = 0; t_Go = 1; t_reset = 0; end
        #10     begin t_allDone = 0; t_Done = 0; t_Go = 1; t_reset = 0; end
        #80     begin t_allDone = 0; t_Done = 0; t_Go = 0; t_reset = 0; end
        #80 $finish;
    end   

endmodule