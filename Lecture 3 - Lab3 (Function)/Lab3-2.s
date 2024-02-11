		.data
SRC:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
DEST:	.space 40
MSG:	.asciiz "Transfer to DESC Array : "
Spacebar: .asciiz "\n"

		.globl main
		.text
main:	li $t0, 10 # counter
		la $t1, SRC # Load base address of SRC
		la $t2, DEST # Load base address of DEST

loop:	lw $t3, 0($t1) # Load word from SRC
		sw $t3, 0($t2) # Store in DEST
		addi $t1, $t1, 4 # Move address in SRC
		addi $t2, $t2, 4 # Move address in DEST
		addi $t0, $t0, -1 # Decrement

		bnez $t0, loop

		li $t0, 10 # counter
		la $t2, DEST # initialize DEST 

		li $v0, 4
		la $a0, MSG
		syscall

result_loop:	li $v0, 1
				lw $a0, 0($t2)
				syscall
				
				li $v0, 4
				la $a0, Spacebar
				syscall


				addi $t2, $t2, 4 # Move to next element
				addi $t0, $t0, -1 #Decrement
				bnez $t0, result_loop