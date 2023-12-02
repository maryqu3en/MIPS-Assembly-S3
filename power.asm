.data
prompt:      .asciiz "\n Enter the base (non-negative integer): "
exponentMsg: .asciiz "\n Enter the exponent (non-negative integer): "
resultMsg:   .asciiz "\n The result is: "
negativeMsg: .asciiz "\n Please enter non-negative integers."

.text
    li $v0, 4
    la $a0, prompt
    syscall

begin:

    li $v0, 5
    syscall
    move $t1, $v0  # $t1 contains the base value
    
    li $v0, 4
    la $a0, exponentMsg
    syscall

    li $v0, 5
    syscall
    move $t2, $v0  # $t2 contains the exponent value

    # Check if either the base or the exponent is negative
    blt $t1, $zero, print_negative_msg
    blt $t2, $zero, print_negative_msg

    li $t3, 1  # Initialize result to 1

    beq $t2, $zero, print_result  # If exponent is 0, result is 1

power_loop:
    mul $t3, $t3, $t1  # result *= base
    addi $t2, $t2, -1  # Decrement exponent
    bnez $t2, power_loop  # Continue loop if exponent is not zero
    j print_result

print_result:
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall
    j end

print_negative_msg:

    li $v0, 4
    la $a0, negativeMsg
    syscall
    j begin

end: