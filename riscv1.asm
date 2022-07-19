.data

stringa: .asciz "Inserisci l'n-esimo numero di Fibonacci che cerchi:\n"

.text

.globl main


main: 

la a0 , stringa
li a7 ,4
ecall

li a7, 5
ecall 
mv a2, a0

addi sp,sp,-8
mv a0,sp

jal calcola

li a7, 10
ecall

calcola: 
mv t0, a0 
li t1, 0

sw t1,(t0) 
li t1, 1
addi t0,t0,4
sw t1,(t0) 


mv t1,a2
addi t1,t1,-1
new:
addi t0,t0,-4
lw t2,(t0)
addi t0,t0,4
lw t3,(t0)
add t3,t3,t2
addi t0,t0,4
sw t3, (t0) 
addi t1,t1,-1

bnez t1, new 
lw t3,(t0) 
mv a0, t3
li a7, 1
ecall
jr ra