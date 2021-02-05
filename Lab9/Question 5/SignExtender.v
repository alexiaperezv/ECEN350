`timescale 1ns/ 1ps
module SignExtender(BusImm, Imm26, Ctrl);

   input [25:0] Imm26;
   input [2:0] 	Ctrl;
   output reg [63:0] BusImm;

   always@(*) begin
      case(Ctrl)
        3'b001: BusImm = {{45{Imm26[23]}}, Imm26[23:5]}; // CBZ
        3'b011: BusImm = {{36{Imm26[25]}}, Imm26[25:0]}; // B
        3'b000: BusImm = {{55{Imm26[20]}}, Imm26[20:12]};  // D type instruction
        3'b010: BusImm = {52'b0, Imm26[21:10]}; // I type instruction
        3'b111: // IW type instruction
	   
	  begin
	     case(Imm26[22:21])
	       2'b00: BusImm <= {{48{1'b0}}, Imm26[20:5]};
	       2'b01: BusImm <= {{32{1'b0}}, {Imm26[20:5], {16{1'b0}}}};
	       2'b10: BusImm <= {{16{1'b0}}, {Imm26[20:5], {32{1'b0}}}};
	       2'b11: BusImm <= {Imm26[20:5], {48{1'b0}}};
	     endcase
	  end

	default: BusImm <= 64'b0;
      endcase
   end
endmodule
