.data

stringa: .asciz "Testo da criptare:\n"
str: .space 50
chiave: .asciz "(0-255):"


.text


.globl  main

main: 

la a0, stringa
li a7,4
ecall

la a0, str
li a7 ,8
li a1,50
ecall


insert:

la a0, chiave
li a7 ,4
ecall

li a7, 5
ecall

mv t0,a0

blt t0, zero, insert
li t1,256
bge t0, t1, insert

mv a0,t0
jal encrypt

li a7, 10
ecall

encrypt: 
la t2,str
mv t3,a0
e:
lbu t4,(t2) 
beqz t4,fine
xor t4,t4, t3

sb t4,(t2) 
mv a0,t4
li a7, 11
ecall
addi t2,t2,1

bnez t4, e
fine:
jr ra