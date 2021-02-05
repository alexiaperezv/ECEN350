`timescale 1ns / 1ps
`define AND    4'b0000
`define ORR    4'b0001
`define ADD    4'b0010
`define SUB    4'b0110
`define PASSB  4'b0111

module alu(
	   output [63:0] BusW,
	   output 	 Zero,
	   input [63:0]  BusA,
	   input [63:0]  BusB,
	   input [3:0] 	 ALUCtrl
	   );
   
   wire [63:0] 		 subresults [15:0];
   
   assign BusW = subresults[ALUCtrl];
   assign Zero = (BusW==0)?1'b1:1'b0;
   
   
   // Assign subresults
   assign subresults[`AND   ] = BusA & BusB;
   assign subresults[`ORR   ] = BusA | BusB;
   assign subresults[`ADD   ] = BusA + BusB;
   assign subresults[`SUB   ] = BusA - BusB;
   assign subresults[`PASSB ] = BusB;
   
endmodule
