	.data
X:	.word	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
N:  .word	10
max:	.asciiz	"Max : "
min: .asciiz "\nMin : "
	.globl main
	.text

main:	la $t0, X
		lw $t1, N # counter

		jal MinMax

		li $v0, 4
		la $a0, max
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 4
		la $a0, min
		syscall

		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 10
		syscall

MinMax:	lw $t2, 0($t0)
		move $t3, $t2 
		
loop:	lw $t4, 0($t0)

		ble $t4, $3, min_update
		
		bge $t4, $t2, max_update

		j final

min_update:
	move $t3, $t4
	j final

max_update:
	move $t2, $t4
	j final

final:	addi $t1, $t1, -1 # Decrement
		addi $t0, $t0, 4 # Next word with 4 bytes
		bnez $t1, loop
		jr $ra