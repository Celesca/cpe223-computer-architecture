	.data
X: .word 1, 2, 3, 4, 5, 6, 7
input: .asciiz "Your number : "
index: .asciiz "Index : "
notfound_index: .asciiz "\nNot found "
N: .word 7
	.globl main
	.text
main:		li $v0, 4 
			la $a0, input 
			syscall 

			li	$v0, 5
			syscall			

			li $t3, 0	 
			li $t0, 0	 
			la $t1, X
			lw $t4, N

			add $t3, $t3, $v0 # Value to find

loop:		lw $t2, 0($t1) 

			beq $t3, $t2, found

			addi $t1, $t1, 4
			
			addi $t0, $t0, 1 # Increment

			blt $t0, $t4, loop # Check if no index left

			j notfound # Jump to loop

found:		li $v0, 4
			la $a0, index
			syscall

			li $v0, 1
			move $a0, $t0
			syscall

			j end

notfound:	li $v0, 4
			la $a0, notfound_index
			syscall

			li $v0, 1
			li $a0, -1
			syscall

			j end

end:		li $v0, 10
			syscall