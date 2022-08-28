.data
m: .asciz "Max:"
n: .asciz "\nMin:"
.text


.globl main

main: 

addi sp,sp, -40

mv a0,sp

jal inserisci

mv a0,sp

jal max
la a0, m
li a7,4
ecall

mv a0, a1
li a7,1
ecall
mv a0,sp

jal min

la a0, n
li a7,4
ecall

mv a0, a1
li a7,1
ecall

addi sp,sp, 40
li a7,10
ecall

inserisci: 
mv t0,a0 
li t2,5
i:
li a7, 5
ecall
 
sw a0,(t0) 

addi t0,t0, 4
addi t1,t1,1
blt t1,t2,i
jr ra

max: 
mv t0,a0 
li t2,5
li t1,0
lw a0,(t0)
mv a1,a0
a:
lw a0,(t0) 
blt a0, a1,skp
bgt t3,a0, skip
mv t3,a0
skip:
skp:
mv a1,a0
addi t0,t0,4
addi t1,t1,1
blt t1,t2,a
mv a1,t3
jr ra

min: 
mv t0,a0 
li t2,5
li t1,0
lw a0,(t0)
mv a1,a0
h:
lw a0,(t0) 
bgt  a0, a1,x
blt t3,a0, skip2
mv t3,a0
skip2:
x:
mv a1,a0
addi t0,t0,4
addi t1,t1,1
blt t1,t2,h
mv a1,t3
jr ra