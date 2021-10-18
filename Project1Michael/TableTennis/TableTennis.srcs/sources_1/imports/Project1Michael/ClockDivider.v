module ClockDivider(in, out, rst);
    input in, rst;
    output out;

    reg [23:0] currentCount, nCount;

    assign out = currentCount[6];

    always @(posedge in, negedge rst)
    begin
        if (rst == 0) begin currentCount <= 0; nCount <= 0; end
        else nCount <= currentCount + 1'b1;
    end

    always @(posedge in)
    begin
        currentCount <= nCount;
    end

endmodule