.data

str: .asciz "Inserisci una stringa: \n"
lun: .asciz "\nLa lunghezza è:\n"
slash: .asciz "\n"
vocali: .asciz "aeiou"

.text

.globl main


main:
li t2, 0
la a0, str
li a7, 4
ecall  
   
addi sp, sp, -80
mv a0, sp   
li a7, 8
li a1, 23
ecall
mv a0, sp
jal lenght

mv a0, sp
jal vocal_upper

mv a0, sp
li a7,4
ecall
li a7, 10
ecall

lenght:
mv t0, a0
check:
lbu t1 (t0)
addi t0,t0, 1
addi t2,t2,1
bnez t1, check
la a0,lun 
li a7, 4
ecall
addi t2,t2,-2
mv a0, t2  
li a7, 1
ecall

li t3, 20
bgt t2,t3, main
jr ra

vocal_upper: 

la t0, vocali
mv t1,a0
li t5,5
la a0, slash 
li a7, 4
ecall
goo:
lbu t2, (t1)
lbu t3, (t0) 
beqz t2, f

checK:
beqz t5, ff
bne t2,t3,go
addi t2,t2,-32
sb t2, (t1)
b ff
go:
addi t5,t5,-1
addi t0,t0,1
lbu t3, (t0) 
b checK
ff:
li t5, 5
la t0, vocali
addi t1,t1, 1

bnez t2, goo
f:    
jr ra
