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
bge $s2, 97, lowercaseU
bge $s2, 65, uppercaseU
bge $s2, 48, numbers 

counter:
addi $t3, $t3, 1
lb $s2, ($t3)
j checkInput

