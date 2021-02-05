`timescale 1 ns/1 ps
`define STRLEN 15
// This module describes a 2-1 multiplexor, which connects 2 1-bit inputs to a "common destination"

module Mux21(out, in, sel); //define module name and "variables"

   // input and output declarations
	input [1:0] in; //inputs that get selected to the output
	input sel; // control signal (selector)
	output out; // output

   // internal wires
	wire andA; //output of first AND gate
	wire andB; //output of second AND gate
	
   // gate operations
	and (andA, in[0], ~sel); // take first 1-bit input and AND it with ~selector bit (NOT gate used for negation),result goes into wire andA
	and (andB, in[1], sel);  // take second  1-bit input and AND it with selector bit (NOT gate used for negation), result goes into wire andB
	or (out, andA, andB); // lastly, take wire andA and wire andB and OR them, store result in output wire
	
endmodule // end of module
