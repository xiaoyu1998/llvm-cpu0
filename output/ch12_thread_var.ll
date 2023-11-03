; ModuleID = 'ch12_thread_var.bc'
source_filename = "input/ch12_thread_var.cpp"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

$_ZTW1b = comdat any

@a = dso_local thread_local global i32 0, align 4
@b = dso_local thread_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone mustprogress
define dso_local i32 @_Z15test_thread_varv() #0 {
entry:
  store i32 2, i32* @a, align 4
  %0 = load i32, i32* @a, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind optnone mustprogress
define dso_local i32 @_Z17test_thread_var_2v() #0 {
entry:
  store i32 3, i32* @b, align 4
  %0 = load i32, i32* @b, align 4
  ret i32 %0
}

; Function Attrs: noinline
define weak_odr hidden i32* @_ZTW1b() #1 comdat {
  ret i32* @b
}

attributes #0 = { noinline nounwind optnone mustprogress "disable-tail-calls"="f
alse" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width
"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="fals
e" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-
buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2,-noabicall
s" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline "disable-tail-calls"="false" "frame-pointer"="all" "l
ess-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "
no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buff
er-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2,-noabicalls" "
unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
