.data

s: .asciz "La stringa più grande deve essere inserita prima della più piccola, delimitata da uno spazio\n"
str1: .space 100
ok: .asciz "\nOk\n"
nc: .asciz "\nNon è contenuta\n"
#Scrivere un programma che contenga due
#stringhe (vettori di caratteri), una stringa più
#lunga STR, ed una più corta TKN
#• Il programma deve verificare se la stringa più
#corta TKN è contenuta in quella più lunga STR

.text


.globl main


main:

la a0, s
li a7,4
ecall

addi sp,sp,-100
mv a0,sp
li a1,100
li a7,8
ecall

mv a0,sp
jal controlla


addi sp,sp,100
li a7,10
ecall

controlla:
mv t0,a0
li t1,32
la t2,str1
c:
lbu a0,(t0)
beq a0, t1, cc

sb a0,(t2)

addi t4,t4,1 #lenght++

addi t2,t2,1 
addi t0,t0,1

bne a0,t1,c
cc:
addi t0,t0,1# n+1
la t2,str1 #recall
contr:
lbu a0,(t0)

lbu t3,(t2) 

addi t0,t0,1
addi t2,t2,1
addi t4,t4,-1

bne a0,t3, fail
bnez t4,contr

la a0, ok
li a7,4
ecall
jr ra
fail:
la a0, nc 
li a7,4
ecall
jr ra