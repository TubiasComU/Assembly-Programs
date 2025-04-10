.data
	#Coded by Pedro Barreiros
	escrever: .asciiz "Digite um valor decimal: "
	p2: .asciiz "O valor decimal digitado foi: "

.text
	li $v0, 4
    	la $a0, escrever
   	syscall

  	li $v0, 6
  	syscall
  	mov.s $f0, $f0

    	li $v0, 4
  	la $a0, mostrar
   	syscall

   	li $v0, 2
   	mov.s $f12, $f0
   	syscall

  	li $v0, 10
   	syscall