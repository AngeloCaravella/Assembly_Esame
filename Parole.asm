.data

stringa: .asciz "Si prega di inserire uno spazio alla fien della stringa\n"


.text


.globl main



main: 

la a0, stringa
li a7,4
ecall

addi sp,sp,-100
mv a0,sp
li a1,100
li a7,8
ecall

mv a0,sp

jal conta

mv a0,a6
li a7,1
ecall

li a7,10
ecall

conta: 
mv t0,a0
li t2,32
c:
lbu t1,(t0) 
bne t1, t2,skip
j incrementa
cc:
addi t0,t0, 1
lbu t1,(t0)
bne t1, t2,skip

bnez t1, cc
jr ra

skip:
addi t0,t0, 1

bnez t1, c
jr ra

incrementa:
addi t6,t6,1
mv a6,t6
b cc