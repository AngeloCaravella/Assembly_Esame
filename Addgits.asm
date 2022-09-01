.data 


num: .asciz "Dammi un numero (<11 cifre):"

str: .space 11

.text 


.globl main


main: 


la a0, num
li a7, 4
ecall


la a0, str
li a1,11
li a7,8
ecall

la a0,str
jal compute_sum

li a7,10
ecall

compute_sum: #048d è lo 0
mv t0,a0 
li t2,48
lenght: 
lbu a0,(t0) 

sub t3,t3,t2
mv a0,t3
li a7,1
ecall

addi t0,t0,1

addi t1,t1,1
bnez a0, lenght

#mv a0, t1
#li a7,1
#ecall


jr ra