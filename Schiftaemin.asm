.data

num: .ascii "\nInserisci un numero:\n"
slash: .asciz "\n"
.text


.globl main 

main: 



addi sp,sp, -44
mv a0,sp
jal inserimento 

addi sp,sp, 44


addi sp,sp, -44
mv a0, sp
jal shift


addi sp,sp, 44

la a0, slash
li a7, 4
ecall

addi sp,sp, -44
mv a0, sp
jal stampa
addi sp,sp, 44

addi sp,sp, -44
mv a0, sp
jal trovamin  
addi sp,sp, 44
li a7,10
ecall
#############
inserimento: 
mv t0,a0
li t2,10

go: 
la a0, num
li a7, 4
ecall 
li a7, 5
ecall
mv t1,a0
sw t1, (t0) 

addi t0,t0,4

addi t2,t2,-1
bnez t2,go
jr ra

stampa:
mv t0,a0 
pr:
lw t1,(t0) 

mv a0, t1
li a7, 1
ecall
addi t0,t0, 4

bnez t1, pr

jr ra
shift:
li t2,10
mv t0,a0 
addi t0,t0, 36

addi t2,t2,-1
lw t1,(t0) 
addi t0,t0, 4
sw t1,(t0)
cc: 
addi t2,t2,-1
addi t0,t0, -8
lw t1,(t0) 
addi t0,t0, 4
sw t1,(t0) 
bnez t2,cc 
jr ra

trovamin: 
mv t0, sp
addi t0,t0, 4
li t2,9
lw t4,(t0) 
besh:
addi t0,t0, 4
lw t5,(t0)
bge t5,t4, skip
mv t4,t5
mv t6,t4
skip:
mv t6,t4
addi t2,t2,-1
bnez t2,besh
la a0, slash 
li a7,4
ecall 

mv a0, t6
li a7, 1
ecall
jr ra