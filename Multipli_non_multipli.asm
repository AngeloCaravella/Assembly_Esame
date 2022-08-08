.data
Mul: .asciz "I numeri multipli di 8 ma non di 256 sono:\n"
.text
.globl main
main: 

addi sp, sp,-20
mv a0,sp 
jal inserisci_interi
mv a0,sp
jal check
addi sp, sp,20
li a7, 10
ecall

inserisci_interi:
li a1,5
mv t0,a0
jump:
li a7,5
ecall
sw a0,(t0)
addi t0,t0, 4
addi a1,a1,-1
bnez a1, jump
jr ra

check:
li a1, 7
li a3,255
li a2,5
li a4,-1
mv t0,a0 
 jump2:
lw t1,(t0) 
bgez  t1,nmod #Se è più grande di 0(o uguale) non gli cambio il segno
mul t1,t1,a4
 nmod:
addi t0,t0, 4
addi a2,a2,-1

and t6,t1,a1
bnez t6,skip #Se il risultato dell' and logico con 7 è diverso da 0 non è multiplo di 8
and t6,t1,a3
beqz t6,skip# Se il risultato dell' and logico con 255 è 0 è multiplo di 256, quindi scarto
addi t2,t2,1
 skip:
bnez a2, jump2
la a0, Mul
li a7, 4
ecall
mv a0, t2
li a7, 1
ecall
jr ra

