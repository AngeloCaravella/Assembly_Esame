 .data 

dim: .asciz "Inserisci la dimenzione dell'array:\n"
r: .asciz "Riempio l'array:\n"
f: .asciz "Fatto.\n"
s: .asciz "\n"
spa: .asciz " "

.align 2
array: .space 400
.text


.globl main

main:
li t6,100
go:
la a0, dim
li a7,4
ecall

li a7,5
ecall
bgt a0,t6,go
mv a1,a0

addi sp,sp,-4
sw s0,(sp)
mv s0,a1


la a0,r
li a7,4
ecall


la a0, array
jal riempi

la a0, f
li a7, 4
ecall


la a0, array
mv a2,s0
jal stampa

la a0, array
mv a2,s0
jal ordina

la a0,s
li a7,4
ecall
la a0, array
mv a2,s0
jal stampa

lw s0,(sp)
addi sp,sp,4

li a7,10
ecall

riempi: 
mv t0,a0
mv t1,a1
mv t2,a1
li a6,2
li a3,0
goo:
rem a4,a3, a6
bnez a4,sk
sw a3,(t0) 
addi a3,a3,1
b sk1
sk:
sub a0,t2,a3
sw a0,(t0)
addi a3,a3,1
sk1:
addi t0,t0,4
addi t1,t1,-1
bnez t1,goo
jr ra

stampa:
mv t0,a0
mv t3,a2
go2:
lw a0,(t0) 
li a7,1
ecall

la a0, spa
li a7,4
ecall

addi t3,t3,-1  
addi t0,t0, 4
bnez t3,go2
jr ra
ordina:
la  t0,array
mv t3,a2#t3=n
li t4,100
mv t5,t3
nl:
addi t4,t4,-1
beqz t4,fin
la t0,array
mv t5,t3
next:
lw a0,(t0)
addi t0,t0,4
lw a1,(t0) 
beqz a1, fin1# permette di non sforare con i confronti
addi t5,t5,-1
bgt a1,a0, next
addi t0,t0,-4
sw a1,(t0)
addi t0,t0,4
sw a0,(t0)
bnez t5,next
fin1:
b nl
fin:
jr ra
