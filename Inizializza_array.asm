.data

st0: .asciz "Inizializzo l’array..."
st1: .asciz "fatto!\n\n"
st2: .asciz "Numero dell’elemento (0-19, -1 per terminare):"
st3: .asciz "L’elemento di posto:"  
st4: .asciz "vale:"
st5: .asciz "\n"
.align  2
interi: .space 20
.text


.globl main

main:

la a0, st0
li a7,4
ecall

la a0, interi
jal array_init


la a0, st1
li a7,4
ecall


la a0, st2
li a7,4
ecall
li a2,19
li a3, -1
insert:
li a7, 5
ecall
beq a0, a3, finish 
bltz a0, insert
bgt a0,a2,insert

mv a1,a0
la a0, interi
jal array_element


la a0, st3
li a7, 4
ecall

mv a0, a1
li a7, 1
ecall 


la a0, st4
li a7, 4
ecall


mv a0, a4
li a7, 1
ecall 


finish:
li a7,10
ecall


array_init:
mv t0, a0
li t1,20
li a6, 6

sw t2,(t0)
addi t0,t0, 4
addi t3,t3,1
addi t2,t2,1
a_i:
mul t2, t2, a6
addi t2,t2,1

mv a0,t2
li a7, 1
ecall
sw t2,(t0)

addi t0,t0, 4
addi t3,t3,1
mv t2,t3

bne t2,t1,  a_i
jr ra

array_element:
mv t0,a0 
mv t1,a1
li t4,0 
li t5,20
go:
lw t2,(t0) 
beq t4,t1, assign
addi t4,t4,1
addi t0,t0,4
bne t4,t5, go

assign:
mv a4,t2
mv a1,t1
jr ra