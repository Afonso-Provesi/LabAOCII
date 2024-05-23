.data
.text
.globl main

main:
	li $s0,3
	j power

power:
	li $s1,1
	sllv $t0,$s1,$s0
	j print

print:
	li $v0,1
	la $a0,($t0)
	syscall