; RUN: llc -O3 < %s -march=cpu0 -mcpu=cpu032II | FileCheck %s --check-prefix=CHECK

; We first check loads, for all sizes from i8 to i64.
; We also vary orderings to check for barriers.
define i8 @load_i8_unordered(i8* %mem) {
; CHECK-LABEL: load_i8_unordered
; CHECK: ll
; CHECK: sc
; CHECK-NOT: sync
  %val = load atomic i8, i8* %mem unordered, align 1
  ret i8 %val
}
define i16 @load_i16_monotonic(i16* %mem) {
; CHECK-LABEL: load_i16_monotonic
; CHECK: ll
; CHECK: sc
; CHECK-NOT: sync
  %val = load atomic i16, i16* %mem monotonic, align 2
  ret i16 %val
}
define i32 @load_i32_acquire(i32* %mem) {
; CHECK-LABEL: load_i32_acquire
; CHECK: ll
; CHECK: sc
  %val = load atomic i32, i32* %mem acquire, align 4
; CHECK: sync
  ret i32 %val
}
define i64 @load_i64_seq_cst(i64* %mem) {
; CHECK-LABEL: load_i64_seq_cst
; CHECK: sync
  %val = load atomic i64, i64* %mem seq_cst, align 8
  ret i64 %val
}

; Stores
define void @store_i8_unordered(i8* %mem) {
; CHECK-LABEL: store_i8_unordered
; CHECK-NOT: sync
; CHECK: ll
; CHECK: sc
  store atomic i8 42, i8* %mem unordered, align 1
  ret void
}
define void @store_i16_monotonic(i16* %mem) {
; CHECK-LABEL: store_i16_monotonic
; CHECK-NOT: sync
; CHECK: ll
; CHECK: sc
  store atomic i16 42, i16* %mem monotonic, align 2
  ret void
}
define void @store_i32_release(i32* %mem) {
; CHECK-LABEL: store_i32_release
; CHECK: sync
; CHECK: ll
; CHECK: sc
  store atomic i32 42, i32* %mem release, align 4
  ret void
}
define void @store_i64_seq_cst(i64* %mem) {
; CHECK-LABEL: store_i64_seq_cst
; CHECK: sync
  store atomic i64 42, i64* %mem seq_cst, align 8
  ret void
}

; Atomic CmpXchg
define i8 @cas_strong_i8_sc_sc(i8* %mem) {
; CHECK-LABEL: cas_strong_i8_sc_sc
; CHECK: sync
; CHECK: ll
; CHECK: sc
  %val = cmpxchg i8* %mem, i8 0, i8 1 seq_cst seq_cst
; CHECK: sync
  %loaded = extractvalue { i8, i1} %val, 0
  ret i8 %loaded
}
define i16 @cas_weak_i16_acquire_acquire(i16* %mem) {
; CHECK-LABEL: cas_weak_i16_acquire_acquire
; CHECK: ll
; CHECK: sc
  %val = cmpxchg weak i16* %mem, i16 0, i16 1 acquire acquire
; CHECK: sync
  %loaded = extractvalue { i16, i1} %val, 0
  ret i16 %loaded
}
define i32 @cas_strong_i32_acqrel_acquire(i32* %mem) {
; CHECK-LABEL: cas_strong_i32_acqrel_acquire
; CHECK: sync
; CHECK: ll
; CHECK: sc
  %val = cmpxchg i32* %mem, i32 0, i32 1 acq_rel acquire
; CHECK: sync
  %loaded = extractvalue { i32, i1} %val, 0
  ret i32 %loaded
}
define i64 @cas_weak_i64_release_monotonic(i64* %mem) {
; CHECK-LABEL: cas_weak_i64_release_monotonic
; CHECK: sync
  %val = cmpxchg weak i64* %mem, i64 0, i64 1 release monotonic
  %loaded = extractvalue { i64, i1} %val, 0
  ret i64 %loaded
}

; AtomicRMW
define i8 @add_i8_monotonic(i8* %mem, i8 %operand) {
; CHECK-LABEL: add_i8_monotonic
; CHECK: ll
; CHECK: sc
  %val = atomicrmw add i8* %mem, i8 %operand monotonic
  ret i8 %val
}
define i16 @xor_i16_seq_cst(i16* %mem, i16 %operand) {
; CHECK-LABEL: xor_i16_seq_cst
; CHECK: sync
; CHECK: ll
; CHECK: sc
  %val = atomicrmw xor i16* %mem, i16 %operand seq_cst
; CHECK: sync
  ret i16 %val
}
define i32 @xchg_i32_acq_rel(i32* %mem, i32 %operand) {
; CHECK-LABEL: xchg_i32_acq_rel
; CHECK: sync
; CHECK: ll
  %val = atomicrmw xchg i32* %mem, i32 %operand acq_rel
; CHECK: sync
  ret i32 %val
}
define i64 @and_i64_release(i64* %mem, i64 %operand) {
; CHECK-LABEL: and_i64_release
; CHECK: sync
  %val = atomicrmw and i64* %mem, i64 %operand release
  ret i64 %val
}
