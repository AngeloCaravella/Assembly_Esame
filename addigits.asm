.data 
stringa: .asciz "Inserisci un numero minore di 11 cifre:\n"
somma: .asciz "\nLa somma è:\n"
.text

.globl main
main:

la a0, stringa
li a7,4
ecall

mv a0,sp
li a1,12
li a7,8 
ecall

jal compute_sum
mv t6,a0 

la a0,somma
li a7,4
ecall 

mv a0,t6
li a7,1
ecall 

li a7,10
ecall

compute_sum:
mv t0,a0 
c:
li t1, 48
lbu t2,(t0) 
blt t2, t1, skip # se è minore di 48 non è un numero 
li t1,57
bgt t2,t1, skip
#altrimenti lo è
li t1, 48
sub t3,t2,t1# sottraggo al carattere 48 per prendermi il corrispondente numero
beqz t3,skip 
add t4,t4,t3# metto in t4 la somma
skip:
addi t0,t0,1 # vado avanti

bnez t2,c    
mv a0,t4
jr ra


