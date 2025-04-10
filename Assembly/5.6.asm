.data
	p1: .asciiz "Valor? "
	p2: .asciiz "\nSoma: "
	p3: .asciiz "\nDiferença entre o maior e o menor: "
	p4: .asciiz "\nMultiplicação: "
.text
	li $v0,4
	la $a0,p1
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,p1
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	li $v0,4
	la $a0,p1
	syscall
	li $v0,5
	syscall
	move $t3,$v0
	
	#somar
	add $t4,$t1,$t2
	add $t5,$t3,$t4
	
	li $v0,4
	la $a0,p2
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	#diferença
	move $t6,$t1
	move $t7,$t1
	
	bgt $t6,$t2,maior
	move $t6,$t2
	
	maior:
	bgt $t6,$t3,switch
	move $t6,$t3
	
	switch:
	blt $t7,$t2,menor
	move $t7,$t2
	
	menor:
	blt $t7,$t3,conta
	move $t7,$t3
	
	conta:
	sub $t5,$t6,$t7
	
	li $v0,4
	la $a0,p3
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	#multiplicação
	mult $t1,$t2
	mflo $t4
	mult $t3,$t4
	mflo $t5
	
	li $v0,4
	la $a0,p4
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	#terminar
	li $v0,10
	syscall