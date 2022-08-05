.data

stringa: .asciz "Dammi un numero (-2ˆ31<= x <2ˆ31):"
somma: .asciz "La somma è"
spazio: .asciz "\n"

.text

.globl main

main:
la a0, stringa
li a7,4
ecall

li a7,5
ecall

bgt a0,zero, go

li t1,-1

mul a0,a0,t1
go:
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
li t2,10
mv t1,a0

goo:

rem a1, t1,t2
add t3,t3,a1

div t1,t1,t2

bnez t1, goo
jr ra

