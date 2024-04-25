.data
mensagem: .asciiz " "
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições


.text
.globl main
main:
	la $s0, array          # Carrega o endereço base do vetor em $a0
	li $t0, 0                  # Inicializa o índice i = 0
	lw $t1, 0($s0)       # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])

	lw $t2, 0($s0)       # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
	li $t3, 10               # Tamanho do vetor

# Seu código vem aqui
	loop:	bge $t0,$t3,exit
		lw $t5,0($s0)
		addi $s0,$s0,4
		addi $t0,$t0,1
		slt $t4,$t5,$t1
		beq $t4,1,min
		slt $t4,$t5,$t2
		beq $t4,0,max
		j loop
	
	
	min:    move $t1,$t5
		j loop
	max:	move $t2,$t5
		j loop
		
	exit:   li $v0,1
		move $a0,$t1
		syscall
		li $v0,4
		la $a0,mensagem
		syscall
		li $v0,1
		move $a0,$t2
		syscall

	li $v0, 10             # Encerra o programa
	syscall
