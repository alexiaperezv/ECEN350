.global lab03c
lab03c:
    // X0 = initial_value = 1 , which represents j
    MOV X2, #0 // i = 0
    ADR X3, my_array
loop:
    CMP X2, #10 // i <= 10
    B.GE exit
    STUR X0, [X3, 0] // my_array[X3] = j
    ADD X2, X2, #1 // ++i
    ADD X0, X0, #1 // ++j
    ADD X3, X3, #4 // x3 + 4 to make space for next number
    B loop
exit:
	BR X30
.section .data
    my_array: .space 40
