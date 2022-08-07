.data

pal: .asciz "E' palindroma!\n"
non: .asciz "Non è palindroma!\n"
.text

.globl main

main:


addi sp,sp,-16
mv a0, sp
li a1,17
li a7,8
ecall

jal lunghezza

jal palindroma

li a7, 10
ecall 

lunghezza:
mv t0,a0
mv t3,a0
g:
lbu t1,(t0)
addi t0,t0, 1
addi t2,t2,1
bnez t1,g
addi t2,t2,-3
mv a0,t2#Lunghezza  
mv a3,t3 #Riferimento allo stack
jr ra
palindroma:
mv t0,a0
mv t3,a3
mv t4,a3

add t4,t4,t0
li a1,2
div t0, t0,a1 
go:

lbu t5,(t3)

lbu t6,(t4)

addi t3,t3,1
addi t4,t4,-1
addi t0,t0, -1
beqz t0,fine 
beq t5,t6,go
la a0, non
li a7,4
ecall
jr ra
fine:
la a0, pal
li a7,4
ecall
jr ra