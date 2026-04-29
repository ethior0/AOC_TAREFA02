.data
	msg1:.asciiz"\nEscreva o comprimento: "
	msg2:.asciiz"\nEscreva o largura: "
	msg3:.asciiz"\nEscreva a altura: "
	res:.asciiz"\nVolume: "
.text

main:
	# Leitura do comprimento no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura da largura no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Leitura da altura no t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	# Cálculo e print do volume no t3
	
	mul $t3, $t0, $t1
	mul $t3, $t3, $t2
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
