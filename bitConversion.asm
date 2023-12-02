.data
pMsg:       .asciiz "\n Enter a number in bits: "
bits:       .asciiz "\n In bits: "
choiceMsg:  .asciiz "\n Choose what do you want to convert to: \n 0 for end \n 1 for octets \n 2 for kilo octets\n 3 for mega octets \n 4 for giga octets \n"
oct:        .asciiz "\n In octets: "
kilo:       .asciiz "\n In kilo octets: "
mega:       .asciiz "\n In mega octets: "
giga:       .asciiz "\n In giga octets: "

.text
main:
    # Print prompt for entering a number in bits
    li $v0, 4           
    la $a0, pMsg
    syscall

    # Read integer input (number in bits)
    li $v0, 5          
    syscall
    move $t1, $v0       

    # Print the conversion options
    li $v0, 4           
    la $a0, choiceMsg
    syscall

    # Read choice
    li $v0, 5           
    syscall
    move $t2, $v0      

    # Perform conversion based on the choice
    beq $t2, 0, fin     
    beq $t2, 1, Octets   
    beq $t2, 2, Kilo     
    beq $t2, 3, Mega     
    beq $t2, 4, Giga     

fin:
    li $v0, 10      
    syscall

Octets:
    div $a0, $t1, 8   
    li $v0, 1           
    syscall
    j main

Kilo:
    div $a0, $t1, 1024  
    li $v0, 1          
    syscall
    j main

Mega:
    div $a0, $t1, 1048576  
    li $v0, 1             
    syscall
    j main

Giga:
    div $a0, $t1, 1073741824  
    li $v0, 1 
    syscall
    j main
