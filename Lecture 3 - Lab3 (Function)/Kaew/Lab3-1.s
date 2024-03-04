	.data
chico: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
print_sum: .asciiz "The sum of the elements of the array is: "
	.globl main
	.text
main:		la $t0, chico
			li $t1, 0 # Initial zero
			li $t2, 10 # Sum Size
			
loop:		lw $t3, 0($t0) # Load address
			add $t1, $t1, $t3

			addi $t2, $t2 , -1 
			addi $t0, $t0 , 4 
			
			bnez $t2, loop

endloop:    addi $t0, $t0, -4  
            sw $t1, 0($t0)      # Store
			lw $t4, 0($t0)      # Load

            li $v0, 4            
            la $a0, print_sum
            syscall

            li $v0, 1
            move $a0, $t4
            syscall