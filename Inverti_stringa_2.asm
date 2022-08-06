.data

stringa: .space 20
slash: .asciz "\n"
.text 

.globl  main

main:

la a0, stringa
li a1, 10
li a7,8
ecall

la a0, slash
li a7,4
ecall
jal stampa_al_comtrario

li a7,10
ecall


stampa_al_comtrario: 
la a0, stringa
mv t0,a0 
l:
lbu t1,(t0) 
addi t0,t0,1 #vado avanti 
addi t2,t2,1 
bnez t1,l

la a0, stringa 
mv t6,a0

add t6,t6,t2
s:
lbu t1,(t6)
mv a0,t1
li a7,11
ecall
addi t2,t2,-1
addi t6,t6,-1
bgez   t2, s

jr ra

