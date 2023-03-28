.data

input: .space 11 
enter: .asciiz "\n"

.text

main:
li $v0, 8
la $a0, input
li $a1, 11
syscall

storeInput:
move $t3, $a0
lb $s2, ($t3)

checkInput:
beq $t0, 10, output

sort_numbers:
addi $t0, $t0, 1
bge $s2, 97, lowercaseNum
bge $s2, 65, uppercaseNum
bge $s2, 48, numbers 

counter:
addi $t3, $t3, 1
lb $s2, ($t3)
j checkInput

uppercaseNum:
bge $s2, 85, counter
sub $s2, $s2, 55
add $s3, $s3, $s2
j counter

lowercaseNum:
bge $s2, 117, counter
sub $s2, $s2, 87
add $s3, $s3, $s2
j counter

numbers:
bge $s2, 48, counter
sub $s2, $s2, 48
add $s3, $s3, $s2
j counter

output:
li $v0, 4
la $a0, enter
syscall

li $v0, 1
move $a0, $s3
syscall

li $v0, 10
syscall

