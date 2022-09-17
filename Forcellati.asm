###########################################data segment#####################################
.data
prompt_in: .asciz "Inserire una stringa: "
prompt_out1: .asciz "La stringa è palindroma"
prompt_out2: .asciz "la stringa non è palindroma"

#########################################code segment############################
.text
.globl main

main:
      addi sp,sp,-30
      
      la a0,prompt_in
      li a7,4
      ecall
      
      mv a0,sp########PRIMA MODIFICA :SP DEVE ESSERE CARICATO SU A0 
      li a1,29
      li a7,8
      ecall
      
      mv a0,sp
      jal palindroma
      
      mv a0,sp
      jal verifica
      
      mv a0,sp
      addi sp,sp,30
      
      li a7,10
      ecall
      
######################################fine main######################################################‡

palindroma: 

strlen:

       mv t0,a0
       mv t6,a0
       li t1,0  #i=0
       
       loop_strlen:
       lbu t2,(t0)
       
       beqz  t2,finelunghezza
       addi t0,t0,1
       addi t1,t1,1
       j loop_strlen
       finelunghezza:
       addi t1,t1,-2	##SECONDA MODIFICA T1 VA DECREMENTATO DI 2 PERCHE' LA LUNGHEZZA EFFETTIVA VA CONTATA SENZA IL CARATTERTE DI TERMINAZIONE
       mv a1,t1
       jr ra
verifica:
	mv t1,a1 #passo la lunghezza
	mv t0,a0
	
	mv t3,t0 #punta all'inzio
	mv t2,t0
	add t2,t2,t1 #punta alla fine  ###
	
	li t4, 2
	div t1,t1,t4
	
	i: 
	beqz t1, trovato
	lbu t4,(t3)
	lbu t5,(t2) 
	
	addi t3,t3,1
	addi t2,t2,-1
	addi t1,t1,-1
	beq t4,t5,i
	 
     la a0,prompt_out2
     li a7,4
     ecall
     
     jr ra
            
trovato:
     la a0,prompt_out1
     li a7,4
     ecall 
     
     jr ra                                                                

            