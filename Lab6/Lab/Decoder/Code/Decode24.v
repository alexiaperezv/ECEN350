`timescale 1ns/1ps
/*This module describes a 2:4 decoder using behavioral constructs*
*in Verilog HDL.*/

/*module interface for the 2:4 decoder*/
module Decode24(in, out);
   input [1:0] in; // 2-bit input
   output reg [3:0] out; // 4-bit output of type reg

   always @(in) begin // This always block is triggered any time the input changes
      case(in) // this is "equivalent" to a switch case in C++, depending on what the input is, sets different values for the output
	
	// 4'b signifies a 4-bit binary value, 2'b signifies 2-bit binary value
	2'b00:		out = 4'b0001; // value of the output when the input is 00 would be 0001
	2'b01:		out = 4'b0010; // value of output when input is 01 would be 0010
	2'b10:		out = 4'b0100; // value of output when input is 10 would be 0100
	2'b11:		out = 4'b1000; // value of output when input is 11 would be 1000
	
      endcase //desginates end "switch case" statement
   end // end of always block
		
endmodule // end of module
