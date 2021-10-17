// Ean Hughes
//HW4 
// This will be modified to fit the changes in the clock counter


// Mux4Machine.v
// State machine to drive multiplexed four-bit values for display
// on Digilent BASYS2 and BASYS3 seven segment displays.  Assumes
// a high speed input clock, uses internal counter to time-multiplex
// the four display signals.  Inputs:
// 
// A=>MSD .... D=>LSD   i.e., A is the left most display.
// blank[3:0] ... If bit is a 1, that digit will be blank. Includes reset.
//
// Note output muxd must be decoded to seven segment signals 
// 
module Mux4Machine(muxd,adrive,Play1,Play2,clk,reset,manReset);
  output [3:0] muxd; // The multiplexed output selected from A,B,C,D
  output [3:0] adrive;  // Active low common anode drive of display
  input 	Play1, Play2;
  input     clk, reset, manReset;
  
  wire [7:0] Numberzz1, Numberzz2;
  
  reg    [3:0] muxd, adrive;
  
  parameter NUMSVAR=20;
  //parameter NUMSVAR=8;   // for testing
  // Time-multiplexing: A count of 2^NUMSVAR total clock ticks
  // will occur across one full display of four digits.
  // With a 100 MHz clock (10 ns period), that means 10 ns * 2^20 
  // = 10 ns/tick * 1.048576E6 ticks = 10.48576 ms. That is, the whole
  // display is updated around 95 times per second (95 Hz),
  // with each display "on" for 2.62 ms out of every 10.48 ms.
  reg    [NUMSVAR:1] nS, S; // Internal states to provide clk division
  
  
  ColorCounter Player2 (Numberzz2,Play2,manReset,clk,reset);
  
  ColorCounter Player1 (Numberzz1,Play1,manReset,clk,reset);

  always@(posedge clk)
  begin
    if (reset) 
        begin
            S <= 0;
            nS <= 0;
        end
        
    S <= nS;
    
    nS <= S + 1;
  end

  always @(S[NUMSVAR:NUMSVAR-1] or Numberzz1 or Numberzz2)
  begin
    case(S[NUMSVAR:NUMSVAR-1])
        2'b11: begin muxd <= Numberzz1[3:0]; adrive=(4'b0111); end
        2'b10: begin muxd <= 4'b0000; adrive=(4'b1011); end
        2'b01: begin muxd <= 4'b0000; adrive=(4'b1101); end
        2'b00: begin muxd <= Numberzz2[3:0]; adrive=(4'b1110); end
        default: begin muxd <= 4'b0000; adrive=4'b1111; end
    endcase
  end
endmodule
