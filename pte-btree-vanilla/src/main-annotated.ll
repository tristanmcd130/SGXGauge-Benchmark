; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }

@stderr = external global ptr, align 8, !sec !{!"public"}
@.str = private unnamed_addr constant [22 x i8] c"SECUREFS_TIME %lu us\0A\00", align 1, !sec !{!"public"}
@.str.1 = private unnamed_addr constant [23 x i8] c"Total time: %zu.%03zu\0A\00", align 1, !sec !{!"public"}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !sec !{!"public", !"public", !{!"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca i32, align 4, !sec !{!"public"}
  %argc.addr = alloca i32, align 4, !sec !{!"public"}
  %argv.addr = alloca ptr, align 8, !sec !{!"public"}
  %tstart = alloca %struct.timeval, align 8, !sec !{!"public"}
  %tend = alloca %struct.timeval, align 8, !sec !{!"public"}
  %stop = alloca %struct.timeval, align 8, !sec !{!"public"}
  %start = alloca %struct.timeval, align 8, !sec !{!"public"}
  store i32 0, ptr %retval, align 4, !sec !{!"public", !"public"}
  store i32 %argc, ptr %argc.addr, align 4, !sec !{!"public", !"public"}
  store ptr %argv, ptr %argv.addr, align 8, !sec !{!"public", !"public"}
  %call = call i32 @gettimeofday(ptr noundef %tstart, ptr noundef null) #3, !sec !{!"call", !"public", !{!"public", !"public"}}
  %call1 = call i32 @gettimeofday(ptr noundef %start, ptr noundef null) #3, !sec !{!"call", !"public", !{!"public", !"public"}}
  %call2 = call i32 (...) @real_main(), !sec !{!"call", !"public", !{}}
  %call3 = call i32 @gettimeofday(ptr noundef %stop, ptr noundef null) #3, !sec !{!"call", !"public", !{!"public", !"public"}}
  %0 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %tv_sec = getelementptr inbounds %struct.timeval, ptr %stop, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %1 = load i64, ptr %tv_sec, align 8, !sec !{!"public", !"public"}
  %tv_sec4 = getelementptr inbounds %struct.timeval, ptr %start, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load i64, ptr %tv_sec4, align 8, !sec !{!"public", !"public"}
  %sub = sub nsw i64 %1, %2, !sec !{!"public"}
  %mul = mul nsw i64 %sub, 1000000, !sec !{!"public"}
  %tv_usec = getelementptr inbounds %struct.timeval, ptr %stop, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %3 = load i64, ptr %tv_usec, align 8, !sec !{!"public", !"public"}
  %add = add nsw i64 %mul, %3, !sec !{!"public"}
  %tv_usec5 = getelementptr inbounds %struct.timeval, ptr %start, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load i64, ptr %tv_usec5, align 8, !sec !{!"public", !"public"}
  %sub6 = sub nsw i64 %add, %4, !sec !{!"public"}
  %call7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str, i64 noundef %sub6), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %call8 = call i32 @gettimeofday(ptr noundef %tend, ptr noundef null) #3, !sec !{!"call", !"public", !{!"public", !"public"}}
  %tv_sec9 = getelementptr inbounds %struct.timeval, ptr %tend, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load i64, ptr %tv_sec9, align 8, !sec !{!"public", !"public"}
  %tv_sec10 = getelementptr inbounds %struct.timeval, ptr %tstart, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load i64, ptr %tv_sec10, align 8, !sec !{!"public", !"public"}
  %sub11 = sub nsw i64 %5, %6, !sec !{!"public"}
  %tv_usec12 = getelementptr inbounds %struct.timeval, ptr %tend, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load i64, ptr %tv_usec12, align 8, !sec !{!"public", !"public"}
  %tv_usec13 = getelementptr inbounds %struct.timeval, ptr %tstart, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load i64, ptr %tv_usec13, align 8, !sec !{!"public", !"public"}
  %sub14 = sub nsw i64 %7, %8, !sec !{!"public"}
  %div = sdiv i64 %sub14, 1000, !sec !{!"public"}
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i64 noundef %sub11, i64 noundef %div), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  ret i32 0, !sec !{!"public"}
}

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public"}} i32 @gettimeofday(ptr noundef, ptr noundef) #1

declare !sec !{!"public", !"public", !{}} i32 @real_main(...) #2

declare !sec !{!"public", !"public", !{!"public", !"public", !"..."}} i32 @fprintf(ptr noundef, ptr noundef, ...) #2

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
