.data

lenght: .asciz "Inserisci la lunghezza della stringa:\n(considerando un numero in più per il tappo)\n"
ss: .asciz "\n"
.text

.globl main

main: 


la a0, lenght
li a7, 4
ecall
li a7,5
ecall

mv a6,a0
li a2,-1
mul a6,a6,a2
add sp,sp, a6

mv a0,sp
mul a6,a6,a2
mv a1,a6
li a7,8
ecall


jal inverti


li a7,10
ecall

inverti:
mv t0,a0
la a0,ss
li a7, 4
ecall
add t0,t0, a1
s:
lbu t5,(t0)
mv a0, t5 
li a7, 11
ecall
addi t0,t0,-1
addi a1,a1,-1
bgez  a1, s
jr ra