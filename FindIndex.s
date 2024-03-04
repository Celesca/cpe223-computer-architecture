.data
   prompt:      .asciiz "\n\n The number in array is: 1, 3, 5, 7, 9"
   array:       .word 1, 3, 5, 7, 9
   input_msg:   .asciiz "\n The number is "
   show_index:  .asciiz "\n The index of the number is "

.text
   main:
    li $v0, 4       # system call code for print_str
    la $a0, prompt  # load address of prompt into a0
    syscall         # print the message

    la $a0, array   # Load the base address of the array

    li $v0, 4       # system call code for print_str
    la $a0, input_msg # load address of prompt into a0
    syscall         # print the message

    li $v0, 5       # system call code for read int
    syscall         # reads a value of input number into v0
    li $t2, 0       # Initialize the input number to 0
    add $t2, $t2, $v0  # Store the input number to t2

    # Call the function to find the index
    jal FindIndex

    li $v0, 4       # system call code for print_str
    la $a0, show_index  # load address of prompt into a0
    syscall         # print the message

    # Print the results
    li $v0, 1       # Print integer system call
    move $a0, $t5   # Index to be printed
    syscall

    # Exit program
    li $v0, 10      # Exit system call
    syscall

FindIndex:
    la $t1, array   # Load address to t1
    li $t5, 0       # Initialize index to 0
    li $t3, 5       # Load the size of array to t3

loop:
    beq $t5, $t3, Notfound  # If index == size, exit the loop

    lw $t0, 0($t1)  # load array element to t0

    beq $t0, $t2, found     # Check if the element is equal to the input value

    addi $t5, $t5, 1  # Increment index
    addi $t1, $t1, 4  # move to the next number in array

    j loop

found:
    j endloop  # Jump to the endloop to return without updating index

Notfound:
    li $t5, -1

endloop:
    jr $ra  # Return to the calling function
