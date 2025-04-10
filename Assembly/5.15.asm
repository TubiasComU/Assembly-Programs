.data
	menu: .asciiz "\n1-Escrever no ficheiro\n2-Mostrar dados do ficheiro\n3-Sair\n: "
	num: .asciiz "\nNúmero: "
	numInv: .asciiz "\nOpção Inválida\n"
	ficheiro: .asciiz "C:/Users/Tubias/Desktop/1706619.txt" #localizaçao do ficheiro
	dados: .space 1024 #espaço em memoria para a leitura
.text
	move $t8,$zero
	
	Menu:
		li $v0,4
		la $a0,menu
		syscall
	
		li $v0,5
		syscall
		move $t1,$v0
		
		beq $t1,1,Escrever
		beq $t1,2,Mostrar
		beq $t1,3,Terminar
		blt $t1,0,Invalido
		bgt $t1,6,Invalido
		
	Escrever:
		li $v0,8
		la $a0,dados
		li $a1,1024
		syscall
		li $v0,13 #abrir o ficheiro
		la $a0,ficheiro #colocamos a localizaçao
		li $a1,1 #a1 a 0 indica leitura, 1 indica escrita
		syscall
		move $s0,$v0 #guardar no s0 para depois fechar o ficheiro
		li $v0,15 #escrita do ficheiro
		move $a0,$s0
		la $a1,dados #colocar no ficheiro o input
		li $a2,1024 #Igual ao declarado para dados
		syscall
		#Fechar o ficheiro (nao esquecer)
		li $v0,16 #fechar o ficheiro
		move $a0,$s0
		syscall
		j Menu
		
	Mostrar:
		li $v0,13 #abrir o ficheiro
		la $a0,ficheiro #colocamos a localizaçao
		li $a1,0 #a1 a 0 indica leitura, 1 indica escrita
		syscall
		move $s0,$v0 #guardar no s0 para depois fechar o ficheiro
		move $a0,$s0
		li $v0,14 #leitura do ficheiro
		la $a1,dados #colocar em dados o conteudo do ficheiro
		li $a2,1024 #Igual ao declarado para dados
		syscall
		#mostrar os dados que estao em "dados"
		li $v0,4
		move $a0,$a1
		syscall
		#Fechar o ficheiro (nao esquecer)
		li $v0,16 #fechar o ficheiro
		move $a0,$s0
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
