.data
	p1: .asciiz "P" #Pedro
.text
	li $v0,4
	la $a0,p1
	syscall
	li $v0,10
	syscall
