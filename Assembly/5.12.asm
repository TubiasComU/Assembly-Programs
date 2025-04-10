.data
	rVal: .asciiz "\nValor? " 
	menu: .asciiz "\n1-Ler o Valor\n2-Crescente\n3-Decrescente\n4-Sair\n: "
	enter: .asciiz "\n"
	numInv: .asciiz "\nNumero Inválido\n"
	noVal: .asciiz "\nO valor ainda não foi inserido\n"

.text
	move $t8,$zero
	Menu:
		li $v0,4
		la $a0,menu
		syscall
	
		li $v0,5
		syscall
		move $t1,$v0
	
		beq $t1,1,Ler
		beq $t1,2,Crescente
		beq $t1,3,Decrescente
		beq $t1,4,Terminar
		blt $t1,0,Invalido
		bgt $t1,6,Invalido
	
	
	Ler:
		li $v0,4
		la $a0,rVal
		syscall
		li $v0,5
		syscall
		move $t2,$v0
		move $t3,$v0
		j Menu
		
	Crescente:
	
		beq $t2,0,InNum
		
		beq $t8,$t2,Menu
		li $v0,1
		move $a0, $t8
		syscall
		addi $t8, $t8, 1
		
		li $v0,4
		la $a0,enter
		syscall
		j Crescente
		
	Decrescente:
		
		beq $t2,0,InNum
		
		beq $t3,0,Menu
		li $v0,1
		move $a0, $t3
		syscall
		subi $t3, $t3, 1
		
		li $v0,4
		la $a0,enter
		syscall
		j Decrescente
	
	Invalido:
		li $v0,4
		la $a0,numInv
		syscall
		j Menu
		
	InNum:
		li $v0,4
		la $a0,noVal
		syscall
		j Menu
		
	Terminar:
		li $v0,10
		syscall

