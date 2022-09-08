.data

s: .asciz "\nInserisci la stringa:\n"
slash: .asciz "\n"
stringa: .space 50

.text

.globl main

main:

addi sp,sp, -100
mv a0, sp
li a1,100
li a7,8
ecall

la a0 ,s
li a7,4
ecall

la a0, stringa
li a1,50
li a7,8
ecall

jal lunghezza

mv a2,a1# in a2 la lunghezza
mv a0,sp
jal trova


mv a0,t5
li a7,1
ecall
li a7,10
ecall

lunghezza:
mv t0,a0
l:
lbu a0,(t0) 

addi t0,t0,1

addi t1,t1, 1

bnez a0,l

addi t1,t1,-2
mv a0, t1
li a7, 1
ecall
mv a1,t1

la a0, slash
li a7,4
ecall
jr ra


trova: 
mv t0,a0

tt:
la a0, stringa
mv t1,a0
mv t6,a2
t:

lbu t2,(t0)
beqz t2,fine 
lbu t3,(t1) 

bne t2, t3,skip
mv t6,a2
hh:
beqz t6,conta
lbu t2,(t0)
beqz t2,fine 
lbu t3,(t1)

addi t6,t6,-1
addi t0,t0,1
addi t1,t1,1

beq  t2,t3,hh

rety:
skip:        
addi t0,t0,1
addi t1,t1,1

addi t6,t6,-1

bnez t6 ,tt
bnez t2,t

fine:
jr ra

conta:
addi t5,t5,1
b rety