.data
arr : .word 1, -6, 10
msg : .asciiz "\n the integer array is : \n"
space: .asciiz "\t"


.text

la $t1, arr
li $t0, 1
li $t2, 4

loop:
beq $t0, $t2, out
lw $t3, ($t1)
move $a0, $t3
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

addi $t0, $t0, 1
addi $t1, $t1, 4

j loop
out: