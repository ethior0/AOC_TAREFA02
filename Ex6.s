.data
	msg1:.asciiz"\nInsira o "
	msg2:.asciiz"o valor: "
	menor:.asciiz"\Menor valor: "
	maior:.asciiz"\nMaior valor: "
	negativo:.asciiz"\nNúmero inválido!"
.text

inicio:
	# Inicializa o contador
	add $t0, $t0, 1

loop:
	# Leitura do valor no t1
	beq $t0, 11, fim
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero

	bltz $t1, num_negativo
	
	add $t0, $t0, 1
	
	ble $t0, 2, atribuir
	
	blt $t1, $t2, checaMenor
	bgt $t1, $t3, checaMaior
	j loop

num_negativo:
	li $v0, 4
	la $a0, negativo
	syscall
	
	j loop

atribuir:
	add $t2, $t1, $zero
	add $t3, $t1, $zero
	j loop

checaMenor:
	add $t2, $t1, $zero
	j loop

checaMaior:
	add $t3, $t1, $zero
	j loop

fim:
	# Mostra menor junto com o maior e finaliza o programa com exit
	li $v0, 4
	la $a0, menor
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, maior
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 10
	syscall
