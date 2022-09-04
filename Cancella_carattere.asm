.data

stringa: .asciz "Inserisci la stringa:\n"
carattere: .asciz "Inserisci il carattere: \n"
l: .asciz "\nLa lunghezza è: \n"
.text


.globl main


main:

la a0, stringa
li a7,4
ecall

addi sp,sp,-100
mv a0,sp
li a1,100
li a7,8
ecall

mv t0,sp


la a0, carattere
li a7,4
ecall

li a7,12
ecall

mv a1, a0

mv a0,t0
jal lenght


mv a0,t0
jal mod

mv a0,t0
li a7, 4
ecall

li a7,10
ecall

lenght: 
mv t1,a0
mv t2,a1
lun:
lbu a0,(t1)
addi t1,t1,1
addi t3,t3,1
bnez a0,lun

la a0 ,l
li a7, 4
ecall

mv a0,t3
li a7,1
ecall

mv a3,t3 

jr ra
mod:
mv t3,a3
addi t3,t3,20
li t6,1000
mv t5,a0
gg:
mv t1,t5
addi t6,t6, -1
beqz t6, f
m:
lbu a0,(t1)
bne a0, a1, skip
mv t4,t3
mm:
addi t1,t1,1
lbu a2,(t1)
addi t1,t1,-1
sb a2, (t1)
addi t4,t4, -1
addi t1,t1,1
bnez t4,mm
b gg
skip:
addi t1,t1, 1
addi t3,t3, -1
bnez t3,m
f:
jr ra
