.data
	msg1:.asciiz"\nDigite o raio: "
	res:.asciiz"Comprimento da circunferência: "
.text

main:
	# Leitura do raio no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Cálculo e print do comprimento no t1
	
	mul $t1, $t0, 2
	mul $t1, $t1, 3

	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall