.data

fib: .asciz "Inserisci una sequenza di fibonacci"
z: .asciz "La sequenza di fibonacci non è questa"
.text



.globl main


main:

addi sp,sp,-400
mv a0,sp
jal inserisci 

addi sp,sp, 400
li a7,10
ecall

inserisci:
mv t0,a0
li t1, 1 

li a7,5
ecall 
bnez a0, fine# diverso da 0 , si esce 

sw a0,(t0)
addi t0,t0,4

li a7,5
ecall
bne a0, t1, fine# diverso da 1
sw a0,(t0)
i:
addi t0,t0,4
li a7, 5
ecall
beqz a0,f
sw a0,(t0) 

addi t0,t0,-8
lw t2,(t0)
addi t0,t0, 4
lw t3,(t0)

add a0,t2,t3
addi t0,t0, 4
lw t4,(t0)

bne a0,t4, fine
b i  
jr ra

fine:
la a0, z
li a7,4
ecall
jr ra
f:
jr ra