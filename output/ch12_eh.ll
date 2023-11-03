; ModuleID = 'ch12_eh.bc'
source_filename = "input/ch12_eh.cpp"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%class.Ex1 = type { i8 }

$_ZTS3Ex1 = comdat any

$_ZTI3Ex1 = comdat any

@_ZTVN10__cxxabiv117__class_type_infoE = external dso_local global i8*
@_ZTS3Ex1 = linkonce_odr dso_local constant [5 x i8] c"3Ex1\00", comdat, align 1
@_ZTI3Ex1 = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** get
elementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i32 2) to
 i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTS3Ex1, i32 0, i32 0) 
}, comdat, align 4

; Function Attrs: noinline optnone mustprogress
define dso_local void @_Z15throw_exceptionii(i32 signext %a, i32 signext %b) #0 
{
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %ex1 = alloca %class.Ex1, align 1
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %exception = call i8* @__cxa_allocate_exception(i32 1) #1
  %2 = bitcast i8* %exception to %class.Ex1*
  call void @__cxa_throw(i8* %exception, i8* bitcast ({ i8*, i8* }* @_ZTI3Ex1 to
 i8*), i8* null) #2
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare dso_local i8* @__cxa_allocate_exception(i32)

declare dso_local void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: noinline optnone mustprogress
define dso_local i32 @_Z14test_try_catchv() #0 personality i8* bitcast (i32 (...
)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca i32, align 4
  %exn.slot = alloca i8*, align 4
  %ehselector.slot = alloca i32, align 4
  invoke void @_Z15throw_exceptionii(i32 signext 2, i32 signext 1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  br label %try.cont

lpad:                                             ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  store i8* %1, i8** %exn.slot, align 4
  %2 = extractvalue { i8*, i32 } %0, 1
  store i32 %2, i32* %ehselector.slot, align 4
  br label %catch

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 4
  %3 = call i8* @__cxa_begin_catch(i8* %exn) #1
  store i32 1, i32* %retval, align 4
  call void @__cxa_end_catch()
  br label %return

try.cont:                                         ; preds = %invoke.cont
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %try.cont, %catch
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

declare dso_local i32 @__gxx_personality_v0(...)

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @__cxa_end_catch()

attributes #0 = { noinline optnone mustprogress "disable-tail-calls"="false" "fr
ame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no
-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-si
gned-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-si
ze"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2,-noabicalls" "unsaf
e-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1"}
