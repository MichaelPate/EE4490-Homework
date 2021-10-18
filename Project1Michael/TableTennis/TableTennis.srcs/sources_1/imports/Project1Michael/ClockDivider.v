module ClockDivider(in, out, rst);
    input in, rst;
    output out;

    reg [31:0] currentCount;

    assign out = currentCount[23];

    always @(posedge in, negedge rst)
    begin
        if (rst == 0) begin currentCount <= 0;end
        else currentCount <= currentCount + 1'b1;
    end

endmodule