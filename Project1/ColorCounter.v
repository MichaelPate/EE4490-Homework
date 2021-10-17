// Ean Hughes & Michael
// Project 1 
// This is the Count module which keeps track of how many bits have rotated in the Color Changer
module ColorCounter(Count,IncCounter,SetZero,clk,reset); // five total values given, 1 output, 2 inputs, clock and reset
	output 	[7:0]Count;       //This is the value that is output
	input	IncCounter;                  // This is the marker to say "Start counting"
	input	SetZero;					//This is the manual reset for THIS MODULE ONLY
	input 	clk, reset;                 // This is the clock that times it, and the reset option
		
		
	reg [7:0]  Count, nCount = 8'b00000000;  // This is where we determine what the actual counted number is and what the next one will be. Start at 0
	
	always@(negedge reset)						// Is the reset button pushed?
	begin 											// YES
		Count <= 8'b00000000;                           // Count is 0
		nCount <= 8'b00000000;                          // The next Count is 0
	end
	
	always@(SetZero)						// Is the SetZero button pushed?
	begin 											// YES
		Count <= 8'b00000000;                           // Count is 0
		nCount <= 8'b00000000;                          // The next Count is 0
		
		// The reason for this module is to change the count to 0 when the register reaches the 24 bit mark.
		// This reset only applies to this module and will be used often
	end
	
	always@(posedge clk)    //Everything below will happen whenever the clock is triggered
	begin                                  // Start
			
		if(IncCounter)                                // Is the GO button being pushed?
			begin                                            // YES
				nCount <= Count + 8'b00000001;                  // Next count is set equal to the previous count plus 1
			end
		
		Count <= nCount;                              // The Previous Count is changed to the value of the next count
						// Values are then output
		
	end                                    // end
	
	
		
	
endmodule