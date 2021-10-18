/**
	Michael Pate and Ean Hughes
	Professor Jiang
	HDL Digital Design
	UWYO EE 4490
	October 15, 2021
	gameSM.v
**/

module gameSM(field,p1score,p2score,clk,rst,paddle1,paddle2, serve);
	input clk, rst;
	input paddle1, paddle2, serve;
	
	output [4:0] field;
	output reg p1score, p2score;
	
	reg dir = 1;
	
	reg [4:0] S, nS;
	parameter [4:0] S_idle=5'b00000, S_1=5'b10000, S_2=5'b01000, S_3=5'b00100, S_4=5'b00010, S_5=5'b00001;
	assign field = S;
	
	// Handle reset
	always @(negedge rst)
	begin
		if (rst == 0)
			begin
				S <= S_idle;
				nS<= S_idle;
				p1score <= 0;
				p2score <= 0;
			end
	end	
	
	// Change states and handle moore outputs
	always @(posedge clk)
	begin
		case(S)
		S_idle:	begin
					//if (serve) nS <= dir ? S_4 : S_2;
					p1score <= 0;
					p2score <= 0;
					if (serve) nS <= S_3;
					else nS <= S_idle;
				end
		
		S_1:	begin 
					if (paddle1)
					begin
						dir <= 1;
						nS <= S_2;
					end
					else
					begin
						p2score <= 1;
						p1score <= 0;
						nS <= S_idle;
					end
				end
				
		S_2:	begin
					nS <= dir ? S_3 : S_1;
					p1score <= 0;
					p2score <= 0;
				end
				
		S_3:	begin
					nS <= dir ? S_4 : S_2;
					p1score <= 0;
					p2score <= 0;
				end
				
		S_4:	begin
					nS <= dir ? S_5 : S_3;
					p1score <= 0;
					p2score <= 0;
				end
				
		S_5:	begin 
					if (paddle2)
					begin
						dir <= 0;
						nS <= S_4;
					end
					else
					begin
						p2score <= 0;
						p1score <= 1;
						nS <= S_idle;
					end
				end	
		endcase
	end
	
	always @(posedge clk)
	begin
		S <= nS;
	end

endmodule