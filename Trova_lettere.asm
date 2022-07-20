.data

lettere: .asciz  "qwertyuiopasdfghjklzxcvbnm"
avviso: .asciz "Le lettere non presenti sono:"
.text


.globl main


main: 

addi sp,sp,-256
mv a0,sp
li a1,256 
li a7,8
ecall

mv a0,sp
jal trova

li a7,10
ecall

trova: 
mv t0,a0 
la t1,lettere
li t4,256

goo:
lbu t2,(t1)
go:
lbu t3,(t0) 
addi t0,t0, 1
addi t4,t4,-1
beqz t4, esci
bne t3,t2,go
addi t1,t1,1
mv t0,sp
bnez t2,goo
esci: 
li t4,256
mv a0, t2
li a7 ,11
ecall
addi t1,t1,1
mv t0,sp
bnez t2,goo


jr ra


