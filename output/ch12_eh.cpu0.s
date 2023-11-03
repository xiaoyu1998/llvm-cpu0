  .text
  .section .mdebug.abiO32
  .previous
  .file  "ch12_eh.cpp"
  .globl  _Z15throw_exceptionii           # -- Begin function _Z15throw_exceptio
nii
  .p2align  1
  .type  _Z15throw_exceptionii,@function
  .ent  _Z15throw_exceptionii           # @_Z15throw_exceptionii
_Z15throw_exceptionii:
  .cfi_startproc
  .frame  $fp,40,$lr
  .mask   0x00005000,-4
  .set  noreorder
  .set  nomacro
# %bb.0:                                # %entry
  addiu  $sp, $sp, -40
  .cfi_def_cfa_offset 40
  st  $lr, 36($sp)                    # 4-byte Folded Spill
  st  $fp, 32($sp)                    # 4-byte Folded Spill
  .cfi_offset 14, -4
  .cfi_offset 12, -8
  move  $fp, $sp
  .cfi_def_cfa_register 12
  st  $4, 28($fp)
  st  $5, 24($fp)
  ld  $2, 28($fp)
  ld  $3, 24($fp)
  cmp  $sw, $2, $3
  jle  $sw, $BB0_2
  nop
# %bb.1:                                # %if.then
  addiu  $4, $zero, 1
  jsub  __cxa_allocate_exception
  nop
  addu  $4, $zero, $2
  addiu  $2, $zero, 0
  st  $2, 8($sp)
  lui  $2, %hi(_ZTI3Ex1)
  ori  $5, $2, %lo(_ZTI3Ex1)
  jsub  __cxa_throw
  nop
$BB0_2:                                 # %if.end
  move  $sp, $fp
  ld  $fp, 32($sp)                    # 4-byte Folded Reload
  ld  $lr, 36($sp)                    # 4-byte Folded Reload
  addiu  $sp, $sp, 40
  ret  $lr
  nop
  .set  macro
  .set  reorder
  .end  _Z15throw_exceptionii
$func_end0:
  .size  _Z15throw_exceptionii, ($func_end0)-_Z15throw_exceptionii
  .cfi_endproc
                                        # -- End function
  .globl  _Z14test_try_catchv             # -- Begin function _Z14test_try_catch
v
  .p2align  1
  .type  _Z14test_try_catchv,@function
  .ent  _Z14test_try_catchv             # @_Z14test_try_catchv
_Z14test_try_catchv:
$tmp3:
.set $func_begin0, ($tmp3)
  .cfi_startproc
  .cfi_personality 0, __gxx_personality_v0
  .cfi_lsda 0, $exception0
  .frame  $fp,32,$lr
  .mask   0x00005000,-4
  .set  noreorder
  .set  nomacro
# %bb.0:                                # %entry
  addiu  $sp, $sp, -32
  .cfi_def_cfa_offset 32
  st  $lr, 28($sp)                    # 4-byte Folded Spill
  st  $fp, 24($sp)                    # 4-byte Folded Spill
  .cfi_offset 14, -4
  .cfi_offset 12, -8
  move  $fp, $sp
  .cfi_def_cfa_register 12
$tmp0:
  addiu  $4, $zero, 2
  addiu  $5, $zero, 1
  jsub  _Z15throw_exceptionii
  nop
$tmp1:
# %bb.1:                                # %invoke.cont
  jmp  $BB1_4
$BB1_2:                                 # %lpad
$tmp2:
  st  $4, 16($fp)
  st  $5, 12($fp)
# %bb.3:                                # %catch
  ld  $4, 16($fp)
  jsub  __cxa_begin_catch
  nop
  addiu  $2, $zero, 1
  st  $2, 20($fp)
  jsub  __cxa_end_catch
  nop
  jmp  $BB1_5
$BB1_4:                                 # %try.cont
  addiu  $2, $zero, 0
  st  $2, 20($fp)
$BB1_5:                                 # %return
  ld  $2, 20($fp)
  move  $sp, $fp
  ld  $fp, 24($sp)                    # 4-byte Folded Reload
  ld  $lr, 28($sp)                    # 4-byte Folded Reload
  addiu  $sp, $sp, 32
  ret  $lr
  nop
  .set  macro
  .set  reorder
  .end  _Z14test_try_catchv
$func_end1:
  .size  _Z14test_try_catchv, ($func_end1)-_Z14test_try_catchv
  .cfi_endproc
  .section  .gcc_except_table,"a",@progbits
  .p2align  2
GCC_except_table1:
$exception0:
  .byte  255                             # @LPStart Encoding = omit
  .byte  0                               # @TType Encoding = absptr
  .uleb128 ($ttbase0)-($ttbaseref0)
$ttbaseref0:
  .byte  1                               # Call site Encoding = uleb128
  .uleb128 ($cst_end0)-($cst_begin0)
$cst_begin0:
  .uleb128 ($tmp0)-($func_begin0)         # >> Call Site 1 <<
  .uleb128 ($tmp1)-($tmp0)                #   Call between $tmp0 and $tmp1
  .uleb128 ($tmp2)-($func_begin0)         #     jumps to $tmp2
  .byte  1                               #   On action: 1
  .uleb128 ($tmp1)-($func_begin0)         # >> Call Site 2 <<
  .uleb128 ($func_end1)-($tmp1)           #   Call between $tmp1 and $func_end1
  .byte  0                               #     has no landing pad
  .byte  0                               #   On action: cleanup
$cst_end0:
  .byte  1                               # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
  .byte  0                               #   No further actions
  .p2align  2
                                        # >> Catch TypeInfos <<
  .4byte  0                               # TypeInfo 1
$ttbase0:
  .p2align  2
                                        # -- End function
  .type  _ZTS3Ex1,@object                # @_ZTS3Ex1
  .section  .rodata._ZTS3Ex1,"aG",@progbits,_ZTS3Ex1,comdat
  .weak  _ZTS3Ex1
_ZTS3Ex1:
  .asciz  "3Ex1"
  .size  _ZTS3Ex1, 5

  .type  _ZTI3Ex1,@object                # @_ZTI3Ex1
  .section  .rodata._ZTI3Ex1,"aG",@progbits,_ZTI3Ex1,comdat
  .weak  _ZTI3Ex1
  .p2align  2
_ZTI3Ex1:
  .4byte  _ZTVN10__cxxabiv117__class_type_infoE+8
  .4byte  _ZTS3Ex1
  .size  _ZTI3Ex1, 8

  .ident  "clang version 12.0.1"
  .section  ".note.GNU-stack","",@progbits
