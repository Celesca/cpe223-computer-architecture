	.data
prompt:	.asciiz	"\n\n Please Input a value for N = "
result: .asciiz	" The sum of the integers from 1 to N is : "
bye:	.asciiz	"\n\n Adios Amigo! Have a nice day. \n\n"

	.globl	main

	.text
main:	
	li	$v0, 4		#System call code for print_str
	la	$a0, prompt	#Load address of prompt into $a0
	syscall			#Print the prompt


	li	$v0, 5		#System call code for read_int
	syscall			#Read the integer into $v0


	blez	$v0, done # If ( v0 <= 0 ) go to done
	li	$t0, 0		# clear $t0 to zero


loop:	add		$t0, $t0, $v0 # sum of integers in register $t0

		addi	$v0, $v0, -1 # summing in reverse order

		bnez	$v0, loop # branch to loop if $v0 is != 0

zero:   li		$v0, 4 # system call code for print_str
		la		$a0, result # load address of result into $a0
		syscall				# print the string

		li		$v0, 1		# system call code for print_int
		move	$a0, $t0	# a0 = $t0
		syscall

		b		main


done:	li		$v0, 4		# system call code for print_str
		la		$a0, bye	# load address of msg. into $a0
		syscall				# print the string

		li		$v0, 10		# terminate program
		syscall				# return control to system
system:
