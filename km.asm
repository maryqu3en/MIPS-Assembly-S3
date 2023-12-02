.data 
d: .asciiz "\n entrer la distance en m:"
tra: .asciiz "\n la distance en km:"

.text 
li $t1,1000

la $a0,d
li $v0,4
syscall

li $v0,5 
syscall
move $t3,$v0


la $a0,tra
li $v0,4
syscall


div  $a0,$t3,$t1
li $v0,1
syscall