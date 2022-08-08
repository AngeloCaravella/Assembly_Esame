.data


num: .asciz "Inserisci la somma da cercare:\n"
t: .asciz "Trovata!"
n: .asciz "Non trovata..."

.text



.globl  main


main:

addi sp,sp,-16
mv a0,sp

jal inserisci

la a0,num
li a7,4
ecall

li a7,5
ecall

mv a1,a0
mv a0,sp
jal cerca
li a7,10
ecall

inserisci: 
mv t0,a0
li a6, 4

go:
addi a6,a6,-1
li a7,5
ecall

sw a0, (t0) 
addi t0,t0, 4


bnez a6,go

jr ra


cerca:
#Doppio puntatore
mv t0,a0
mv t2,a0

mv t1,a1
li a4,2
addi t2,t2,12
#1-4 || 2-3
go1:
lbu t3,(t0) 
lbu t4,(t2) 

addi a4,a4,-1

add t4,t4,t3

addi t0,t0,4
addi t2,t2,-4

beq t4,t1, fine
bnez a4, go1
# 1-2
mv t0,sp
mv t2,sp
addi t2,t2,4

lbu t3,(t0) 
lbu t4,(t2) 

add t4,t4,t3
beq t4,t1, fine
#3-4
mv t0,sp
mv t2,sp
addi t0,t0 ,8
addi t2,t2 ,12
lbu t3,(t0) 
lbu t4,(t2) 

add t4,t4,t3
beq t4,t1, fine

#3-1
mv t0,sp
mv t2,sp
addi t2,t2,8 
lbu t3,(t0) 
lbu t4,(t2) 

add t4,t4,t3
beq t4,t1, fine
niente:
la a0,n
li a7,4
ecall
jr ra
fine:
la a0, t
li a7, 4
ecall
jr ra