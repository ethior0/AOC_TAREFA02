.data
	msg1:.asciiz"\nDigite a 1a nota: "
	msg2:.asciiz"\nDigite a 2a nota: "
	msg3:.asciiz"\nDigite a 3a nota: "
	msg4:.asciiz"\nDigite a 4a nota: "
	res:.asciiz"\nMédia: "
	msg_aprovado:.asciiz"\nAprovado"
	msg_exame:.asciiz"\nExame"
	msg_retido:.asciiz"\nRetido"
.text

main:
	# Leitura da 1a nota no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura da 2a nota no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero

	# Leitura da 3a nota no t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	# Leitura da 4a nota no t3
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	
	# Cálculo e print da média no t4
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	add $t4, $t4, $t3
	div $t4, $t4, 4
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t4, $zero
	syscall
	
	# Condições
	blt $t4, 3, retido
	blt $t4, 6, exame
	
	li $v0, 4
	la $a0, msg_aprovado
	syscall
	j fim

retido:
	li $v0, 4
	la $a0, msg_retido
	syscall
	j fim

exame:
	li $v0, 4
	la $a0, msg_exame
	syscall
	
fim:
	# Finaliza o programa com exit
	li $v0, 10
	syscall
