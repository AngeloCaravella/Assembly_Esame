.data

posto: .asciz "Inserisci l'elemento di posto:["
pare: .asciz "]\n"

pos: .asciz "Ci sono tot positivi:"
neg: .asciz "Ci sono tot negativi:"
.text

.globl main

main: 

addi sp,sp,-16
mv a0,sp

jal inserisci 
addi sp,sp,16

addi sp,sp,-16
mv a0,sp
jal trova

la a0, pos
li a7,4
ecall
mv a0,t1
li a7,1
ecall


la a0, neg
li a7,4
ecall
mv a0,t2
li a7,1
ecall

li a7,10
ecall

inserisci:
mv t0, a0
li t2, 0
li a3,4
go:
la a0, posto
li a7,4
ecall

mv a0, t2
li a7, 1
ecall

addi t2,t2,1

la a0 ,pare
li a7,4
ecall 

li a7,5
ecall

sw a0, (t0)
addi t0,t0,4
  
bne t2, a3, go
jr ra

trova: 
mv t0, a0
li a3,4
li t4,0
li t1,0
li t2,0
goo:
addi t4,t4,1
lw   a1,(t0) 
addi t0,t0,4
bgez a1,ip
addi t2,t2,1#t2 per negativi 
bne t4,a3, goo
jr ra
ip:
addi t1,t1,1#t1 per positivi 
bne t4,a3, goo
jr ra

