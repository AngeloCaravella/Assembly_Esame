.data

str1: .space 20
str2: .space 20

slash: .asciz "\n"
ris1: .asciz "\nLa prima stringa è maggiore\n"
ris2: .asciz "\nLe stringhe sono uguali! \n"
ris3: .asciz "\nLa seconda stringa è maggiore: \n"

.text

.globl main

main:

la a0,str1
li a1,5
li a7,8
ecall

la a0,slash
li a7,4
ecall 

la a0,str2
li a1,5
li a7,8
ecall

jal compare
li a2,1
li a3, -1
beqz a1, ri
beq a1, a2, ri1
la a0, ris3
li a7,4
ecall
li a7,10
ecall
ri1:
la a0, ris1
li a7,4
ecall
li a7,10
ecall
ri:
la a0, ris2
li a7,4
ecall
li a7,10
ecall

compare: 
la t0,str1
la t1,str2
li t6, 5
go: 
lbu  t3,(t0)
lbu  t4,(t1) 
addi t0,t0,1
addi t1,t1,1
addi t6,t6,-1
beq t3,t4, go
beqz t6, u
bgt t3,t4, u1
li a1,-1
jr ra
u1:
li a1,1
jr ra

u:
li a1,0
jr ra