.data

s: .asciz " "

.text


.globl main


main:

ins:
li t0, 100
li a7,5
ecall

mv a1,a0

bgt a1,t0,ins
li t0, 3
rem a0, a1, t0
bnez a0, ins

li t0, -4
mul a0, a1,t0

add sp,sp, a0
mv t6,a0
mv a0, sp
jal inserisci

mv a0,sp
jal stampa


li t0,4
mul a0, a1,t0
add sp,sp, a0
li a7,10
ecall

inserisci: 
mv t0,a0
mv t1,a1
li t2,0
mv t3,a1
li t6,3
li a6,0
#0
mv a0,t2
sw a0,(t0) 
li a0,0
addi t0,t0, 4
addi t1,t1,-1
addi t2,t2,-1
#1
add a0,t3,t2# n-i
sw a0,(t0) 
addi t0,t0, 4
addi t1,t1,-1
li t4, 0
#2
addi t2,t2,3
li a6,2
mul a0, t2,a6
sw a0,(t0)
addi t0,t0, 4
addi t1,t1,-1
addi t4,t4,1
#Restanti  casi
i:
addi t4,t4,1
addi t2,t2,1
addi t1,t1,-1

li a0, 3
rem a0, t2, a0
bnez a0, skip
sw t2,(t0)
addi t0,t0,4
bnez t1 , i
skip:
bne t4,t6, pc
li t4,0 
li a6, -1
mul t2,t2,a6
add a0, t3,t2
sw a0(t0) 
addi t0, t0, 4
mul t2,t2,a6
bnez t1 , i
pc:
li a6, 2
mul a0,t2,a6
sw a0, (t0) 
addi t0,t0, 4
bnez t1,i
jr ra

stampa:
mv t0,a0
mv t1,a1
ii:
lw a0,(t0)
li a7,1
ecall
 
la a0,s 
li a7,4
ecall 
 
addi t0,t0, 4
addi t1,t1,-1

bnez t1,ii
jr ra