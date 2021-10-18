
/**
        The top level module needs to connect SimpleSend, the game SM, and score counters and an interface to the seven segment display.



**/

module topLevel(RGBSerialData, sevenSegmentDigit, sevenSegmentData, readyLED, clk, rstAL, paddle1, paddle2, serve);
    input clk, rstAL;
    input paddle1, paddle2, serve;
    output RGBSerialData;
    output [3:0] sevenSegmentDigit;
    output [6:0] sevenSegmentData;
    output readyLED;

    wire [4:0] currentField; 
    wire player1score, player2score;
    wire gameClk;
    wire [119:0] colorData;
    wire ReadyForNextState;
    wire rst;

    assign readyLED = gameClk;
    assign rst = !rstAL;
 
    gameSM MainGameSM(currentField, player1score, player2score,
        gameClk, rst, ReadyForNextState, paddle1, paddle2, serve);

    SimpleSend LEDController(RGBSerialData, colorData, gameClk, clk, rst, ReadyForNextState);

    // Need an adapter that takes currentField and generates 120 bits based off that.
    // Those 120 bits go to SimpleSend's ColorDataIn.
    // Which gets passed to a shift register for output.
    // Just need to tick SimpleSend's Go input using gameClk
    LEDPatternGenerator FieldStateAdapter(colorData, currentField);

    // Need to generate gameClk.
    ClockDivider gameClkGenerator(clk, gameClk, rst);

    // Need to add score counters and seven segment display

endmodule