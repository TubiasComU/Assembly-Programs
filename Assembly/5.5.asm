.data
	num1: .word 1706619
	num2: .word 2023
.text
	li $v0,1
	lw $t0,num1 #atribuir a t0 o valor de num1
	lw $t1,num2 #atribuir a t1 o valor de num2
	add $t3,$t0,$t1 #colocar em t3 a soma de t0+t1
	move $a0,$t3 #colocar em a0 o valor de t3
	syscall
	li $v0,10
	syscall
