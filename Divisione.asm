.data

dividendo: .asciz "Inserisci il dividendo:\n"
divisore: .asciz "Inserisci il divisore:\n"
risultato: .asciz "Il risultato è:\n"
resto: .asciz "\nCon resto:\n"
.text 

.globl main

main: 

jal inserisci 

jal calcola
la a0, risultato
li a7,4
ecall 

mv a0, t4
li a7, 1
ecall

la a0, resto
li a7,4
ecall 


mv a0, t6
li a7, 1
ecall

li a7, 10
ecall
inserisci: 
la a0, dividendo
li a7, 4
ecall
li a7 ,5
ecall
mv t0, a0
la a0, divisore
li a7, 4
ecall

li a7, 5
ecall
mv t1,a0 

jr ra

calcola:
li t2, 1
beq t0,t1, fine2
mv t6,t1

new:

blt  t0,t6, fine1
beq t0,t6, fine3
addi t2,t2, 1
mv t6,t1
mul t6, t6,t2
bne t0,t1, new
fine1:
addi t2,t2,-1
mv t4,t2
mul t1,t1,t2
sub t0, t0, t1
mv t6, t0
jr ra
fine2:
li t4, 1
li t6,0
jr ra
fine3:
mv t4, t2
li t6,0
jr ra
