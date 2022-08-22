.data


.text


.globl main

main: 

addi sp,sp, -40
mv a0,sp
jal inserisci  

mv a0,sp
jal ordina

mv a0,sp
jal stampa

li a7,10
ecall

inserisci: 
mv t0,a0
li t1,10
l1:
li a7,5
ecall
sw a0,(t0) 
addi t0,t0,4
addi t1,t1,-1
bnez t1,l1
jr ra

ordina:
mv a3,a0
li t2,20
li t6,20
l4:
mv t0,a3
addi t6,t6,-1
beqz t6,f
l2: 
lw a0,(t0) 
beqz a0,l4
addi t0,t0,4
lw a1,(t0) 
beqz a1,l4
blt a1,a0, change
b l2
change:
addi t0,t0, -4
sw a1,(t0) 
addi t0,t0, 4
sw a0,(t0) 
b l2
f:
jr ra

stampa:
mv t0,a0
li t3,10
l5:
lw a0, (t0) 
li a7,1
ecall
addi t0,t0,4
addi t3,t3,-1
bnez t3,l5
jr ra