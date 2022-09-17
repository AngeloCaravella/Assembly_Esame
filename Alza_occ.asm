.data

s: .asciz "Inserisci la stringa (massimo 100 caratteri):\n"

c: .asciz "Inserisci la stringa di cui alzare i caratteri:\n"

tt: .asciz "\nTrovato\n"

stringa: .space 100

slash: .asciz "\n"
.text


.globl main


main:

la a0,s
li a7,4
ecall

addi sp,sp,-100
mv a0,sp
li a1,100
li a7,8
ecall

mv t0,a0#STRINGA

la a0,c
li a7,4
ecall

la a0,stringa
li a1 ,10
li a7,8
ecall

jal lenght

mv a0,t0
jal controlla

mv a0,sp
li a7,4
ecall

addi sp,sp,100
li a7,10
ecall

lenght:
mv t2,a0 
l:
lbu t3,(t2)
addi t2,t2,1

addi t4,t4,1
bnez t3, l
 
addi t4,t4,-2

mv a0,t4
li a7,1
ecall

la a0,slash
li a7,4
ecall

mv a4,t4 #lenght
li t3,0 
jr ra


controlla:
mv t4,a4 #LUNGHEZZA TOKEN 
mv t0,a0
la a0, stringa
mv t2,a0
 go:
 li t3,0
lbu t5,(t0)#stringa
lbu t6,(t2) #token
beqz t5,fine #se è uguale a 0 ho finito

beq t5,t6, ccc#############
addi t0,t0,1
b go

fine:
jr ra

ccc: 
addi t3,t3,1

beq t3,t4, trovato

addi t0,t0,1
addi t2,t2,1

lbu t5,(t0)#stringa
lbu t6,(t2) #token

beq t5,t6, ccc
li t3,0
la a0, stringa
mv t2,a0
addi t0,t0,1
b go

trovato:
la a0 ,tt
li a7,4
ecall

mv a3,t3
t:
lbu t5,(t0)
addi t5,t5,-32
sb t5,(t0)

addi t3,t3,-1
addi t0,t0,-1
bnez t3,t
mv t3,a3
add t0,t0,t3
la a0, stringa
mv t2,a0
b go
