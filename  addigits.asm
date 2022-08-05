.data

stringa: .asciz "Dammi un numero (<11 cifre) :"
somma: .asciz "La somma è"
spazio: .asciz "\n"
.text

.globl main

main:

la a0, stringa
li a7,4
ecall

li a7,8
li a1,11
ecall

jal compute.sum

la a0,somma
li a7,4
ecall

mv a0,t3
li a7,1
ecall


li a7,10
ecall 

compute.sum:
mv t0,a0
li t3,0
li t5,48
sum:
lbu t2,(t0) 
blt t2,t5, skip
sub t4,t2,t5
beqz t4,skip
add t3,t3,t4

skip:
addi t0,t0,1

bnez t2,sum
mv a0,t3
jr ra

