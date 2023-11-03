; ModuleID = 'loop-unroll.ll'
source_filename = "loop-unroll.c"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local void @loop_unroll(i32* %a, i32* %b, i32* %c) local_unnamed_addr #0 {
entry:
  %a.addr = alloca i32*, align 4
  %b.addr = alloca i32*, align 4
  %c.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 4
  store i32* %b, i32** %b.addr, align 4
  store i32* %c, i32** %c.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %a.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %1, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32*, i32** %b.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i32 %5
  %6 = load i32, i32* %arrayidx1, align 4
  %add = add nsw i32 %3, %6
  %7 = load i32*, i32** %c.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i32 %8
  store i32 %add, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !2

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind optnone "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
