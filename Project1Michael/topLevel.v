
/**
        The top level module needs to connect SimpleSend, the game SM, and score counters and an interface to the seven segment display.



**/

module topLevel();
    input clk, rst;
    input paddle1, paddle2, serve;
    output RGBSerialData;
    output [3:0] sevenSegmentDigit;
    output [6:0] sevemSegmentData;

    wire [4:0] currentField; 
    wire player1score, player2score;
    wire gameClk;

    gameSM mainGameSM(currentField, player1score, player2score,
        gameClk, rst, paddle1, paddle2, serve);
        
    SimpleSend LEDController();

endmodule