.data
prompt:     .asciiz "\n Enter a non-negative integer to calculate the sum : "
resultMsg:  .asciiz "\n The result is: "
negativeMsg:  .asciiz "\n Please enter a non-negative integer:"

.text
    li $v0, 4
    la $a0, prompt
    syscall

begin:

    li $v0, 5
    syscall
    move $t1, $v0
    
    #check if the input is negative
    blt $t1, $zero, print_negative_msg

    
    beq $t1, 0, print_result
    beq $t1, 1, print_result

    move $t2, $t1
    move $t3, $t1
    addi $t2, $t2, 1

    mul $t2, $t2, $t3
    div $t2, $t2, 2
    
j print_result


print_result:
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    j end
    
print_negative_msg:

    li $v0, 4
    la $a0, negativeMsg
    syscall
    j begin

end: