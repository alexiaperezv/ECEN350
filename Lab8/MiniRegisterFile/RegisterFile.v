module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
   output [63:0] BusA;
   output [63:0] BusB;
   input [63:0]  BusW;
   input [4:0] 	 RA;
   input [4:0] 	 RB;
   input [4:0] 	 RW;
   input 	 RegWr;
   input 	 Clk;
   
   reg [63:0] 	 register [31:0]; // 64, 32-bit registers
   
   
   always@(negedge Clk) begin
      
      if(RegWr)begin
	 if(RW != 31)begin
	    register[RW] <= BusW;
	 end
      end
      
   end
   assign BusA = (RA==31)?0:register[RA]; // RA indices the registers value on BusA
   assign BusB = (RB==31)?0:register[RB];// RB indices the registers value on BusB
endmodule
