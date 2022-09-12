.data

negativi: .asciz "I numeri negativi sono:\n"
s: .asciz "\n"
.text


.globl main


main:

addi sp,sp, -20

mv a0,sp


jal inserisci

mv a0,sp

jal check

addi sp,sp, 20
li a7,10
ecall

inserisci: 
li t1,5
mv t0,a0
i:

li a7,5
ecall

sw a0, (t0)
li a7,35
ecall

la a0, s
li a7,4
ecall


addi t0,t0,4
addi t1,t1,-1


bnez t1,i

jr ra

check:
li t1,5
mv t0,a0
li t6,0x80
c:

lw a0,(t0) 

and a0,a0,t6
beqz  a0,skip
addi t2,t2,1
skip:

addi t0,t0, 4


addi t1,t1,-1
bnez t1,c
la a0, negativi 
li a7,4
ecall


mv a0,t2 
li a7,1
ecall
jr ra