		.data

# define strings to print

alpha:		.asciiz	"\nalpha\n"

bravo:		.asciiz	"\nbravo\n"

china:		.asciiz	"\nchina\n"

delta:		.asciiz	"\ndelta\n"

echo:		.asciiz	"\necho\n"

foxtrot:	.asciiz	"\nfoxtrot\n"

golf:		.asciiz	"\ngolf\n"

hotel:		.asciiz	"\nhotel\n"

india:		.asciiz	"\nindia\n"

juliet:		.asciiz	"\njuliet\n"

kilo:		.asciiz	"\nkilo\n"

lima:		.asciiz	"\nlima\n"

mary:		.asciiz	"\nmary\n"

november:	.asciiz	"\nnovember\n"

oscar:		.asciiz	"\noscar\n"

paper:		.asciiz	"\npaper\n"

quebec:		.asciiz	"\nquebec\n"

research:	.asciiz	"\nresearch\n"

sierra:		.asciiz	"\nsierra\n"

tango:		.asciiz	"\ntango\n"

uniform:	.asciiz	"\nuniform\n"

victor:		.asciiz	"\nvictor\n"

whisky:		.asciiz	"\nwhisky\n"

x_ray:		.asciiz	"\nx-ray\n"

yankee:		.asciiz	"\nyankee\n"

zulu:		.asciiz	"\nzulu\n"



Alpha:		.asciiz	"\nAlpha\n"

Bravo:		.asciiz	"\nBravo\n"

China:		.asciiz	"\nChina\n"

Delta:		.asciiz	"\nDelta\n"

Echo:		.asciiz	"\nEcho\n"

Foxtrot:	.asciiz	"\nFoxtrot\n"

Golf:		.asciiz	"\nGolf\n"

Hotel:		.asciiz	"\nHotel\n"

India:		.asciiz	"\nIndia\n"

Juliet:		.asciiz	"\nJuliet\n"

Kilo:		.asciiz	"\nKilo\n"

Lima:		.asciiz	"\nLima\n"

Mary:		.asciiz	"\nMary\n"

November:	.asciiz	"\nNovember\n"

Oscar:		.asciiz	"\nOscar\n"

Paper:		.asciiz	"\nPaper\n"

Quebec:		.asciiz	"\nQuebec\n"

Research:	.asciiz	"\nResearch\n"

Sierra:		.asciiz	"\nSierra\n"

Tango:		.asciiz	"\nTango\n"

Uniform:	.asciiz	"\nUniform\n"

Victor:		.asciiz	"\nVictor\n"

Whisky:		.asciiz	"\nWhisky\n"

X_ray:		.asciiz	"\nX-ray\n"

Yankee:		.asciiz	"\nYankee\n"

Zulu:		.asciiz	"\nZulu\n"



one:		.asciiz	"\nFirst\n"

two:		.asciiz	"\nSecond\n"

three:		.asciiz	"\nThird\n"

four:		.asciiz	"\nFourth\n"

five:		.asciiz	"\nFifth\n"

six:		.asciiz	"\nSixth\n"

seven:		.asciiz	"\nSeventh\n"

eight:		.asciiz	"\nEighth\n"

nine:		.asciiz	"\nNinth\n"

zero:		.asciiz	"\nzero\n"



star:		.asciiz	"\n*\n"



		.text

__start:

		# read character

		li	$v0, 12

		syscall



		move 	$t0 $v0



		li	$t1 57

		ble	$t0,$t1,max_digit # smaller than '9'



		li	$t1 65

		bge	$t0,$t1,min_letter # bigger than 'A'



		li	$t1 63 # equal to '?'

		beq	$t0,$t1,exit



		j	print_star # other input


# deal with digit

max_digit:

		li	$t1 48

		bge	$t0,$t1,digit # bigger than '0'

		j	print_star

digit:

		li	$t1 48

		beq	$t0,$t1,print_0

		li	$t1 49

		beq	$t0,$t1,print_1

		li	$t1 50

		beq	$t0,$t1,print_2

		li	$t1 51

		beq	$t0,$t1,print_3

		li	$t1 52

		beq	$t0,$t1,print_4

		li	$t1 53

		beq	$t0,$t1,print_5

		li	$t1 54

		beq	$t0,$t1,print_6

		li	$t1 55

		beq	$t0,$t1,print_7

		li	$t1 56

		beq	$t0,$t1,print_8

		li	$t1 57

		beq	$t0,$t1,print_9

# deal with letter

min_letter:

		li	$t1 90

		ble	$t0,$t1,upper_case # smaller than 'Z'

		li	$t1 97

		bge	$t0,$t1,lower_case_min # bigger than 'a'

		j	print_star

