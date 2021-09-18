module BitCounter(Count, ClearCounter, IncCounter, clk, reset);
    output [7:0] Count;
    input ClearCounter, IncCounter;
    input clk, reset;

    reg [7:0] Count, nCount;

    //assign Count = nCount;

    always @(posedge clk)
    begin
        if (reset == 1) 
        begin
            nCount <= 8'b0;
            Count <= 8'b0;
        end
        else 
        begin
            if (IncCounter == 1) nCount <= nCount + 1;
            if (ClearCounter == 1) nCount <= 8'b0;
        end
        Count <= nCount;
    end

endmodule