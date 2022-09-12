.data

stringa: .space 100

.text

.globl main

main:

la a0,stringa
li a1,100
li a7,8
ecall


la a0, stringa
jal alza

la a0, stringa
li a7,4
ecall

li a7,10
ecall


alza:
mv t0,a0
li t5,32
li t4,0
a:
lbu a0,(t0)

beq a0, t5 ,skip
b ch
aa:
lbu a0,(t0)
addi t0,t0,1
beq a0, t5 ,skip
bnez a0, a
ch:
addi t2,a0,-32
sb t2,(t0)
addi t4,t4,1
addi t0,t0,1

bnez a0, aa
skip:
addi t0,t0,1
lbu a0,(t0)
bnez a0, a
jr ra