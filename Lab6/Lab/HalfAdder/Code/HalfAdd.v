module HalfAdd (Cout, Sum, A, B);
//This module describes a Half Adder using structural logic

input A, B; //declare inputs A and B
output Cout, Sum; //declare outputs Cout and Sum

//Internal Wires
wire W1, W2, W3; // we use 3 internal wires to get the desired output

//Gate-level modules, they define the operations performed for each wire
nand (W1, A, B); // wire 1 will hold the result from performing NAND with inputs A and B (NOT AND)
nand (W2, A, W1); // wire 2 will hold the result from performing NAND on input A and wire 1
nand (W3, W1, B); // wire 3 will hold the result from performing NAND on wires 1 and input B
nand (Sum, W2, W3); //Sum is nand of results from internal W2 and W3
nand (Cout, W1, W1); //Cout is nand of W1 and W1 for optimal designing

endmodule //designates the end of the module
