; RUN: llc  -march=cpu0el -mcpu=cpu032II -relocation-model=pic -O3 < %s | FileCheck %s -check-prefix=16

@x = global i32 65504, align 4
@y = global i32 60929, align 4
@.str = private unnamed_addr constant [7 x i8] c"%08x \0A\00", align 1

define i32 @main() nounwind {
entry:
  %0 = load i32, i32* @x, align 4
  %neg = xor i32 %0, -1
; 16:	nor ${{[0-9]+|t9}}, ${{[0-9]+|t9}}, $zero
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %neg)
  ret i32 0
}

declare i32 @printf(i8*, ...)
