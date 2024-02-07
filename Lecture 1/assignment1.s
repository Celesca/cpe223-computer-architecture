	.text
    .globl main
main:	ori $t0, $zero, 10	# t0 = 10 (variable a)	3408000a 001101 00000 01000 00000  00000001010
															#  op	  rs	rt	shamt	 data
															#  0d	  0		 8	   0	  10 		
		ori $t1, $zero, 20	# t1 = 20 (variable b)	34090014 001101 00000 01001 00000  0000001101


		add $t2, $t0, $t1	# t2 = t1 + t0			01095020	00000 01000 01001 01010 00000 100000
														#		  op	rs	  rt	rd	 shamt  func
																 # 0      8    9     10     0    0x20