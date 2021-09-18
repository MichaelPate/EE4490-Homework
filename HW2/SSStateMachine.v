// Michael Pate
// Professor Chao Jiang
// EE 4490 HDL Design
// Homework 2 - September 13, 2021
// SSStateMachine.v

module SSStateMachine(shipGRB, Done, Go, clk, reset, allDone, Ready2Go);
    output reg shipGRB, Ready2Go;
    input allDone, Done, Go;
    input clk, reset;
    
    reg [1:0] S, nS;
    parameter SWAIT=2'b00, SSHIP=2'b01, SRET=2'b10, SDBOUNCE=2'b11;

    // Generate current state (Moore) outputs
    always @(S)
    begin
        case (S)
            SWAIT:      begin Ready2Go = 1; shipGRB = 0; end
            SSHIP:      begin Ready2Go = 0; shipGRB = 1; end
            SRET:       begin Ready2Go = 0; shipGRB = 0; end
            SDBOUNCE:   begin Ready2Go = 0; shipGRB = 0; end
        endcase
    end

    // Handle reset and state switching
    always @(posedge clk, posedge reset)
    begin
        if (reset == 1) S <= SWAIT;
        else S <= nS;
    end

    // Generate the next state
    always @(S, allDone, Done, Go)
    begin
        case (S)
            SWAIT:      if (Go) nS = SSHIP; else nS = SWAIT;
            SSHIP:      if (Done) nS = SRET; else nS = SSHIP;
            SRET:       if (allDone) nS = SDBOUNCE; else nS = SRET;
            SDBOUNCE:   if (Go) nS = SDBOUNCE; else nS = SWAIT;
        endcase
    end

endmodule