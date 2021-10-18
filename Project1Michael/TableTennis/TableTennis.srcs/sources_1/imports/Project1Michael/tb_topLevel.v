`timescale 10ns/1ns
`include "gameSM.v"
`include "SimpleSend.v"
`include "LEDPatternGenerator.v"
`include "ClockDivider.v"
`include "SSStateMachine.v"
`include "GRBStateMachine.v"
`include "ShiftRegister.v"
`include "BitCounter.v"
`include "NZRBitGEN.v"
module tb_topLevel();
    reg t_clk, t_rst;
    reg t_pad1, t_pad2, t_serve;
    wire t_RGBSerialData;
    wire [3:0] t_anodeSelect;
    wire [6:0] t_sevenSegmentData;
    wire t_readyLED;

    topLevel uut(t_RGBSerialData, t_anodeSelect, t_sevenSegmentData,
        t_readyLED, t_clk, t_rst, t_pad1, t_pad2, t_serve);
    
    initial
	begin
		$dumpfile("tb_topLevel.vcd");
		$dumpvars(0, tb_topLevel);
	end

    always #1 t_clk = !t_clk;

    initial
    begin
        t_rst = 1;
        t_clk = 0;
        t_pad1 = 0;
        t_pad2 = 0;
        t_serve = 0;
    end

    initial
    begin
        #5 t_rst = 0;
        #30 t_serve = 1;
        #6000 t_serve = 0;
        #900000 $finish;
    end

endmodule