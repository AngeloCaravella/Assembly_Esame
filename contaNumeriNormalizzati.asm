.data
p1: .asciz "dammi il valore ["
p2: .asciz "]"
p3: .asciz "i valori normalizzati sono:  "
.text
.globl main
main:
#allocare sullo stack spazio per 5 float
addi sp,sp,-20
mv a0,sp
jal riempiArray
mv a0,sp
jal contaNormalizzati
mv t0,a0
la a0,p3
li a7,4
ecall
mv a0,t0
li a7,1
ecall
addi sp,sp,20#prima di uscire rimetto a posto lo stack pointer
j return0
riempiArray:
li t0,0
li t1,5
mv t2,a0
loopRiempiArray:
beq t0,t1,escRiempiArray
la a0,p1
li a7,4
ecall
mv a0,t0
li a7,1
ecall
la a0,p2
li a7,4
ecall
li a7,6
ecall
fsw fa0,0(t2)#inserisco il float all'interno dell'array
addi t2,t2,4
addi t0,t0,1
j loopRiempiArray
escRiempiArray:
jr ra#la funzione non ritorna nulla al main
contaNormalizzati:
li t0,0
li t1,5
mv t2,a0
li a1,0#a1=totale Normalizzati
loopContaNormalizzati:
beq t0,t1,escContaNormalizzati
flw ft0,0(t2)
fmv.x.s t3,ft0#carico t3 con i bit che rappresenta il float
srli t3,t3,23
andi t3,t3,0x000000ff#maschera per prendere i bit nel campo esponenziale
bnez t3,contaNormalizzato
continua:
addi t0,t0,1
addi t2,t2,4
j loopContaNormalizzati
contaNormalizzato:
addi a1,a1,1
j continua
escContaNormalizzati:
mv a0,a1
jr ra
return0:
li a7,10
ecall