		.data
SRC:	.word 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
DEST:	.space 40
SUCCESS: .asciiz "Copy successful"

		.globl main
		.text
main:	li $t0, 10 # counter
		la $t1, SRC # Load base address of SRC
		la $t2, DEST # Load base address of DEST

loop:	lw $t3, 0($t1) # Load word from SRC
		sw $t3, 0($t2) # Store in DEST

		addi $t2, $t2, 4 # Move address 
		addi $t1, $t1, 4 
		
		addi $t0, $t0, -1 

		bnez $t0, loop

result:	li $v0, 4
		la $a0, SUCCESS
		syscall