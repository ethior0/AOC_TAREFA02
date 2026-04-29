.data
	msg1:.asciiz"\nDigite o 1o valor: "
	msg2:.asciiz"\nDigite o 2o valor: "
	res:.asciiz"\nResultado: "
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
	
	# Condição p/ o menor ir pro t2 e maior indo pro t3
	ble $t0, $t1, se
	j senao

se:
	add $t2, $t0, $zero
	add $t3, $t1, $zero
	j fim
senao:
	add $t2, $t1, $zero
	add $t3, $t0, $zero

fim:
	# Calcula o resultado no t4 e printa
	sub $t4, $t3, $t2
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t4, $zero
	syscall
	

	