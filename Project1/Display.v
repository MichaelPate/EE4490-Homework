// Ean Hughes & Michael
// HDL Project 1
// This is the display module that will show what the LED's and the Score is

module displayModule(theoutputbits,Ready2Go,LED_out,pos,clk,clr,player1,player2,NumLEDs,start);
	// 5 Diode LED lights
	output theoutputbits;
	output Ready2Go;
	// 8 counter LED for score
	output [6:0] LED_out;
	output [3:0] pos;
	
	// Clock and reset
	// Player1's input Player2's input
	input clk,clr,player1,player2,start;
	input [3:1] NumLEDs;
	
	// This space is for wires
	wire [1:0] qmode;
	wire allDone, Done, bdone, ShipGRB, ClrCounter, IncCounter, theBit, LoadtheSW, ShiftPattern,StartCoding;
	wire [7:0] Count;
	wire [4:0] field;
	wire [3:0] muxd;
	
	//I have not modified the PONG module so we do not have the player inputs yet
	
	theOutput DemBits (theoutputbits,bdone,qmode,StartCoding,clk,clr);
	
	theGame	TheReader (qmode,Done,LoadtheSW,ShiftPattern,StartCoding,
          ClrCounter,IncCounter,ShipGRB,theBit,bdone,Count,NumLEDs,clk,clr,allDone);
		  
	LightsOn TURNITON (ShipGRB,Done,Go,clk,clr,allDone,Ready2Go);
	
	ColorCounter CNTCLRS (Count,IncCounter,ClrCounter,clk,clr);
	
	ColorChanger CHNGCLRS (theBit,field,LoadtheSW,ShiftPattern,clk,clr);
		  
	gameSM PONG (field,p1score,p2score,clk,clr,player1,player2,start);
	
	// Below is the mux machine and the hex converter for the score, we can add this later
	Mux4Machine(muxd,pos,p1score,p2score,clk,clr,ClrCounter);
	
	Hex27Seg(LED_out,muxd);
	
	
	
	
	
	
endmodule