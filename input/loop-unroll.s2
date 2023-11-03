	.text
	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.text
	.file	"loop-unroll.c"
	.globl	loop_unroll                     # -- Begin function loop_unroll
	.p2align	2
	.type	loop_unroll,@function
	.set	nomicromips
	.set	nomips16
	.ent	loop_unroll
loop_unroll:                            # @loop_unroll
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:                                # %entry
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 12($fp)
	sw	$5, 8($fp)
	sw	$6, 4($fp)
	addiu	$1, $zero, 0
	sw	$zero, 0($fp)
$BB0_1:                                 # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	$1, 0($fp)
	addiu	$2, $zero, 5
	slt	$1, $1, $2
	bgtz	$1, $BB0_3
	nop
# %bb.2:                                # %for.cond
	b	$BB0_5
	nop
$BB0_3:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	$1, 12($fp)
	lw	$2, 0($fp)
	sll	$2, $2, 2
	addu	$1, $1, $2
	lw	$1, 0($1)
	lw	$2, 8($fp)
	lw	$3, 0($fp)
	sll	$3, $3, 2
	addu	$2, $2, $3
	lw	$2, 0($2)
	addu	$1, $1, $2
	lw	$2, 4($fp)
	lw	$3, 0($fp)
	sll	$3, $3, 2
	addu	$2, $2, $3
	sw	$1, 0($2)
# %bb.4:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	$1, 0($fp)
	addiu	$2, $zero, 1
	addu	$1, $1, $2
	b	$BB0_1
	sw	$1, 0($fp)
$BB0_5:                                 # %for.end
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	loop_unroll
$func_end0:
	.size	loop_unroll, ($func_end0)-loop_unroll
                                        # -- End function
	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
	.text
