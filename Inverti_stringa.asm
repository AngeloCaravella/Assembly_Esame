.data
l: .asciz "\nLa lunghezza è:\n"
s: .asciz "\n"
.text

.globl main


main:

addi sp,sp,-22
mv a0,sp
li a1,20
li a7,8
ecall

mv a0,sp
jal inverti

la a0, s
li a7,4
ecall

mv a0,sp
li a7,4
ecall

li a7,10
ecall

inverti:
mv t0,a0
li a1,0
h:
lbu a0,(t0) 
addi t0,t0,1
addi a1,a1,1
bnez a0,h
addi a1,a1,-2

la a0,l
li a7, 4
ecall

mv a0, a1
li a7,1
ecall

mv a0,sp
mv t0,a0
mv t1,a0
addi a1, a1,-1
add t1,t1,a1
addi a1, a1,1
li a3,2
li t3,0
li t4,0
div a2,a1,a3
mv t2,a2
g:
lbu t3,(t0)
lbu t4,(t1)

sb t3,(t1)
sb t4,(t0)

addi t1,t1,-1
addi t0,t0,1

addi t2,t2,-1
bnez t2,g
jr ra