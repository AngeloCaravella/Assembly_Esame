.data 

stringa: .asciz "Inserisci una stringa:\n"

carattere: .asciz "\nInserisci un carattere:\n"

risultato: .asciz"\nIl numero di occorrenze e:'"
.text


.globl main


main:


la a0, stringa
li a7,4
ecall

addi sp,sp,-256
mv a0,sp
li a1,256
li a7, 8
ecall

la a0, carattere
li a7,4
ecall

li a7,12
ecall
mv a1,a0

mv a0,sp
jal conta_occ


la a0, risultato
li a7, 4
ecall

mv a0 ,t4
li a7,1
ecall
li a7 , 10
ecall

conta_occ:
mv t0,a0
mv t3,a1
go:
lbu t2,(t0) 
bne  t2, t3, skip
addi t4,t4,1
skip: 
addi t0,t0,1
bnez t2,go
jr ra