upper_case: # 大写字母

		li	$t1 65

		beq	$t0,$t1,print_A

		li	$t1 66

		beq	$t0,$t1,print_B

		li	$t1 67

		beq	$t0,$t1,print_C

		li	$t1 68

		beq	$t0,$t1,print_D

		li	$t1 69

		beq	$t0,$t1,print_E

		li	$t1 70

		beq	$t0,$t1,print_F

		li	$t1 71

		beq	$t0,$t1,print_G

		li	$t1 72

		beq	$t0,$t1,print_H

		li	$t1 73

		beq	$t0,$t1,print_I

		li	$t1 74

		beq	$t0,$t1,print_J

		li	$t1 75

		beq	$t0,$t1,print_K

		li	$t1 76

		beq	$t0,$t1,print_L

		li	$t1 77

		beq	$t0,$t1,print_M

		li	$t1 78

		beq	$t0,$t1,print_N

		li	$t1 79

		beq	$t0,$t1,print_O

		li	$t1 80

		beq	$t0,$t1,print_P

		li	$t1 81

		beq	$t0,$t1,print_Q

		li	$t1 82

		beq	$t0,$t1,print_R

		li	$t1 83

		beq	$t0,$t1,print_S

		li	$t1 84

		beq	$t0,$t1,print_T

		li	$t1 85

		beq	$t0,$t1,print_U

		li	$t1 86

		beq	$t0,$t1,print_V

		li	$t1 87

		beq	$t0,$t1,print_W

		li	$t1 88

		beq	$t0,$t1,print_X

		li	$t1 89

		beq	$t0,$t1,print_Y

		li	$t1 90

		beq	$t0,$t1,print_Z



lower_case_min:

		li	$t1 122

		ble	$t0,$t1,lower_case # smaller than 'z'

		j	print_star

lower_case: # 小写字母

		li	$t1 97

		beq	$t0,$t1,print_a

		li	$t1 98

		beq	$t0,$t1,print_b

		li	$t1 99

		beq	$t0,$t1,print_c

		li	$t1 100

		beq	$t0,$t1,print_d

		li	$t1 101

		beq	$t0,$t1,print_e

		li	$t1 102

		beq	$t0,$t1,print_f

		li	$t1 103

		beq	$t0,$t1,print_g

		li	$t1 104

		beq	$t0,$t1,print_h

		li	$t1 105

		beq	$t0,$t1,print_i

		li	$t1 106

		beq	$t0,$t1,print_j

		li	$t1 107

		beq	$t0,$t1,print_k

		li	$t1 108

		beq	$t0,$t1,print_l

		li	$t1 109

		beq	$t0,$t1,print_m

		li	$t1 110

		beq	$t0,$t1,print_n

		li	$t1 111

		beq	$t0,$t1,print_o

		li	$t1 112

		beq	$t0,$t1,print_p

		li	$t1 113

		beq	$t0,$t1,print_q

		li	$t1 114

		beq	$t0,$t1,print_r

		li	$t1 115

		beq	$t0,$t1,print_s

		li	$t1 116

		beq	$t0,$t1,print_t

		li	$t1 117

		beq	$t0,$t1,print_u

		li	$t1 118

		beq	$t0,$t1,print_v

		li	$t1 119

		beq	$t0,$t1,print_w

		li	$t1 120

		beq	$t0,$t1,print_x

		li	$t1 121

		beq	$t0,$t1,print_y

		li	$t1 122

		beq	$t0,$t1,print_z

# define printing functions

print_A:

		li	$v0, 4			# load appropriate system call code into register $v0;

		la	$a0, Alpha		# load address of string to be printed into $a0

		syscall				# call operating system to perform print operation

		j   __start

print_B:

		li	$v0, 4

		la	$a0, Bravo

		syscall

		j   __start

print_C:

		li	$v0, 4

		la	$a0, China

		syscall

		j   __start

print_D:

		li	$v0, 4

		la	$a0, Delta

		syscall

		j   __start

print_E:

		li	$v0, 4

		la	$a0, Echo

		syscall

		j   __start

print_F:

		li	$v0, 4

		la	$a0, Foxtrot

		syscall

		j   __start

print_G:

		li	$v0, 4

		la	$a0, Golf

		syscall

		j   __start

print_H:

		li	$v0, 4

		la	$a0, Hotel

		syscall

		j   __start

print_I:

		li	$v0, 4

		la	$a0, India

		syscall

		j   __start

print_J:

		li	$v0, 4

		la	$a0, Juliet

		syscall

		j   __start

print_K:

		li	$v0, 4

		la	$a0, Kilo

		syscall

		j   __start

print_L:

		li	$v0, 4

		la	$a0, Lima

		syscall

		j   __start

