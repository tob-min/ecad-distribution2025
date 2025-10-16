.macro DEBUG_PRINT reg
csrw 0x800, \reg
.endm
	
.text
.global div              # Export the symbol 'div' so we can call it from other files
.type div, @function
div:
    addi sp, sp, -32     # Allocate stack space

    # store any callee-saved register you might overwrite
    sw   ra, 28(sp)      # Function calls would overwrite
    sw   s0, 24(sp)      # If t0-t6 is not enough, can use s0-s11 if I save and restore them
    # ...

    # do your work
    # example of printing inputs a0 and a1

    li t0, 0		# Q
    li t1, 0		# R
    beqz a1, end 	# If a1 is zero just return 0

    li t2, 32		# i
    li t5, 1		# one
    loop:

	sub t2, t2, t5		# decrement i
	# DEBUG_PRINT t2
	blt t2, zero, end	# end of loop
	sll t1, t1, t5		# left shift R by 1

	# get ith bit of numerator
	srl t4, a0, t2 
	and t4, t4, t5
	
	# set oth bit of R to t4
	andi t1, t1, 0xfffffffe
	or t1, t1, t4

	blt t1, a1, loop	# go to start of loop if R < D

	sub t1, t1, a1		# R := R - D
	sll t6, t5, t2
	or t0, t0, t6
  	j loop
    end:
        mv a0, t0
        mv a1, t1

    # load every register you stored above
    lw   ra, 28(sp)
    lw   s0, 24(sp)
    # ...
    addi sp, sp, 32      # Free up stack space
    ret
#
