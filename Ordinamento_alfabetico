.data

str: .asciz "Inserisci una stringa:\n"
alfabeto: .asciz "abcdefghilmnopqrstuvz"
stringa: .space 100
.text 


.globl main

main: 
la a0, str
li a7, 4
ecall

la a0,stringa
li a7, 8
li a1,100
ecall

addi sp,sp, -100
mv a0,sp 
jal cambia

mv a0,sp 
li a7, 4 
ecall
li a7, 10
ecall

cambia: 
mv t2,a0
li t5,24
la t0 ,alfabeto
la a0, stringa
mv t1,a0
goo:
lbu t3,(t0)#alfabeto
go: 
lbu t4, (t1)#stringa

bne t4,t3, skip
sb t4,(t2)
addi t2,t2,1
skip:
addi t1,t1,1
bnez t4, go
addi t0,t0,1
la t1, stringa
bnez t3,goo
jr ra
