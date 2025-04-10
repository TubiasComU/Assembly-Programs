.data
	p1: .asciiz "Pedro Barreiros\n"
	numero: .word 1706619
.text
	li $v0,4
	la $a0,p1
	syscall
	li $v0,1
	lw $a0,numero
	syscall
	li $v0,10
	syscall
