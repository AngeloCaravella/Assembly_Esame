.data

sl: .asciz "\n"

.text


.globl main



main: 


addi sp,sp, -100
li a1 ,100
mv a0,sp
li a7,8
ecall

mv a0,sp

jal lunghezza

mv a0,sp

jal prendiultimocarattere


mv a0,sp

jal salva


mv a0,sp
li a7,4
ecall

addi sp,sp, 100
li a7,10
ecall

lunghezza:
mv t0,a0
l:
lb a0,(t0) 

addi t0,t0,1

addi t1,t1, 1

bnez a0,l

addi t1,t1,-2
mv a0, t1
li a7, 1
ecall
mv a1,t1

la a0,sl
li a7,4
ecall
jr ra


prendiultimocarattere:
mv t0,a0
mv t1,a1
li a2,0
p:
lbu a0,(t0) 
mv t2,a0

addi t0,t0, 1
addi a2,a2,1

bne a2,t1,p

mv a0,t2
li a7,11
ecall

mv a2,t2
mv a1,t1
jr ra

salva: 

mv t0,a0
mv t1,a1
mv t2,a2

lb t5,(t0) 
sb t2,(t0)
addi t0,t0,1
addi t1,t1,-1
li a3,0
pp: 
lb t2,(t0) 
addi t1,t1,-1
bnez t1,go
sb t5,(t0)  
go:
addi t0,t0, 1


bnez t1,pp

la a0, sl
li a7,4
ecall
jr ra
