	.data
Z: .word 0
value: .word 12

	.text
	.globl main

main:

	li $t2, 25 # Load immediate value (25)

	lw $t3, value # Load the word stored in value (see above)

	add $t4, $t2, $t3 # Add
	sub $t5, $t2, $t3 # Subtract

	sw $t5, Z #Store the answer in Z (declared at the above)

	

	li $v0, 4 # Print integer
	move $a0, $t4 # Move the value to be printed into $a0
	syscall # Print the value

	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit 