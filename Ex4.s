.data
	msg1:.asciiz"\nDigite a 1a nota: "
	msg2:.asciiz"\nDigite a 2a nota: "
	msg3:.asciiz"\nDigite a 3a nota: "
	msg4:.asciiz"\nDigite a 4a nota: "
	res:.asciiz"\nResultado: "
.text

main:
	# Leitura da 1a nota no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $a0, $zero
	
	# Leitura da 2a nota no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $a0, $zero

	# Leitura da 3a nota no t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $a0, $zero
	
	# Leitura da 4a nota no t3
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t3, $a0, $zero
	