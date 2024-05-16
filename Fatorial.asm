.data
.text

.globl main
main:
    li $v0,5 #input do usuário
    syscall
    move $s0,$v0
    li $s1,1 #iniciando o registrador do resultado com 1
    
    jal fatorial # pula pra função fatorial
    
    li $v0,1 #print de um inteiro, ou seja, printando o resultado
    la $a0,($s1)
    syscall
    
    j exit	#finalizando o programa 
	
fatorial:
	ble $s0,1,fatoriaal #se for igual ou menor q 1 sai do programa
	
	subi $sp,$sp,4 #aloca espaço na memoria para o ra(pc)
	sw $ra,0($sp)#salva o pc na pilha
	mul $s1,$s0,$s1#multiplica o resultado pelo numero atual
	subi $s0,$s0,1 #diminui o numero atual por -1
	jal fatorial #volta para a mesma função, mas deixa um link para voltar para este ponto quando terminar a execução
	lw $ra,0($sp) #carrega o endereço que estava na pilha no pc novamente
	addi $sp,$sp,4 #libera a pilha
	

fatoriaal:
	jr $ra #quando for igual a 1 virra para ca e sera linkado com os ultimos pulos do jal
exit:
