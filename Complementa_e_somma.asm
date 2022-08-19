.data

ins: .asciz "Inserisci un numero ( anche negativo): \n"
sum: .asciz "\nLa somma è:\n"
.text


.globl main


main: 

la a0, ins
li a7,4
ecall

li a7,5
ecall

mv a1, a0
jal complementa
mv a1, a0
la a0, sum
li a7,4
ecall

jal somma

mv a0,a4
li a7,1
ecall
li a7,10
ecall

complementa:
not a1, a1

mv a0,a1
li a7, 1
ecall

jr ra

somma:
bgtz a1,skip
li a2,-1
mul a1,a1,a2
skip:
li a2,10
rem a3,a1,a2
add a4,a4,a3
div a1,a1,a2

bnez a1,skip

jr ra