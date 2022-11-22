.data

stringa: .asciz "Dammi un numero (-231<= x <231):\n"
somma: .asciz "\nLa somma è:\n"

.text

.globl main

main:
la a0, stringa
li a7,4
ecall

li a7,5
ecall

bgtz a0, go
li t1,-1
mul a0,a0,t1
go:
jal compute_sum

la a0,somma
li a7,4
ecall

mv a0,t3
li a7,1
ecall

li a7,10
ecall 


compute_sum:
li t2,10
mv t1,a0

goo:
rem t6,t1,t2 #divido per 10 e mi prendo il resto 
add t3,t3,t6 #metto la somma dentro

div t1,t1,t2 #sovrascrivo al numero la divisione appena fatta
bnez t1, goo
jr ra

