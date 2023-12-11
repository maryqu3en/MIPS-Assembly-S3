.data
arr: .space 100
sizeMsg: .asciiz "\nEnter size of the array: "
positiveMsg: .asciiz "\nThe number of positive elements is: "
negativeMsg: .asciiz "\nThe number of negative elements is: "
.text
# display message
li $v0, 4
la $a0, sizeMsg
syscall

# read user choice
li $v0, 5
syscall
move $t0, $v0

# initialize counters
li $t4, 0 # positive
li $t5, 0 # negative

# loop to read elements
la $t1, arr
li $t2, 0

loop:
beq $t2, $t0, out

# read input
li $v0, 5
syscall

move $t3, $v0
blt $t3, 0, positive
bge $t3, 0, negative
continue:
sw $t3, ($t1)
addi $t2, $t2, 1  # i++
addi $t1, $t1, 4
j loop

# count positive elements
positive:
addi $t4, $t4, 1
j continue

# count negative elements
negative:
addi $t5, $t5, 1
j continue

out:
li $v0, 4
la $a0, positiveMsg
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, negativeMsg
syscall

li $v0, 1
move $a0, $t5
syscall

