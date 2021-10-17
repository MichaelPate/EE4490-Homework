// Ean Hughes & Michael
// Project 1
// This is the Solid state machine that determines whether we light up the lights or not
module SSStateMachine(shipGRB,Done,Go,clk,reset,allDone,Ready2Go);
	output	shipGRB, Ready2Go;
	input	allDone, Done, Go;
	input	clk, reset;

	reg [1:0]	S, nS;
	parameter	SWAIT=2'b00, SSHIP=2'b01, SRET=2'b10, SDBOUNCE=2'b11;

	always @(posedge clk)
		if(reset)
			S <= SWAIT;
		else
			S <= nS;

	always @(S, Go, Done, allDone)
		case(S)
			SWAIT: 		nS = Go      ? SSHIP    : SWAIT;
			SSHIP:		nS = Done    ? SRET     : SSHIP;
      SRET:		  nS = allDone ? SDBOUNCE : SRET;
			SDBOUNCE:	nS = Go      ? SDBOUNCE : SWAIT;
			default:	nS = SWAIT;
		endcase

  assign Ready2Go = (S==SWAIT);  // okay to press Go
	assign shipGRB  = (S==SSHIP);  // send data bits
endmodule