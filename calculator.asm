.data
msgP: .asciiz "\n Calculator"
prompt_a: .asciiz "\n Enter a the first number: "
prompt_b: .asciiz "\nEnter b the second number: "
choice: .asciiz "\n Enter 0 for quit\n1 for +\n2 for -\n3 for *\n4 for / \n" 
res: .asciiz  "\n Result is: "
.text
whileTrue:
#DISPLAY CALCULATOR
la $a0, msgP
li $v0, 4
syscall
#READ THE FIRST NUMBER FROM USER
la $a0, prompt_a
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0
#READ THE SECOND NUMBER FROM USER
la $a0, prompt_b
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0
#READ OPERATION FROM USER
la $a0, choice
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0
#CHECK THE USER4S CHOICE
beq $t2, 0, end
beq $t2, 1, addition
beq $t2, 2, substraction
beq $t2, 3, multiplication
beq $t2, 4, division
#IF THE USER CHOOSE 0 THE CODE WILL BE STOPPED
end:
li $v0, 10
syscall
#ADDITION FUNC
addition:
add $t3, $t0, $t1
j printResult
j whileTrue
#SUBSTRACTION FUNC
substraction:
sub $t3, $t0, $t1
j printResult
j whileTrue
#multiplication FUNC
multiplication:
mul $t3, $t0, $t1
j printResult
j whileTrue
#division FUNC
division:
div $t3, $t0, $t1
j printResult
j whileTrue
#FUNCTION TO PRINT THE RESULT
printResult:
la $a0, res
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall
j whileTrue #RETURN TO THE BEGINNING OF PROGRAM