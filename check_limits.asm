.text
 check_limits:
 	# checking if array size is ok (from 1 to 10)
 	# returns 1 (true) if input is ok, 0 (false) if intput is out of range
 	# return value - array A size - is in a0 register
 	
 	addi sp sp -4
 	sw ra (sp)
 	
 	mv t0 a0 # array A size is in t0 now
 	li a0 1 # function return value now is true
 	
 	# do checking
 	li a2 0
 	ble t0 a2 incorrect_size_check
 	
 	li a2 10
 	bgt t0 a2 incorrect_size_check
 	
 	j end_size_check
 	
 	incorrect_size_check:
 	li a0 0
 	
 	end_size_check:
 	# renew stack
 	lw ra (sp)
 	addi sp sp 4
 	ret