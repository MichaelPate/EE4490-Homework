// Ean Hughes & Michael 
// Project 1 Shifting Module
// This module sends data about what color the light will be. By rotating it through a series of 24 bits we send one bit 
// at a time, and when we get to the last bit we will stop and switch to the next light out of 5
module ColorChanger(CurrentBit,sw,LoadRegister,RotateRegisterLeft,clk,reset);
		output 	CurrentBit;
		input	[4:0]sw;
		input	LoadRegister, RotateRegisterLeft;
		input 	clk, reset;
		
	parameter DEFAULTREG=120'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;   // The color is white here
	
	reg [119:0]	TheReg, nTheReg;
	reg CurrentBit;
	
	parameter [4:0] S_idle=5'b00000, S_1=5'b10000, S_2=5'b01000, S_3=5'b00100, S_4=5'b00010, S_5=5'b00001;
	
	always@(negedge reset)			// This is the reset to turn the colors back to white
	begin
		TheReg <= DEFAULTREG;
		nTheReg <= DEFAULTREG;
	end
	
	
	always@(posedge clk)			// This refreshes the color changer
	begin
		TheReg <= nTheReg;
	end
		
	always@(LoadRegister, RotateRegisterLeft, TheReg, nTheReg, sw)
	begin
		case(sw)
		S_idle: begin
					if (LoadRegister == 1)
						begin
							nTheReg <= 120'h0F0F0F0F0F0F0FFF0F0F0F0F0F0F0F;
						end
				end
		
		S_1: begin
				if (LoadRegister == 1)
					begin
						nTheReg <= 120'h0FFF0F0F0F0F0F0F0F0F0F0F0F0F0F;
					end
			 end
				
		S_2: begin
				if (LoadRegister == 1)
					begin
						nTheReg <= 120'h0F0F0F0FFF0F0F0F0F0F0F0F0F0F0F;
					end
		
			 end
				
		S_3: begin
				if (LoadRegister == 1)
					begin
						nTheReg <= 120'h0F0F0F0F0F0F0FFF0F0F0F0F0F0F0F;
					end
		
			 end
				
		S_4: begin
				if (LoadRegister == 1)
					begin
						nTheReg <= 120'h0F0F0F0F0F0F0FFF0F0FFF0F0F0F0F;
					end
		
			 end
				
		S_5: begin
				if (LoadRegister == 1)
					begin
						nTheReg <= 120'h0F0F0F0F0F0F0FFF0F0F0F0F0FFF0F;
					end
		
			 end
		
		
		endcase
		
		
		//old code
		//if (LoadRegister == 1)			// This loads the register with the color we want the light to be
			//begin
				//nTheReg[23:20] <= sw[15:12];	// Green Light
				//nTheReg[15:12] <= sw[11:8];		// Red Light
				//nTheReg[7:4] <= sw[7:4];		// Blue Light
			//end
			
		if (RotateRegisterLeft == 1) 
			begin
				nTheReg <= {TheReg[118:0],TheReg[119]};
				
			end
		
		
		CurrentBit <= TheReg[119];
	end
		
	
endmodule