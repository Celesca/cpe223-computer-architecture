	.data
chico: .word 3, 5, 2, 7, 8, 9, 1, 4, 6, 10
store: .asciiz "The resulting sum that store in the end of array is : "
	.globl main
	.text
main:		la $t0, chico
			li $t1, 0 # Sum the zero
			li $t2, 10 # Length of elements to Sum

loop:		lw $t3, 0($t0) # Load the value in array
			add $t1, $t1, $t3	# Add to sum
			addi $t0, $t0 , 4 # Move to the next word in array
			addi $t2, $t2 , -1 # Decrement
			bnez $t2, loop

final:      addi $t0, $t0, -4   # Move back to the last element of array chico
            sw $t1, 0($t0)      # Store the sum in the last element of array chico

            li $v0, 4            # Print string
            la $a0, store
            syscall

            li $v0, 1
            lw $a0, 0($t0)
            syscall