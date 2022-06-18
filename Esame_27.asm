.data 
stringa: .asciz "Dammi il valore di arr["
parentesi: .asciz "]\n"
stp: .asciz "\nLa media delle componenti di posto pari Ë:\n"
std: .asciz "\nLa media delle componenti di posto dispari Ë:\n"

.text 

.globl main

main:

addi sp, sp, -24
mv a0,sp
jal riempi_array 

la a0, stp
li a7 ,4
ecall
mv a0,sp 
jal trova_media_pari
li a7 ,1
ecall


la a0, std
li a7 ,4
ecall
mv a0,sp 
jal trova_media_dispari
li a7 ,1
ecall

addi sp, sp, 24
li a7, 10
ecall

riempi_array:
mv t0, a0
li t6,6
li t1,0
loop:
la a0, stringa
li a7, 4
ecall

mv a0, t1
li a7 ,1
ecall

addi t1, t1,1

la a0, parentesi
li a7, 4
ecall

li a7, 5
ecall

sw a0,(t0)

addi t0,t0,4

addi t6,t6,-1 
bnez t6, loop 
jr ra


trova_media_pari:
li t6 ,6
mv t0,a0
li t2,2
loop1:
rem t5,t6,t2
bnez t5,scarta
lw t3,(t0)
add t4,t4,t3
scarta:
addi t0,t0,4
addi t6,t6,-1
bnez t6,loop1
li t2,3
div t4,t4,t2
mv a0 ,t4
jr ra

trova_media_dispari:
mv t0,a0
li t6 ,6
li t5,0
li t2,2
li t4, 0
loop2:
rem t5,t6,t2
beqz t5,scartaa
lw t3,(t0)
add t4,t4,t3
scartaa:
addi t0,t0,4
addi t6,t6,-1
bnez t6,loop2
li t2,3
div t4,t4,t2
mv a0 ,t4
jr ra