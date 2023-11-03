; ModuleID = 'loop-unroll.c'
source_filename = "loop-unroll.c"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nofree norecurse nounwind
define dso_local void @loop_unroll(i32* nocapture readonly %a, i32* nocapture readonly %b, i32* nocapture %c) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* %a, align 4, !tbaa !2
  %1 = load i32, i32* %b, align 4, !tbaa !2
  %add = add nsw i32 %1, %0
  store i32 %add, i32* %c, align 4, !tbaa !2
  %arrayidx.1 = getelementptr inbounds i32, i32* %a, i32 1
  %2 = load i32, i32* %arrayidx.1, align 4, !tbaa !2
  %arrayidx1.1 = getelementptr inbounds i32, i32* %b, i32 1
  %3 = load i32, i32* %arrayidx1.1, align 4, !tbaa !2
  %add.1 = add nsw i32 %3, %2
  %arrayidx2.1 = getelementptr inbounds i32, i32* %c, i32 1
  store i32 %add.1, i32* %arrayidx2.1, align 4, !tbaa !2
  %arrayidx.2 = getelementptr inbounds i32, i32* %a, i32 2
  %4 = load i32, i32* %arrayidx.2, align 4, !tbaa !2
  %arrayidx1.2 = getelementptr inbounds i32, i32* %b, i32 2
  %5 = load i32, i32* %arrayidx1.2, align 4, !tbaa !2
  %add.2 = add nsw i32 %5, %4
  %arrayidx2.2 = getelementptr inbounds i32, i32* %c, i32 2
  store i32 %add.2, i32* %arrayidx2.2, align 4, !tbaa !2
  %arrayidx.3 = getelementptr inbounds i32, i32* %a, i32 3
  %6 = load i32, i32* %arrayidx.3, align 4, !tbaa !2
  %arrayidx1.3 = getelementptr inbounds i32, i32* %b, i32 3
  %7 = load i32, i32* %arrayidx1.3, align 4, !tbaa !2
  %add.3 = add nsw i32 %7, %6
  %arrayidx2.3 = getelementptr inbounds i32, i32* %c, i32 3
  store i32 %add.3, i32* %arrayidx2.3, align 4, !tbaa !2
  %arrayidx.4 = getelementptr inbounds i32, i32* %a, i32 4
  %8 = load i32, i32* %arrayidx.4, align 4, !tbaa !2
  %arrayidx1.4 = getelementptr inbounds i32, i32* %b, i32 4
  %9 = load i32, i32* %arrayidx1.4, align 4, !tbaa !2
  %add.4 = add nsw i32 %9, %8
  %arrayidx2.4 = getelementptr inbounds i32, i32* %c, i32 4
  store i32 %add.4, i32* %arrayidx2.4, align 4, !tbaa !2
  ret void
}

attributes #0 = { nofree norecurse nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
