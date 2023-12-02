.data 
jan: .asciiz "January"
feb: .asciiz "february"
mar: .asciiz "march"
apr: .asciiz "april"
may: .asciiz "may"
jun: .asciiz "june"
jul: .asciiz "july"
aug: .asciiz "august"
sep: .asciiz "september"
oct: .asciiz "october"
nov: .asciiz "november"
dec: .asciiz "december"
msg: .asciiz "Enter number of month: "

.text

la $a0, msg
li $v0, 4
syscall

#read choice
li $v0, 5
syscall
move $t2, $v0

#checking choices
beq $t2, 1, janu
beq $t2, 2, febr
beq $t2, 3, marc
beq $t2, 4, apri
beq $t2, 5, mayy
beq $t2, 6, june
beq $t2, 7, july
beq $t2, 8, augt
beq $t2, 9, sept
beq $t2, 10, octo
beq $t2, 11, nove
beq $t2, 12, dece

janu:
la $a0, jan
li $v0, 4
syscall
j end

febr:
la $a0, feb
li $v0, 4
syscall
j end

marc:
la $a0, mar
li $v0, 4
syscall
j end

apri:
la $a0, apr
li $v0, 4
syscall
j end

mayy:
la $a0, may
li $v0, 4
syscall
j end

june:
la $a0, jun
li $v0, 4
syscall
j end

july:
la $a0, jul
li $v0, 4
syscall
j end

augt:
la $a0, aug
li $v0, 4
syscall
j end

sept:
la $a0, sep
li $v0, 4
syscall
j end

octo:
la $a0, oct
li $v0, 4
syscall
j end

nove:
la $a0, nov
li $v0, 4
syscall
j end

dece:
la $a0, dec
li $v0, 4
syscall
j end

end:

