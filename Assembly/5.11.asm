.data
	p1: .asciiz "Valor 1: " 
	p2: .asciiz "Valor 2: "
	p3: .asciiz "\nResultado (inteiro) -> "
	p4: .asciiz "\nResto da divisão -> "
	p5: .asciiz "Valor tem de ser maior que 0\n"
.text
inicio1:
	li $v0,4
	la $a0,p1
	syscall
	#Ler um valor inteiro 1
	li $v0,5
	syscall
	move $t1,$v0
	beqz $t1,inv1
	
inicio2:
	li $v0,4
	la $a0,p2
	syscall
	#Ler um valor inteiro 2
	li $v0,5
	syscall
	move $t2,$v0
	beqz $t2,inv2
	
	move $t6,$t1
	move $t7,$t2
	
	bgt $t1,$t2,div
	move $t6,$t2
	move $t7,$t1
	
div:
	#Dividir
	div $t6,$t7
	
	#Resultado inteiro -> lo
	li $v0,4
	la $a0,p3
	syscall
	li $v0,1
	mflo $a0 #colocal o valor de lo no a0
	syscall
	
	#Resultado resto -> hi
	li $v0,4
	la $a0,p4
	syscall
	li $v0,1
	mfhi $a0 #colocar valor de hi no a0
	syscall
	
	#fechar programa
	li $v0,10
	syscall
	
inv1:
	li $v0,4
	la $a0,p5
	syscall
	j inicio1
		
inv2:
	li $v0,4
	la $a0,p5
	syscall
	j inicio2
	
	
