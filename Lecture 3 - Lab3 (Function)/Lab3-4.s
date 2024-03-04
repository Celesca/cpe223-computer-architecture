	.data
X: .word 3, 5, 1, 7, 9, 15, 17
input: .asciiz "Please enter your number : "
found_text: .asciiz "Find it at index : "
notfound_text: .asciiz "\nNot found in array."
	.globl main
	.text
main:		li $v0, 4 # System call code for print_str
			la $a0, input # Load the address of input into $a0
			syscall # Print the string

			li	$v0, 5		#System call code for read_int
			syscall			#Read the integer into $v0

			li $t3, 0	 # Clear $t3 to zero
			add $t3, $t3, $v0 # Add to $t3 to find
			li $t0, 0	 # Index
			la $t1, X	 # Load the address of X into $t1

loop:		
			# compare $t3 with the value at $t1
			lw $t2, 0($t1) # Load the value at $t1 into $t2
			beq $t3, $t2, found # If $t3 == $t2, jump to found

			addi $t1, $t1, 4 # next address
			addi $t0, $t0, 1 # next index
			blt $t0, 7, loop # If $t0 == 7, jump to notfound
			j notfound # Jump to loop

found:		li $v0, 4
			la $a0, found_text
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			j end

end:		li $v0, 10
			syscall

notfound:	li $v0, 1
			li $a0, -1
			syscall

			li $v0, 4
			la $a0, notfound_text
			syscall
			
			li $v0, 10
			syscall