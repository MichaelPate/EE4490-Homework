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