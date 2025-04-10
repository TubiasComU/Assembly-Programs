.data
	#Coded by Pedro Barreiros
	escrever: .asciiz "Digite um valor decimal: "
	mostrar: .asciiz "O valor decimal digitado foi: "

.text
	li $v0, 4
    	la $a0, escrever
   	syscall

  	li $v0, 7
  	syscall
  	mov.d $f0, $f0

    	li $v0, 4
  	la $a0, mostrar
   	syscall

   	li $v0, 3
   	mov.d $f12, $f0
   	syscall

  	li $v0, 10
   	syscall