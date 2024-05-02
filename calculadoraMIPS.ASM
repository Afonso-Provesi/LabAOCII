.data
mensagem1: .asciiz "Digite o primeiro numero: "
mensagem2: .asciiz "Digite o segundo numero:"
mensagem3: .asciiz "Digite a operacao desejada, sendo 1 - soma. 2 - subtracao. 3 - multiplicacao. 4 - divisao:"
mensagem4: .asciiz "Divisao por zero, impossivel realizar a operacao"
.text
.globl main



main:
    li $v0,4 #print padrao
    la $a0,mensagem1
    syscall

    li $v0,5 #fazendo um input do numero digitado
    syscall

    move $s0,$v0 #colocando o numero do input num registrador de gente normal

    li $v0,4 #print padrao
    la $a0,mensagem2
    syscall

    li $v0,5
    syscall

    move $s1,$v0

    li $v0,4 #print padrao
    la $a0,mensagem3
    syscall

    li $v0,5
    syscall

    move $t0,$v0

    beq $t0,1,soma #decisao da operacao
    beq $t0,2,subt
    beq $t0,3,multi
    beq $t0,4,divi
    
    j exit #código inválido

soma:			#operacoes
    add $t1,$s0,$s1
    
    j printaResultado
    
    
subt:
    sub $t1,$s0,$s1
    
    j printaResultado

multi:
    mul $t1,$s0,$s1
    
    j printaResultado

divi:
    beq $s1,$zero,divisaoPorZero #tratamento da divisao por zero

    div $t1,$s0,$s1
    
    j printaResultado
    
    
printaResultado:
    li $v0,1 #print de inteiro usa este tipo de configuração, nn esquecer de trocar o 4 pelo 1 !!!
    la $a0,($t1)
    syscall
    j exit
	

divisaoPorZero:   #mensagem do tratamento de excessao
    li $v0,4
    la $a0,mensagem4
    syscall


exit: 