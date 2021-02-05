.global lab03b
lab03b: 

	// initially, X0 = UIN 
	MOV X1, #0 // X1 = 0

loop :

	CMP X1, #10 // compare i to 10 (starts at 0)
	B.GE exit // branch out if i >= 10
	ADD X0, X0, #-1 // if i < 10, this statement subtracts 1 from X1 (where UIN is stored)
	ADD X1, X1, #1 // then i is incremented by 1 (for-loop goes from 0 to 9)
	B loop
exit:
	BR X30
	
.section .data
    UIN: .word 36

// returns value in register X0
