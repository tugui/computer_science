		.data

text:		.space 64

# define strings to print

success:	.asciiz	"\nSuccess! Location: "

failure:	.asciiz	"\nFail!\n"

new_line:	.asciiz	"\n"

		.text

__start:

	# read string

	li 	$v0, 8

	la 	$a0 text

	li 	$a1 64

	syscall


	j read



read:

	# read character

	li	$v0, 12

	syscall


	move 	$t0 $v0


	li	$t1 63 # equal to '?'

	beq	$t0, $t1, exit


	move 	$s1, $t0

	la 	$s2, text

	li 	$s3 10 # new line

	li 	$s4 1 # location counter



loop:

	lb 	$s5, 0($s2) # load byte from string

	beq 	$s3, $s5, none # end of search

	beq 	$s1, $s5, exist

	addi 	$s2, $s2, 1

	addi 	$s4, $s4, 1

	j loop # next comparison


exist:

	li	$v0, 4

	la	$a0, success

	syscall


	# print location

	li	$v0, 1

	move	$a0, $s4

	syscall


	li	$v0, 4

	la	$a0, new_line

	syscall


	j read # next character


none:

	li	$v0, 4

	la	$a0, failure

	syscall


	j	read # next character


exit:

	li	$v0, 10

	syscall


# end of program
