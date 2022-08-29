#Decimale ->>> Binario 
.data

.text


.globl main

main:

li a7,5
ecall

mv a1,a0
addi sp,sp,-100
mv a0,sp
jal bin

mv a0,sp
jal stampa1
#jal stampa

addi sp,sp,100
li a7,10
ecall

bin: 
mv t0,a1 
li t1,2
mv t5,a0
bb:
beqz t0 ,fine
rem t2,t0,t1
div t3,t0,t1
addi t6,t6,1
sw t2,(t5)
addi t5,t5,4
mv t0,t3
bnez t0,bb
fine:
mv a1,t6
jr ra

stampa1:
mv t0,a0
mv t1,a1
kk:
lw a0,(t0)
addi t0,t0,4
addi t1,t1,-1
bnez t1,kk
mv t1,a1
kkk:
addi t0,t0,-4
lw a0,(t0)
li a7,1
ecall
addi t1,t1,-1
bnez t1,kkk
jr ra
