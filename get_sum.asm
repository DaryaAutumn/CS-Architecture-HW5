#.include "macrolib.s"

.text
get_sum:  	
	addi sp sp -4
 	sw ra (sp)
 	
 	li a0 1 # (no overflow)
 	
 	#la t0 array
	li t4 0 # store index     
	           
      	while_count:                         
      	lw a1 (t0)
      	add a3 t5 a1 # saved sum
      	
      	bltz a1 overflow_minus # array element positive?
      	bltz t5 overflow_minus # previous sum positive?
      	bge a3 t5 overflow_minus # sum negative?
      	
      	j overflow
      	
      	overflow_minus:
      	bgtz a1 no_overflow # same check for negative overflow
      	bgtz t5 no_overflow
      	ble a3 t5 no_overflow
      	
      	li a0 0 # overflow
      	
      	no_overflow:
      	
      	add t5 t5 a1
      	addi t4 t4 1
      	addi t0 t0 4
      	blt t4 t3 while_count
      	
      	
      	lw ra (sp)
  	addi sp sp 4
  	ret