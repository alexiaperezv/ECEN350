module SignExtender(BusImm, Imm26, Ctrl);
   output reg [63:0] BusImm;
   input [25:0]      Imm26;
   input [1:0]	     Ctrl;
   
   
   wire 	     extBit;
   
   always@(*) // if any values change, start this block
     begin
	
        if(Ctrl[1:0] == 2'b00) begin  // I-type: ADD, SUB, when control signal is = 00
	   BusImm = {52'b0,Imm26[21:10]}; 
        end
	
        if(Ctrl[1:0] == 2'b01)begin // D-Type: Load/Store, when control signal = 01
           BusImm = {{55{Imm26[20]}}, Imm26[20:12]}; 
	end
	
	if(Ctrl[1:0] == 2'b10)begin // Branch, when control signal = 10
           BusImm = {{38{Imm26[25]}}, Imm26[25:0]}; 
	end
	
	if(Ctrl[1:0] == 2'b11)begin // Conditional Branch, when control signal = 11
	   BusImm = {{45{Imm26[23]}}, Imm26[23:5]};
	end
	
     end
endmodule
