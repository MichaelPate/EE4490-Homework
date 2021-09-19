`timescale 10ns/100ps
module tb_BitCounter;
    wire [7:0] t_Count;

    reg t_ClearCounter, t_IncCounter;
    reg t_clk, t_reset;

    BitCounter uut(t_Count, t_ClearCounter, t_IncCounter, t_clk, t_reset);

    initial
    begin
        $dumpfile("tb_BbitCounter.vcd");
        $dumpvars(0, tb_BitCounter);
    end

    initial begin t_clk = 0; forever #1 t_clk = ~t_clk; end

    initial
    begin
        t_ClearCounter = 0; t_IncCounter = 0; t_reset = 0;
    end
    
    initial
    begin
        #00     begin t_reset = 1; t_ClearCounter = 0; t_IncCounter = 0; end
        #12     begin t_reset = 0; t_ClearCounter = 0; t_IncCounter = 1; end
        #12     begin t_reset = 0; t_ClearCounter = 1; t_IncCounter = 1; end
        #12     begin t_reset = 0; t_ClearCounter = 0; t_IncCounter = 1; end
        #12     begin t_reset = 1; t_ClearCounter = 0; t_IncCounter = 1; end
        #12     begin t_reset = 0; t_ClearCounter = 0; t_IncCounter = 1; end
        #12     begin t_reset = 0; t_ClearCounter = 0; t_IncCounter = 0; end
        #12     begin t_reset = 0; t_ClearCounter = 1; t_IncCounter = 0; end
        #10     $finish;
    end

endmodule