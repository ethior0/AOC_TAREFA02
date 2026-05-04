.data
	msg1:.asciiz"\nDigite o 1o valor: "
	msg2:.asciiz"\nDigite o 2o valor: "
	res:.asciiz"\nResultado da somatória: "
.text

main:
	# Leitura do 1o valor no t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do 2o valor no t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Condição p/ menor no t2 e maior no t3
	bgt $t0, $t1, se
	j senao
	
se:
	add $t2, $t1, $zero
	add $t3, $t0, $zero
	j fim_se
senao:
	add $t2, $t0, $zero
	add $t3, $t1, $zero

fim_se:
	# Contador
	add $s0, $t2, 1
	blt $s0, $t3, loop_impar
	j fim

loop_impar:	
	# Resto do contador dividido por 2
	rem $t5, $s0, 2
	
	bne $t5, 0, eh_impar
	
	add $s0, $s0, 1
	
	# Condição do loop
	blt $s0, $t3, loop_impar
	j fim

eh_impar:
	add $t6, $t6, $s0
	add $s0, $s0, 1
	j loop_impar

fim:
	# Printa o resultado e finaliza com exit
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t6, $zero
	syscall
	
	li $v0, 10
	syscall
