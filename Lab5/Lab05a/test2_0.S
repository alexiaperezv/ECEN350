// initial version of test2.S (For question 6)
.globl test2

test2: 
        SUB X0, X0, X1 // subtracts the second argument from the first and stores the result in X0
        BR x30 // returns to main.c 