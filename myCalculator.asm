.data

welcomeMsg: .asciiz "\n<-----Calculator program----->\n"
firstNbrMsg: .asciiz "<-----Enter first number: ----->\n"
secondNbrMsg: .asciiz "\n<-----Enter second number: ----->\n"
choicesMsg: .asciiz "Choose one of the follwing options:\n\t1: addition\n\t2: substraction\n\t3: multiplication\n\t4: division\n\t0: quit program\n" 
resultMsg: .asciiz "\n<-----The result is: ----->\n"
quitMsg: .asciiz "<-----Thank you for using the program :3 ----->\n"

.text
begin:

la $a0, welcomeMsg
li $v0, 4
syscall

#read first number
la $a0, firstNbrMsg
li $v0, 4
syscall
li $v0, 6
syscall
mov.s  $f1, $f0

#read second number
la $a0, secondNbrMsg
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f2, $f0

#read choice
la $a0, choicesMsg
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0

#checking choices
beq $t2, 1, addition
beq $t2, 2, substraction
beq $t2, 3, multiplication
beq $t2, 4, division
beq $t2, 0, end

#addition function
addition:
add.s $f12, $f1, $f2
j printResult

#substraction function
substraction:
sub.s $f12, $f1, $f2
j printResult

#multiplication function
multiplication:
mul.s $f12, $f1, $f2
j printResult

#division function
division:
div.s $f12, $f1, $f2
j printResult

#quit program
end:
la $a0, quitMsg
li $v0, 4
syscall
li $v0, 10
syscall

#print result
printResult:
la $a0, resultMsg
li $v0, 4
syscall
li $v0, 2
syscall
j begin


