.text 
input_array:
	addi sp sp -4
 	sw ra (sp)
 	
      	li t2 1 # store index
      	while_read:
      	li a7 5 # read number
      	ecall
      	sw a0 (t1)
      	addi t1 t1 4
      	addi t2 t2 1
      	bleu t2 t0 while_read
 	
 	lw ra (sp)
  	addi sp sp 4
  	ret