.data

str: .asciz "Inserisci l'elemento di ordine: "
slash: .asciz "\n"
spazio: .asciz " "
polinomio: .asciz "Il polinomio inserito è:"
pol: .asciz "Inserisci un polinomio del terzo ordine: \n" 
poll: .asciz "Il polinomio inserito è: "
error: .asciz "Non rispetta la condizione sufficiente:\n "
st: .asciz "Polinomio stabile\n"
it: .asciz "Polinomio instabile\n"
.text

.globl main


main:

la a0, pol
li a7 ,4
ecall
addi sp, sp, -16
mv a0, sp

jal inserisci

la a0, poll
li a7, 4
ecall
mv a0, sp
jal stampa

mv a0, sp
jal condizione_sufficiente


mv a0, sp
jal calcolo_coefficienti

li a7 ,10
ecall

inserisci:
li t1, 0
li t2,4
mv t0,a0
go:
la a0, str
li a7 ,4
ecall
mv a0, t1 
li a7 ,1
ecall
la a0, slash
li a7, 4
ecall
addi t1,t1,1


li a7, 5
ecall 
sw a0,(t0) 

addi t0,t0,4  

bne t1, t2, go
jr ra

stampa: 
mv t0,a0 
hop:
lw t1,(t0) 
beqz t1, fine
mv a0, t1
li a7, 1
ecall

la a0, spazio
li a7, 4
ecall

addi t0,t0,4
bnez t1,hop
fine:
jr ra

condizione_sufficiente: 
mv t0,a0 
vaiavanti:
lw t1,(t0) 
beqz t1, fine2
bltz t1, nrc

addi t0,t0,4
bnez t1, vaiavanti
fine2:
jr ra
nrc: 
la a0,error
li a7, 4
ecall
li a7,10
ecall

calcolo_coefficienti:
mv t0, a0
li t2, 0
li t3,0#per a0a3
li t4,0#per a1a1
li t5,3

gooo: 

lw t1,(t0) 
beqz t2,mem
beq t2, t5,mem 
add t4,t4,t1
b skip 
mem:
add t3,t3,t1
skip:
addi t2,t2,1
addi t0,t0,4
bnez t1,gooo
bgt t4, t3, stabile 
blt t4,t3,instabile
jr ra

stabile:
la a0, st
li a7, 4
ecall
jr ra
instabile:
la a0, it
li a7, 4
ecall
jr ra
