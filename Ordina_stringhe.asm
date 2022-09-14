.data

s: .asciz "\n"
prm: .asciz "Viene prima nell'ordine la prima"
sec: .asciz "Viene prima la seconda"
uguali: .asciz "Sono uguali"
.text


.globl main


main:

addi sp,sp,-50

mv a0,sp
li a1,24
li a7,8
ecall

mv a2,a0

la a0, s
li a7,4
ecall

addi sp,sp,25
mv a0,sp
li a1,24
li a7,8
ecall

mv a1,a0

jal ordina

addi sp,sp,50
li a7,10
ecall

ordina:
mv t0,a1
mv t1,a2
avanti:
lbu t2,(t0)

lbu t3,(t1)

beqz t3, fine 
 
 addi t0,t0,1
 addi t1,t1,1
 
beq  t2,t3, avanti  
bge t2,t3,pr
ble t2,t3, rp
beq  t2,t3, fine
pr: 
la a0, prm
li a7,4
ecall
jr ra
rp:
la a0, sec
li a7,4
ecall
jr ra
fine:
la a0,uguali
li a7,4
ecall
jr ra