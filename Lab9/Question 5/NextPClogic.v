`timescale 1ns / 1ps

module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
   input [63:0] CurrentPC, SignExtImm64;
   input 	Branch, ALUZero, Uncondbranch;
   output reg [63:0] NextPC;

   reg [63:0] 	     PC_4;

   always @(*) begin
      if(Uncondbranch|(Branch && ALUZero))
	NextPC <= #2 (SignExtImm64 << 2) + CurrentPC;
      else
	NextPC <= #1 CurrentPC + 4;
   end
endmodule
