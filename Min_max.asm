.data

elem: .asciz "Inserisci l'elemento di posto:["
parentesi: .asciz "]\n"
Min: .asciz "\n Il min è \n"
Max: .asciz "\n Il max è \n"


.text

.globl  main

main:
addi sp, sp, -24
mv a0, sp 
jal inserimento

mv a0, sp 
jal massimo
la a0, Max 
li a7 ,4
ecall 

mv a0, t3
li a7 ,1
ecall

mv a0, sp 
jal minimo

la a0, Min 
li a7 ,4
ecall 

mv a0, t3
li a7 ,1
ecall

addi sp, sp, 24
li a7, 10
ecall

inserimento: 
li t2, 5
mv t0, a0 
i:
la a0,elem
li a7 ,4
ecall

mv a0, t1
li a7 ,1
ecall 

la a0,parentesi
li a7 ,4
ecall

li a7 ,5
ecall 

sw a0 ,(t0) 
addi t0, t0, 4
addi t1, t1, 1
bne  t1,t2, i
jr ra

massimo:
li t4, 5

mv t0, a0 
lw t1, (t0) 
addi t4, t4, -1
addi t0, t0, 4
m:
lw t2,(t0)
bgt t2, t1, max
mv t3, t1
ff:
addi t0, t0, 4
addi t4, t4, -1
bnez t4, m
jr ra

max:
mv t3, t2
mv t1,t2
j ff

minimo:
li t4, 5
mv t0, a0
lw t1,(t0) 
addi t4, t4,-1
addi t0, t0, 4
mi:
lw t2, (t0)
blt t2, t1, min
mv t3, t1
fff:
addi t4,t4,-1
addi t0, t0, 4
bnez t4,mi
jr ra

min: 
mv t3, t2
mv t1, t2
j fff
