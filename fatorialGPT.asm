    .data
newline:
    .asciiz "\n"
format:
    .asciiz "%d\n"

    .text
    .globl main

main:
    # Chamada da função fatorial(10)
    li $a0, 10        # Argumento para a função fatorial
    jal fatorial      # Chamada da função
    move $a0, $v0     # Move o resultado para o argumento da syscall
    li $v0, 1         # Código da syscall para imprimir inteiro
    syscall           # Chamada do sistema
    li $v0, 10        # Código da syscall para sair do programa
    syscall           # Chamada do sistema
    jr $ra            # Retorna para o endereço de retorno

fatorial:
    # Procedimento da função fatorial
    # $a0: parâmetro n
    # $v0: resultado

    # Se n <= 1, retorna 1
    ble $a0, 1, fatorial_end
    # Caso contrário, chama recursivamente fatorial(n-1)
    subi $sp, $sp, 4    # Aloca espaço na pilha para armazenar $ra
    sw $ra, 0($sp)      # Salva $ra na pilha
    subi $a0, $a0, 1    # n-1
    jal fatorial        # Chamada recursiva
    lw $ra, 0($sp)      # Restaura $ra
    addi $sp, $sp, 4    # Libera espaço na pilha
    # Multiplica o resultado retornado pela chamada recursiva por n
    mul $v0, $a0, $v0
fatorial_end:
    jr $ra              # Retorna