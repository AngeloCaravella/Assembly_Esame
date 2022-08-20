.data
str:	.asciz	"Dammi una stringa (max 20 caratteri): \n"
out:	.asciz	"Stringa modificata: \n"
error:	.asciz	"Errore\n"
vocali:	.asciz	"aeiou"
.text
.globl main
main:
	
	la	a0,str
	li	a7,4
	ecall
	
	addi	sp,sp,-20
	mv	a0,sp
	li	a1,50
	li	a7,8
	ecall
	
	mv	a0,sp
	jal	check
	
	mv	a0,sp
	jal	vocal_upper
	
	la	a0,out
	li	a7,4
	ecall
	
	mv	a0,sp
	li	a7,4
	ecall
	
	addi	sp,sp,20
	li	a7,10
	ecall
		
	check:
	li	t6,21		#uno in più per il carattere di terminazione
	li	t3,0		
	mv	t0,a0
	lp:
		lb	t1,(t0)
		beqz	t1,return
		beq	t3,t6,main
		addi	t3,t3,1
		addi	t0,t0,1
		j	lp
		
	vocal_upper:
		mv	t0,a0
		loop:
			lbu	t2,(t0)
			beqz	t2,return
			
			la	t1,vocali
			loop2:
			lbu	t3,(t1)
			beqz	t3,incrementa
			addi	t1,t1,1
			beq	t3,t2,upper
			j	loop2
			
			
		incrementa:
			addi	t0,t0,1
			j	loop
			
		upper:
			addi	t2,t2,-32
			sb	t2,(t0)
			j	loop		
				
	return:
		jr	ra
