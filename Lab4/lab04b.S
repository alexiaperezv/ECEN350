.global lab04b

lab04b:

    // Before computation
    SUB SP, SP, #32         // allocate 2 bytes on the stack because we have to push two variables (each is 16 bits)
    STUR X0, [SP, #0]       // store user value in the stack
    STUR X30, [SP, #16]     // store return register in the stack

    // Computation of factorial
    CBZ X0, else           // if value of XO = 0, go to "else" branch, otherwise keep going in this branch
    MOV X1, X0             // sets X1 = X0 (m = user value (n))
    SUB X0, X0, #1         //  sets n to n - 1
    BL lab04b              // loop back and store change variables on stack
    LDUR X1, [SP, #0]      // restore m into X1
    BL my_mul              // branch to my_mul function to compute m * n
    LDUR X30, [SP, #16]    // load return address into X30

    // After computation
    ADD SP, SP, #32        // release space from stack (avoids segmentation faults)
    BR X30                 // returns result to main function

else:

    // Since the given number is = 0, and 0! = 1
    MOV X0, #1      // Set the value in register X0 = 1
    ADD SP, SP, #32 // release space from stack (avoids segmentation faults) 
    BR X30 // returns to main
