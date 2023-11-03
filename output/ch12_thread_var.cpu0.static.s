  .text
  .section .mdebug.abiO32
  .previous
  .file  "ch12_thread_var.cpp"
  .globl  _Z15test_thread_varv            # -- Begin function _Z15test_thread_va
rv
  .p2align  1
  .type  _Z15test_thread_varv,@function
  .ent  _Z15test_thread_varv            # @_Z15test_thread_varv
_Z15test_thread_varv:
  .frame  $fp,8,$lr
  .mask   0x00001000,-4
  .set  noreorder
  .set  nomacro
# %bb.0:                                # %entry
  addiu  $sp, $sp, -8
  st  $fp, 4($sp)                     # 4-byte Folded Spill
  move  $fp, $sp
  lui  $2, %tp_hi(a)
  ori  $2, $2, %tp_lo(a)
  addiu  $3, $zero, 2
  st  $3, 0($2)
  ld  $2, 0($2)
  move  $sp, $fp
  ld  $fp, 4($sp)                     # 4-byte Folded Reload
  addiu  $sp, $sp, 8
  ret  $lr
  nop
  .set  macro
  .set  reorder
  .end  _Z15test_thread_varv
$func_end0:
  .size  _Z15test_thread_varv, ($func_end0)-_Z15test_thread_varv
                                        # -- End function
  .globl  _Z17test_thread_var_2v          # -- Begin function _Z17test_thread_va
r_2v
  .p2align  1
  .type  _Z17test_thread_var_2v,@function
  .ent  _Z17test_thread_var_2v          # @_Z17test_thread_var_2v
_Z17test_thread_var_2v:
  .frame  $fp,8,$lr
  .mask   0x00001000,-4
  .set  noreorder
  .set  nomacro
# %bb.0:                                # %entry
  addiu  $sp, $sp, -8
  st  $fp, 4($sp)                     # 4-byte Folded Spill
  move  $fp, $sp
  lui  $2, %tp_hi(b)
  ori  $2, $2, %tp_lo(b)
  addiu  $3, $zero, 3
  st  $3, 0($2)
  ld  $2, 0($2)
  move  $sp, $fp
  ld  $fp, 4($sp)                     # 4-byte Folded Reload
  addiu  $sp, $sp, 8
  ret  $lr
  nop
  .set  macro
  .set  reorder
  .end  _Z17test_thread_var_2v
$func_end1:
  .size  _Z17test_thread_var_2v, ($func_end1)-_Z17test_thread_var_2v
                                        # -- End function
  .section  .text._ZTW1b,"axG",@progbits,_ZTW1b,comdat
  .hidden  _ZTW1b                          # -- Begin function _ZTW1b
  .weak  _ZTW1b
  .p2align  1
  .type  _ZTW1b,@function
  .ent  _ZTW1b                          # @_ZTW1b
_ZTW1b:
  .cfi_startproc
  .frame  $fp,8,$lr
  .mask   0x00001000,-4
  .set  noreorder
  .set  nomacro
# %bb.0:
  addiu  $sp, $sp, -8
  .cfi_def_cfa_offset 8
  st  $fp, 4($sp)                     # 4-byte Folded Spill
  .cfi_offset 12, -4
  move  $fp, $sp
  .cfi_def_cfa_register 12
  lui  $2, %tp_hi(b)
  ori  $2, $2, %tp_lo(b)
  move  $sp, $fp
  ld  $fp, 4($sp)                     # 4-byte Folded Reload
  addiu  $sp, $sp, 8
  ret  $lr
  nop
  .set  macro
  .set  reorder
  .end  _ZTW1b
$func_end2:
  .size  _ZTW1b, ($func_end2)-_ZTW1b
  .cfi_endproc
                                        # -- End function
  .type  a,@object                       # @a
  .section  .tbss,"awT",@nobits
  .globl  a
  .p2align  2
a:
  .4byte  0                               # 0x0
  .size  a, 4

  .type  b,@object                       # @b
  .globl  b
  .p2align  2
b:
  .4byte  0                               # 0x0
  .size  b, 4

  .ident  "clang version 12.0.1"
  .section  ".note.GNU-stack","",@progbits