print_M:

		li	$v0, 4

		la	$a0, Mary

		syscall

		j   __start

print_N:

		li	$v0, 4

		la	$a0, November

		syscall

		j   __start

print_O:

		li	$v0, 4

		la	$a0, Oscar

		syscall

		j   __start

print_P:

		li	$v0, 4

		la	$a0, Paper

		syscall

		j   __start

print_Q:

		li	$v0, 4

		la	$a0, Quebec

		syscall

		j   __start

print_R:

		li	$v0, 4

		la	$a0, Research

		syscall

		j   __start

print_S:

		li	$v0, 4

		la	$a0, Sierra

		syscall

		j   __start

print_T:

		li	$v0, 4

		la	$a0, Tango

		syscall

		j   __start

print_U:

		li	$v0, 4

		la	$a0, Uniform

		syscall

		j   __start

print_V:

		li	$v0, 4

		la	$a0, Victor

		syscall

		j   __start

print_W:

		li	$v0, 4

		la	$a0, Whisky

		syscall

		j   __start

print_X:

		li	$v0, 4

		la	$a0, X_ray

		syscall

		j   __start

print_Y:

		li	$v0, 4

		la	$a0, Yankee

		syscall

		j   __start

print_Z:

		li	$v0, 4

		la	$a0, Zulu

		syscall

		j   __start



print_a:

		li	$v0, 4

		la	$a0, alpha

		syscall

		j   __start

print_b:

		li	$v0, 4

		la	$a0, bravo

		syscall

		j   __start

print_c:

		li	$v0, 4

		la	$a0, china

		syscall

		j   __start

print_d:

		li	$v0, 4

		la	$a0, delta

		syscall

		j   __start

print_e:

		li	$v0, 4

		la	$a0, echo

		syscall

		j   __start

print_f:

		li	$v0, 4

		la	$a0, foxtrot

		syscall

		j   __start

print_g:

		li	$v0, 4

		la	$a0, golf

		syscall

		j   __start

print_h:

		li	$v0, 4

		la	$a0, hotel

		syscall

		j   __start

print_i:

		li	$v0, 4

		la	$a0, india

		syscall

		j   __start

print_j:

		li	$v0, 4

		la	$a0, juliet

		syscall

		j   __start

print_k:

		li	$v0, 4

		la	$a0, kilo

		syscall

		j   __start

print_l:

		li	$v0, 4

		la	$a0, lima

		syscall

		j   __start

print_m:

		li	$v0, 4

		la	$a0, mary

		syscall

		j   __start

print_n:

		li	$v0, 4

		la	$a0, november

		syscall

		j   __start

print_o:

		li	$v0, 4

		la	$a0, oscar

		syscall

		j   __start

print_p:

		li	$v0, 4

		la	$a0, paper

		syscall

		j   __start

print_q:

		li	$v0, 4

		la	$a0, quebec

		syscall

		j   __start

print_r:

		li	$v0, 4

		la	$a0, research

		syscall

		j   __start

print_s:

		li	$v0, 4

		la	$a0, sierra

		syscall

		j   __start

print_t:

		li	$v0, 4

		la	$a0, tango

		syscall

		j   __start

print_u:

		li	$v0, 4

		la	$a0, uniform

		syscall

		j   __start

print_v:

		li	$v0, 4

		la	$a0, victor

		syscall

		j   __start

print_w:

		li	$v0, 4

		la	$a0, whisky

		syscall

		j   __start

print_x:

		li	$v0, 4

		la	$a0, x_ray

		syscall

		j   __start

print_y:

		li	$v0, 4

		la	$a0, yankee

		syscall

		j   __start

print_z:

		li	$v0, 4

		la	$a0, zulu

		syscall

		j   __start



print_1:

		li	$v0, 4

		la	$a0, one

		syscall

		j   __start

print_2:

		li	$v0, 4

		la	$a0, two

		syscall

		j   __start

print_3:

		li	$v0, 4

		la	$a0, three

		syscall

		j   __start

print_4:

		li	$v0, 4

		la	$a0, four

		syscall

		j   __start

print_5:

		li	$v0, 4

		la	$a0, five

		syscall

		j   __start

print_6:

		li	$v0, 4

		la	$a0, six

		syscall

		j   __start

print_7:

		li	$v0, 4

		la	$a0, seven

		syscall

		j   __start

print_8:

		li	$v0, 4

		la	$a0, eight

		syscall

		j   __start

print_9:

		li	$v0, 4

		la	$a0, nine

		syscall

		j   __start

print_0:

		li	$v0, 4

		la	$a0, zero

		syscall

		j   __start



print_star:

		li	$v0, 4

		la	$a0, star

		syscall

		j   __start



exit:

		li	$v0, 10

		syscall


# end of program
