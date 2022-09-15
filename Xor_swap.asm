.data



.text


.globl main



main: 

li a7,5
ecall
mv a1,a0

li a7,5
ecall
mv a2,a0

xor a1,a1,a2
xor a2,a1,a2
xor a1,a1,a2

mv a0,a1
li a7,1
ecall

mv a0,a2
li a7,1
ecall

li a7,10
ecall
