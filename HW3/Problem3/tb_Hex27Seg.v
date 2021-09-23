// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// tb_Hex27Seg.v

`timescale 10ns/10ps
module tb_Hex27Seg;

    wire [0:6] t_Leds;
    reg [3:0] t_HexVal;

    initial begin $dumpfile("tb_Hex27Seg.vcd"); $dumpvars(0, tb_Hex27Seg); end

    Hex27Seg uut(t_Leds, t_HexVal);

    initial t_HexVal = 4'b0;

    initial
    fork
        #00      t_HexVal = 4'b0;
        #10      t_HexVal = 4'h1;
        #20      t_HexVal = 4'h2;
        #30      t_HexVal = 4'h3;
        #40      t_HexVal = 4'h4;
        #50      t_HexVal = 4'h5;
        #60      t_HexVal = 4'h6;
        #70      t_HexVal = 4'h7;
        #80      t_HexVal = 4'h8;
        #90      t_HexVal = 4'h9;
        #100     t_HexVal = 4'hA;
        #110     t_HexVal = 4'hB;
        #120     t_HexVal = 4'hC;
        #130     t_HexVal = 4'hD;
        #140     t_HexVal = 4'hE;
        #150     t_HexVal = 4'hF;
        #160     $finish;
    join

endmodule