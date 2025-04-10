.data
	menu: .asciiz "\n1-Mostrar Número do Aluno\n2-Mostrar Nome do Aluno\n3-Sair\n: "
	enter: .asciiz "\n"
	aluno: .asciiz "\nAluno: Pedro Barreiros\n"
	num: .asciiz "\nNúmero: "
	numAluno: .word 1706619
	numInv: .asciiz "\nOpção Inválida\n"
.text
	move $t8,$zero
	
	Menu:
		li $v0,4
		la $a0,menu
		syscall
	
		li $v0,5
		syscall
		move $t1,$v0
		
		beq $t1,1,Numero
		beq $t1,2,Aluno
		beq $t1,3,Terminar
		blt $t1,0,Invalido
		bgt $t1,6,Invalido
		
	Numero:
		li $v0,4
		la $a0,num
		syscall
		li $v0,1
		lw $a0,numAluno
		syscall
		
		li $v0,4
		la $a0,enter
		syscall
		j Menu
		
	Aluno:
		li $v0,4
		la $a0,aluno
		syscall
		j Menu
		
	Invalido:
		li $v0,4
		la $a0,numInv
		syscall
		j Menu
		
	Terminar:
		li $v0,10
		syscall