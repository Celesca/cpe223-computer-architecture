	.data
X:	.word	1, 5, 81, 41, 56, 59, 14, 77
N:  .word	8
max_number:	.asciiz	"The max number in array is : "
min_number: .asciiz "\nThe min number in array is : "
	.globl main
	.text

main:	la $t0, X
		lw $t1, N # counter

		jal MinMax

		li $v0, 4
		la $a0, max_number
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 4
		la $a0, min_number
		syscall

		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 10
		syscall


MinMax:	lw $t2, 0($t0) # max_value
		move $t3, $t2 # min_value
		

loop:	lw $t4, 0($t0) # Current number


		# Update Min
		ble $t4, $3, min_update
		

		# Update max_value
		bge $t4, $t2, max_update

final_check:		addi $t1, $t1, -1 # Decrement
					addi $t0, $t0, 4 # Next word with 4 bytes
					bnez $t1, loop
					jr $ra
		
min_update:
	move $t3, $t4
	j final_check

max_update:
	move $t2, $t4
	j final_check