.data
array:  .word  10

.include	"macrolib.s"

.text
	print_str("Enter size of an array (from 1 to 10):")
	newline
	read_int(a0)
	
	la t1 array
      	
      	#check if array size is ok
      	jal check_limits
      	
      	# check function return 
      	li a1 1
      	beq a0 a1 correct_size
      	
      	incorrect_size: 
      	print_str("Oops, wrong size of an array!")
      	j end_programm
      	
      	correct_size:
      	print_str("Input array values: ")
      	newline
      	jal input_array
      	
      	mv t3 t0
      	la t0 array
      	jal get_sum
      	
      	li a1 0
      	beq a0 a1 overflow
      	li a1 1
      	beq a0 a1 result
      	
      	overflow: # if all conditions passed, overflow detected
      	print_str("There is an overflow! sum of first ")
      	print_int(t4)
      	print_str(" elements = ")
      	print_int(t5)
      	j end_programm
      	
      	result:
      	print_str("Sum of elements = ")
      	print_int(t5)
      	
      	
	 # exit programm
	end_programm:
	li a7 10 
      	ecall

         
.include	"check_limits.asm"
.include	"input_array.asm"  
.include	"get_sum.asm"   
