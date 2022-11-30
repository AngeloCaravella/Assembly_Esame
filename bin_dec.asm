.data
s: .asciz "\n"
.align 2
array: .space 200

.text

.global main


main:

addi sp,sp, -12
mv a0,sp
li a1,9
li a7,8
ecall
mv a1,a0
la a0, s
li a7,4
ecall
mv a0,a1
jal converti_decimale

li a7,1
ecall

jal decimale_binario

jal stampa
addi sp,sp,12
li a7,10
ecall

###############################
converti_decimale:
mv t0,a0
li t2,7
la t1,array
c:
lbu t1,(t0)
beqz t1,fine 
addi t1,t1,-48

sll t1,t1,t2
addi t2,t2,-1
add t4,t4,t1

addi t0,t0,1
b c
fine:
mv a0,t4
jr ra
#########################
decimale_binario:
mv t6,a0
la a0, s
li a7,4
ecall

la t1,array
go:
srli t5,t6,1
beqz t5,fine_
slli t4,t5,1
sub a0, t6,t4
sw a0,(t1)
addi t1,t1,4
mv t6,t5
bnez t5,go
fine_:
li a0,1 
sw a0,(t1)
jr ra
#############################

stampa: 
li t3,8
la t0, array
addi t0,t0,28
st:
addi t3,t3,-1
lw a0,(t0)
li a7,1
ecall
addi t0,t0,-4
bnez t3,st
jr ra