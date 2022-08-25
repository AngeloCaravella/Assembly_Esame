.data

p1: .asciz "Dammi il valore di arr["
p2: .asciz "]: "
p3: .asciz "\nIl valore minimo trovato è: "

.align 2
arr: .space 20

.text
.globl main


main:

 la a0, arr
 jal inserisci  

 la a3, arr
 li a1,0
 li a2,4
 jal min_rec 	
 
 mv t3,a0
 
 la a0, p3
 li a7,4
 ecall
 
 mv a0,t3
 li a7,1
 ecall
	
li a7,10
ecall

inserisci: 
mv t0,a0
li t2,5
i:
la a0, p1
li a7, 4
ecall

mv a0,t1
li a7, 1
ecall

la a0, p2
li a7,4
ecall

li a7,5
ecall

sw a0,(t0) 

addi t0,t0, 4
addi t1,t1,1
blt t1, t2, i
jr ra

min_rec: 
addi sp,sp, -20
sw ra,0(sp)
sw s0,4(sp) 
sw s1,8(sp)
sw s2,12(sp)
sw s3,16(sp) 

mv s0,a1# from
mv s1,a2# to

bne s0,s1,trova_min1
returnArrFrom:
slli t0,s0, 2
add t0, a3, t0
#
lw a0,(t0)
j returnarr 
trova_min1:
add s2,s0,s1
srai  s2,s2,1
mv a1, s0
mv a2,s2
jal min_rec
mv s3,a0
addi s2,s2,1
mv a1,s2
mv a2,s1
jal min_rec
bgt s3,a0,returnarr 
mv a0,s3
returnarr:
lw ra,(sp) 
lw s0,4(sp) 
lw s1,8(sp) 
lw s2,12(sp)
lw s3,16(sp)

addi sp,sp, 20
jr ra