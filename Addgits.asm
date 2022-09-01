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
li t6,57
sum:
lbu a0,(t0) 
blt a0,t5, skip# se è minore di 48 significa che sono caratteri prima dello zero, non mi servono

bgt a0,t6,skip# se è maggiore di 57 significa che somo caratteri dopo il 9, non mi servono

sub t4,a0,t5
beqz t4,skip
add t3,t3,t4

skip:
addi t0,t0,1

bnez a0,sum
mv a0,t3
jr ra
