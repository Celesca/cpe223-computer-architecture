.data
    prompt:	.asciiz "\n\n The number in array is : -4, 5, 8, -1, 11, 2"
    array: 	.word -4, 5, 8, -1, 11, 2
    arraySize:  .word 6   # The size of the array
    min_number:	.asciiz "\n The minimum number is " 
    max_number:	.asciiz "\n The maximum number is "
.text
    main:
	li $v0, 4		# system call code for print_str
	la $a0, prompt		# load address of prompt into a0
	syscall			# print the message(prompt)
        
        la $a0, array		# Load the base address of the array
        lw $a1, arraySize	# Load the size of the array
        
        jal MinMax		# Call MinMax function
	
	li $v0, 4		# system call code for print_str
	la $a0,	min_number	# load address of prompt into a0
	syscall			# print the message

        # Print the results
        li $v0, 1       	# Print integer system call
        move $a0, $t2   	# Minimum value to be printed
        syscall

	li $v0, 4		# system call code for print_str
	la $a0,	max_number	# load address of prompt into a0
	syscall			# print the message

        li $v0, 1       	# Print integer system call
        move $a0, $t1   	# Maximum value to be printed
        syscall

        # Exit program
        li $v0, 10      	# Exit system call
        syscall
MinMax:				
    	lw $t1, 0($a0)		# Max_value
	move $t2, $t1		# Min_value
loop:				
        lw $t3, 0($a0)         	# Load the current element into $t1

        blt $t3, $t2, updateMin	# if current element is less than current min

        bgt $t3, $t1, updateMax	# if current element is greater than current max
        
        j incrementIndex   	# Jump to increment index and continue loop

incrementIndex:
            addi $a0, $a0, 4	# Move to the next element in the array
            j loop		# Jump back to the beginning of the loop

updateMin:			# Update min and max values
	move $t2, $t3   	# Set min to current element
        j incrementIndex   	# Jump to increment index and continue loop

updateMax:	
	move $t1, $t3   	# Set max to current element
        j incrementIndex

endloop:	
	jr $ra   		# Return to the calling function