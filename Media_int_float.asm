.data

gimme: .asciz "Dammi il valore di arr:["
s: .asciz "\n"
pare: .asciz "]\n"
.text


.globl main

main: 

addi sp,sp, -20
mv a0,sp 

jal inserisci

mv a0,sp
jal media_int
mv t3,a0
li t6,5
div t3,t3,t6
mv a0,t3
li a7,1
ecall

mv a0,sp
jal media_float
la a0 ,s
li a7,4
ecall
li t6,5
fmv.s.x ft6,t6

fdiv.s fa0,fa0,ft6

li a7,2
ecall

li a7,10
ecall

inserisci: 
mv t0,a0
li t5,5
li a1,0
go:

la a0,gimme
li a7 ,4
ecall

mv a0, a1
li a7,1
ecall
la a0, pare
li a7,4
ecall
addi a1,a1,1

li a7,5
ecall

sw a0, (t0) 

addi t0,t0, 4
addi t5,t5,-1

bnez t5, go
mv a0,t0
jr ra

media_int:
mv t0,a0
li a6,5
mi:
lb a0, (t0) 
add t1,t1,a0
addi t0,t0,4
addi a6,a6,-1

bnez a6, mi

mv a0,t1
jr ra


media_float:
mv t0,a0 
li t1,0
li a6, 5
mf:
lb a0, (t0) 

add t1,t1,a0
addi t0,t0,4
addi a6,a6,-1
bnez a6, mf
fmv.s.x fa0,t1 
jr ra  