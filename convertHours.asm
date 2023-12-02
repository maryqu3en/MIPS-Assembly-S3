.data
welcomeMsg: .asciiz "\n<-----Calculator program----->\n"
hoursMsg: .asciiz "Enter number of hours: "
minResultMsg: .asciiz "in minutes is: "
secResultMsg: .asciiz "\nin seconds is: "
.text

la $a0, hoursMsg
li $v0, 4
syscall

li $t1, 60
li $t2, 3600

li $v0, 5
syscall
move  $t3, $v0

la $a0, minResultMsg
li $v0, 4
syscall

mul $t5, $t3, $t1
move $a0, $t5

li $v0, 1
syscall

la $a0, secResultMsg
li $v0, 4
syscall

mul $t5, $t3, $t2
move $a0, $t5

li $v0, 1
syscall
