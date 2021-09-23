// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 3 - September 23, 2021
// BitCounter.v

module BitCounter(Count, ClearCounter, IncCounter, clk, reset);
    output [7:0] Count;
    input ClearCounter, IncCounter;
    input clk, reset;

    reg [7:0] Count;

    // Handle reset or clear counter inputs
    always @(posedge clk)
    begin
        if (reset == 1) Count <= 0;
        else if (ClearCounter == 1) Count <= 0;
        else if (IncCounter == 1) Count <= Count + 1;
    end

endmodule