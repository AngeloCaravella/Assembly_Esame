.data

consonanti: .asciz "bcdfghlmnpqrstvz"
.text

.globl main

main: 

addi sp,sp,-50
mv a0,sp
li a1,50
li a7,8
ecall

mv a0,sp

jal lunghezza

la a2,consonanti
mv a0,sp
jal cambia

mv a0, sp
li a7,4
ecall

li a7 ,10
ecall


lunghezza:
mv t0,a0 
li t3,21
li t1,0
li t6,32
l:
lbu a0,(t0) 
addi t0,t0, 1

beq a0, t6,skip
addi t1,t1,1
skip:

beq t1,t3,errore 
bnez a0,l

jr ra

errore: 
j main

cambia:
mv t0,a0 
mv t1,a2
li a4,32
li a5,21
gg:
lbu a1,(t1) 
g:
lbu a2,(t0) 
beq a2,a4, skip2
addi a5,a5,-1
beq a2,a1, change
go:
skip2:
addi t0,t0,1
bnez a5,g
li a5,21
mv t0,a0
addi t1,t1,1

bnez a1,gg

jr ra
change: 
addi a2,a2,-32
sb a2,(t0) 
j go