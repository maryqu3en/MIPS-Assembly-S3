.data 
A: .word 12
B: .word 14


.text 

lw $t0, A
lw $t1, B

add $t5,$t0,$t1

move $a0,$t5


li $v0, 1

syscall