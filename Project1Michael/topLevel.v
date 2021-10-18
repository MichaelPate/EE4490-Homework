
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
    wire [119:0] colorData;

    gameSM MainGameSM(currentField, player1score, player2score,
        gameClk, rst, paddle1, paddle2, serve);

    SimpleSend LEDController(RGBSerialData, colorData, /** Go **/, clk, rst, /** Ready2Go **/);

    LEDPatternGenerator FieldStateAdapter(colorData, currentField);
    // Need an adapter that takes currentField and generates 120 bits based off that.
    // Those 120 bits go to SimpleSend's ColorDataIn.
    // Which gets passed to a shift register for output.
    // Just need to tick SimpleSend's Go input

endmodule