module BitCounter(Count, ClearCounter, IncCounter, clk, reset);
    output [7:0] Count;
    input ClearCounter, IncCounter;
    input clk, reset;

    reg [7:0] Count, nCount;

    //assign Count = nCount;

    // Handle reset or clear counter inputs
    always @(posedge clk)
    begin
        if (reset == 1 | ClearCounter == 1)
        begin
            Count <= 0;
            nCount <= 0;
        end
        else
            Count <= nCount;
    end

    always @(posedge clk)
    begin
        if (reset == 1)
        begin
            nCount <= 0;
        end
        else
            nCount <= nCount + 1;
        
    end

endmodule