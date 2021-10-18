// ShiftRegister.v
// determines the 24-bit control word for an LED module
// shifts it out one bit at a time
// keeps sending the same 24 bits, so same color to all modules

module ShiftRegister(CurrentBit,ParallelDataIn,LoadRegister,RotateRegisterLeft,clk,reset);
  output CurrentBit;
  input  [119:0] ParallelDataIn;
  input  LoadRegister, RotateRegisterLeft;
  input  clk, reset;

  parameter DEFAULTREG=120'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;  // white, half brightness

  reg [119:0]  TheReg, nTheReg;  // 24 bits for GRB control

  always @(posedge clk)
    if(reset) TheReg <= DEFAULTREG;
    else  TheReg <= nTheReg;
      
    // ParallelDataInitches set the upper 4 bits of the GRB control bytes
  always @(TheReg, LoadRegister, RotateRegisterLeft, ParallelDataIn)
    if(LoadRegister)
      nTheReg = ParallelDataIn;
    else if(RotateRegisterLeft)
      nTheReg = {TheReg[118:0],TheReg[119]};
    else
      nTheReg = TheReg;

  assign  CurrentBit = TheReg[119];
endmodule
