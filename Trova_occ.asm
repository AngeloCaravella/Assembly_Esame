.data

elem: .asciz "\nInserisci la posizione dell'elememto che vuoi cercare: \n"

.text


.globl main


main:

addi sp, sp, -20 
mv a0,sp 
jal inizializza_array 
addi sp, sp, 20 
continua:
li t6, -1
la a0, elem
li a7,4
ecall

li a7,5
ecall
mv a1,a0
beq a1,t6, fine
addi sp, sp, -20 
mv a0,sp
jal  trova
addi sp,sp, 20


bne a1, t6, continua  
fine:
li a7,10
ecall 
  
inizializza_array:
mv t0,a0
li t1,1
li t2,20
sw t1,(t0) 
addi t0,t0,4
addi t2,t2,-1
go:
addi t4,t1,6
mv t1,t4
sw t1,(t0) 
addi t2,t2,-1
addi t0,t0,4
bnez t2,go
jr ra  

trova: 
mv t1,a1
mv t0,a0 
li t3,1
goo:
bne t3,t1, skip
lw t4,(t0)
mv a0, t4
li a7, 1
ecall
jr ra
skip:
addi t3,t3,1
addi t0,t0,4
bnez t4,goo
jr ra