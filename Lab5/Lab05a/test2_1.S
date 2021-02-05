// final version of test2.S (for Question 10)
.globl test2

test2:

    SUB X1, X0, X1 // subtracts X0-X1 (second argument from first argument) and stores result in X1. 

    ADRP X0, output_msg // loads the output message "Result of test2(6, 5) = %d\n" into X0
    ADD X0,X0, :lo12:output_msg // loads the last 12 bits of above message into X0

    SUB SP, SP, #16 // get space on the stack for 2 variables
    STUR X30, [SP, #0] // store the old address of X30 for the branch in the stack

    BL printf // branch to "printf" function

    LDUR X30, [SP, #0] // get old branch address back
    ADD SP, SP, #16 // free the allocated space from stack

    BR X30 // back to main

.section    .data

output_msg:    .asciz "Result of test2(6, 5) =  %d\n" // this is the output message to be displayed by the printf function

// This program will compute 6-5 = 1, store 1 in register X1, then store the output message in X0. 
// Finally, it will return X0 (the output message) followed by X1 (the result of the actual subtraction)
// The point of "writing the disassembly of printf" here, is so that we do not need to use printf in the main.c, instead, the test2 function will already take care of the printing
// ARMv8 only takes multiples of 16 for allocation of space in the spa