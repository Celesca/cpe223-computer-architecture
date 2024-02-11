.data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
result: .asciiz "The sum of number in array is "

.globl main
.text
main:
    li $t0, 0         # $t0 - loop counter
    li $t1, 0         # $t1 - sum

    # Print a newline
    li $v0, 4           # System call code for printing a string
    la $a0, result     # Load the address of the newline string
    syscall

    # Loop to sum the array elements
    loop:
        lw $t2, array($t0)    # Load array element at index $t0 into $t2
        add $t1, $t1, $t2     # Add the element to the sum
        addi $t0, $t0, 4      # Move to the next array element (each element is 4 bytes)

        # Check if the end of the array is reached
        blt $t0, 40, loop     # Branch to loop if $t0 < 40

    # Print the result
    move $a0, $t1       # Set $a0 to the sum
    li $v0, 1           # System call code for printing an integer
    syscall

    # Exit program
    li $v0, 10          # System call code for program exit
    syscall