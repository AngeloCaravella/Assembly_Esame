.data
spa: .asciz "\n"
.text

.global main

main:

li a7, 5
ecall
mv t6,a0

addi sp,sp, -20
mv a2,sp
jal esadecimale

mv a2,sp
jal stampa

la a0, spa
li a7,4
ecall

mv a2,sp
mv a0,t6
jal ottale


mv a2,sp
jal stampa
la a0, spa
li a7,4
ecall


mv a2,sp
mv a0,t6
jal binario


mv a2,sp
jal stampa


addi sp,sp,20
li a7,10
ecall

binario:
mv t0,a0
mv t2,a2
li t1,0
li t3,0
li t5,0
ggg:
srli t1,t0,1 #n diviso 2
beqz t1, fine3# se il quoziente è zero stampo il dividendo
mv t4,t1# salvo il quoziente
slli  t1,t1,1# n per 2
sub  t3,t0,t1 #in t3 il resto

sw t3,(t2)

addi t2,t2,4
addi t5,t5,1

mv t0, t4 # il dividendo è il quoziente
bnez t1,ggg
fine3:
sw t0,(t2) 
addi t5,t5,1
mv a5,t5
jr ra


esadecimale:
mv t0,a0
mv t2,a2
g:
srli t1,t0,4 #n diviso 16
beqz t1, fine# se il quoziente è zero stampo il dividendo
mv t4,t1# salvo il quoziente
slli  t1,t1,4# n per 16
sub  t3,t0,t1 #in t3 il resto

sw t3,(t2)

addi t2,t2,4
addi t5,t5,1

mv t0, t4 # il dividendo è il quoziente
bnez t1,g
fine:
sw t0,(t2) 
addi t5,t5,1
mv a5,t5
jr ra



ottale:
mv t0,a0
mv t2,a2
li t1,0
li t3,0
li t5,0
gg:
srli t1,t0,3 #n diviso 8
beqz t1, fine2# se il quoziente è zero stampo il dividendo
mv t4,t1# salvo il quoziente
slli  t1,t1,3# n per 8
sub  t3,t0,t1 #in t3 il resto

sw t3,(t2)

addi t2,t2,4
addi t5,t5,1

mv t0, t4 # il dividendo è il quoziente
bnez t1,gg
fine2:
sw t0,(t2) 
addi t5,t5,1
mv a5,t5
jr ra

stampa:
mv t0,a2
mv t5,a5

slli t5,t5,2
add t0,t0,t5
addi t0,t0,-4
srli t5,t5,2
s:
lw a0,(t0)
li a7,1
ecall

addi t0,t0,-4

addi t5,t5,-1
bnez t5,s
jr ra