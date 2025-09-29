; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @license_notice() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef @.str.1), !sec !{!"call", !"public", !{!"public", !"public"}}
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @printf(ptr noundef, ...) #1

define dso_local void @usage_1() #0 !sec !{!"void", !"public", !{}} {
  %1 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %1), !sec !{!"call", !"public", !{!"public", !"public"}}
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !sec !{!"call", !"public", !{!"public"}}
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 3, i32 noundef 20), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_2() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.7), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_3() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !sec !{!"call", !"public", !{!"public"}}
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 3, i32 noundef 20), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  ret void
}

; TODO: should 12 and 17 really be public?
; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enqueue(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"public", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  %3 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %4 = load ptr, ptr @queue, align 8, !sec !{!"private", !"private"}
  %5 = icmp eq ptr %4, null, !sec !{!"private"}
  br i1 %5, label %6, label %10, !sec !{!"private"}

6:                                                ; preds = %1, !sec !{!"private"}
  %7 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  store ptr %7, ptr @queue, align 8
  %8 = load ptr, ptr @queue, align 8, !sec !{!"private", !"private"}
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %9, align 8, !sec !{!"private", !"private"}
  br label %27

10:                                               ; preds = %1, !sec !{!"private"}
  %11 = load ptr, ptr @queue, align 8, !sec !{!"private", !"private"}
  store ptr %11, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %12

12:                                               ; preds = %17, %10, !sec !{!"private"}
  %13 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = icmp ne ptr %15, null, !sec !{!"private"}
  br i1 %16, label %17, label %21, !sec !{!"private"}

17:                                               ; preds = %12, !sec !{!"private"}
  %18 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  %20 = load ptr, ptr %19, align 8, !sec !{!"private", !"private"}
  store ptr %20, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %12, !llvm.loop !6

21:                                               ; preds = %12, !sec !{!"private"}
  %22 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %22, ptr %24, align 8, !sec !{!"private", !"private"}
  %25 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %26, align 8, !sec !{!"private", !"private"}
  br label %27

27:                                               ; preds = %21, %6, !sec !{!"private"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dequeue() #0 !sec !{!"public", !"public", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"public"}
  %2 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr %1, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  store ptr %5, ptr @queue, align 8
  %6 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %7, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  ret ptr %8, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_leaves(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"nonsec"}} {
  %2 = alloca ptr, align 8, !sec !{!"public"}
  %3 = alloca i64, align 8, !sec !{!"public"}
  %4 = alloca ptr, align 8, !sec !{!"public"}
  store ptr %0, ptr %2, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %2, align 8, !sec !{!"public", !"public"}
  %6 = icmp eq ptr %5, null, !sec !{!"public"}
  br i1 %6, label %7, label %9, !sec !{!"public"}

7:                                                ; preds = %1, !sec !{!"public"}
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %87

9:                                                ; preds = %1, !sec !{!"public"}
  %10 = load ptr, ptr %2, align 8, !sec !{!"public", !"public"}
  store ptr %10, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %11

11:                                               ; preds = %17, %9, !sec !{!"public"}
  %12 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %14 = load i8, ptr %13, align 8, !sec !{!"public", !"public"}
  %15 = trunc i8 %14 to i1, !sec !{!"public"}
  %16 = xor i1 %15, true, !sec !{!"public"}
  br i1 %16, label %17, label %23, !sec !{!"public"}

17:                                               ; preds = %11, !sec !{!"public"}
  %18 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load ptr, ptr %19, align 8, !sec !{!"public", !"public"}
  %21 = getelementptr inbounds ptr, ptr %20, i64 0, !sec !{!"public", !"public", !"public"}
  %22 = load ptr, ptr %21, align 8, !sec !{!"public", !"public"}
  store ptr %22, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %11, !llvm.loop !8

23:                                               ; preds = %11, !sec !{!"public"}
  br label %24

24:                                               ; preds = %23, %84, !sec !{!"public"}
  store i64 0, ptr %3, align 8, !sec !{!"public", !"public"}
  br label %25

25:                                               ; preds = %50, %24, !sec !{!"public"}
  %26 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %27 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %29 = load i64, ptr %28, align 8, !sec !{!"public", !"public"}
  %30 = icmp ult i64 %26, %29, !sec !{!"public"}
  br i1 %30, label %31, label %53, !sec !{!"public"}

31:                                               ; preds = %25, !sec !{!"public"}
  %32 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %33 = trunc i8 %32 to i1, !sec !{!"public"}
  br i1 %33, label %34, label %42, !sec !{!"public"}

34:                                               ; preds = %31, !sec !{!"public"}
  %35 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %37 = load ptr, ptr %36, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %39 = getelementptr inbounds ptr, ptr %37, i64 %38, !sec !{!"public", !"public", !"public"}
  %40 = load ptr, ptr %39, align 8, !sec !{!"public", !"public"}
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %40), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %42

42:                                               ; preds = %34, %31, !sec !{!"public"}
  %43 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %44 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %45 = load ptr, ptr %44, align 8, !sec !{!"public", !"public"}
  %46 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %47 = getelementptr inbounds i64, ptr %45, i64 %46, !sec !{!"public", !"public", !"public"}
  %48 = load i64, ptr %47, align 8, !sec !{!"public", !"public"}
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %48), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %50

50:                                               ; preds = %42, !sec !{!"public"}
  %51 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %52 = add i64 %51, 1, !sec !{!"public"}
  store i64 %52, ptr %3, align 8, !sec !{!"public", !"public"}
  br label %25, !llvm.loop !9

53:                                               ; preds = %25, !sec !{!"public"}
  %54 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %55 = trunc i8 %54 to i1, !sec !{!"public"}
  br i1 %55, label %56, label %65, !sec !{!"public"}

56:                                               ; preds = %53, !sec !{!"public"}
  %57 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %59 = load ptr, ptr %58, align 8, !sec !{!"public", !"public"}
  %60 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %61 = sub i64 %60, 1, !sec !{!"public"}
  %62 = getelementptr inbounds ptr, ptr %59, i64 %61, !sec !{!"public", !"public", !"public"}
  %63 = load ptr, ptr %62, align 8, !sec !{!"public", !"public"}
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %63), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %65

65:                                               ; preds = %56, %53, !sec !{!"public"}
  %66 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %67 = getelementptr inbounds %struct.node, ptr %66, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %68 = load ptr, ptr %67, align 8, !sec !{!"public", !"public"}
  %69 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %70 = sub i64 %69, 1, !sec !{!"public"}
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70, !sec !{!"public", !"public", !"public"}
  %72 = load ptr, ptr %71, align 8, !sec !{!"public", !"public"}
  %73 = icmp ne ptr %72, null, !sec !{!"public"}
  br i1 %73, label %74, label %83, !sec !{!"public"}

74:                                               ; preds = %65, !sec !{!"public"}
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !sec !{!"call", !"public", !{!"public"}}
  %76 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  %77 = getelementptr inbounds %struct.node, ptr %76, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %78 = load ptr, ptr %77, align 8, !sec !{!"public", !"public"}
  %79 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %80 = sub i64 %79, 1, !sec !{!"public"}
  %81 = getelementptr inbounds ptr, ptr %78, i64 %80, !sec !{!"public", !"public", !"public"}
  %82 = load ptr, ptr %81, align 8, !sec !{!"public", !"public"}
  store ptr %82, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %84

83:                                               ; preds = %65, !sec !{!"public"}
  br label %85

84:                                               ; preds = %74, !sec !{!"public"}
  br label %24

85:                                               ; preds = %83, !sec !{!"public"}
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %87

87:                                               ; preds = %85, %7, !sec !{!"public"}
  ret void
}

; WHILE LOOP WITH PRIVATE CONDITION
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @height(ptr noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  %3 = alloca i64, align 8, !sec !{!"private"}
  %4 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %3, align 8, !sec !{!"private", !"private"}
  %5 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  store ptr %5, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %6

6:                                                ; preds = %12, %1, !sec !{!"private"}
  %7 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %9 = load i8, ptr %8, align 8, !sec !{!"private", !"private"}
  %10 = trunc i8 %9 to i1, !sec !{!"private"}
  %11 = xor i1 %10, true, !sec !{!"private"}
  br i1 %11, label %12, label %20, !sec !{!"private"}

12:                                               ; preds = %6, !sec !{!"private"}
  %13 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = getelementptr inbounds ptr, ptr %15, i64 0, !sec !{!"private", !"private", !"public"}
  %17 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  store ptr %17, ptr %4, align 8, !sec !{!"private", !"private"}
  %18 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %19 = add i64 %18, 1, !sec !{!"private"}
  store i64 %19, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %6, !llvm.loop !10

20:                                               ; preds = %6, !sec !{!"private"}
  %21 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  ret i64 %21, !sec !{!"private"}
}

; WHILE LOOP WITH PRIVATE CONDITION
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @path_to_root(ptr noundef %0, ptr noundef %1) #0 !sec !{!"public", !"public", !{!"public", !"public", !"private", !"private", !"private", !"private", !"private"}} {
  %3 = alloca ptr, align 8, !sec !{!"private"}
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %3, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %5, align 8, !sec !{!"private", !"private"}
  %7 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  store ptr %7, ptr %6, align 8, !sec !{!"private", !"private"}
  br label %8

8:                                                ; preds = %12, %2, !sec !{!"private"}
  %9 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %10 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %11 = icmp ne ptr %9, %10, !sec !{!"private"}
  br i1 %11, label %12, label %18, !sec !{!"private"}

12:                                               ; preds = %8, !sec !{!"private"}
  %13 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  store ptr %15, ptr %6, align 8, !sec !{!"private", !"private"}
  %16 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %17 = add i64 %16, 1, !sec !{!"private"}
  store i64 %17, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %8, !llvm.loop !11

18:                                               ; preds = %8, !sec !{!"private"}
  %19 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  ret i64 %19, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_tree(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"nonsec"}} {
  %2 = alloca ptr, align 8, !sec !{!"public"}
  %3 = alloca ptr, align 8, !sec !{!"public"}
  %4 = alloca i64, align 8, !sec !{!"public"}
  %5 = alloca i64, align 8, !sec !{!"public"}
  %6 = alloca i64, align 8, !sec !{!"public"}
  store ptr %0, ptr %2, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %3, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %4, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %5, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %6, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %2, align 8, !sec !{!"public", !"public"}
  %8 = icmp eq ptr %7, null, !sec !{!"public"}
  br i1 %8, label %9, label %11, !sec !{!"public"}

9:                                                ; preds = %1, !sec !{!"public"}
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %133

11:                                               ; preds = %1, !sec !{!"public"}
  store ptr null, ptr @queue, align 8
  %12 = load ptr, ptr %2, align 8, !sec !{!"public", !"public"}
  call void @enqueue(ptr noundef %12), !sec !{!"call", !"void", !{!"public"}}
  br label %13

13:                                               ; preds = %129, %11, !sec !{!"public"}
  %14 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %15 = icmp ne ptr %14, null, !sec !{!"public"}
  br i1 %15, label %16, label %131, !sec !{!"public"}

16:                                               ; preds = %13, !sec !{!"public"}
  %17 = call ptr @dequeue(), !sec !{!"call", !"public", !{}}
  store ptr %17, ptr %3, align 8, !sec !{!"public", !"public"}
  %18 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load ptr, ptr %19, align 8, !sec !{!"public", !"public"}
  %21 = icmp ne ptr %20, null, !sec !{!"public"}
  br i1 %21, label %22, label %43, !sec !{!"public"}

22:                                               ; preds = %16, !sec !{!"public"}
  %23 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %24 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %26 = load ptr, ptr %25, align 8, !sec !{!"public", !"public"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %28 = load ptr, ptr %27, align 8, !sec !{!"public", !"public"}
  %29 = getelementptr inbounds ptr, ptr %28, i64 0, !sec !{!"public", !"public", !"public"}
  %30 = load ptr, ptr %29, align 8, !sec !{!"public", !"public"}
  %31 = icmp eq ptr %23, %30, !sec !{!"public"}
  br i1 %31, label %32, label %43, !sec !{!"public"}

32:                                               ; preds = %22, !sec !{!"public"}
  %33 = load ptr, ptr %2, align 8, !sec !{!"public", !"public"}
  %34 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %35 = call i64 @path_to_root(ptr noundef %33, ptr noundef %34), !sec !{!"call", !"public", !{!"public", !"public"}}
  store i64 %35, ptr %6, align 8, !sec !{!"public", !"public"}
  %36 = load i64, ptr %6, align 8, !sec !{!"public", !"public"}
  %37 = load i64, ptr %5, align 8, !sec !{!"public", !"public"}
  %38 = icmp ne i64 %36, %37, !sec !{!"public"}
  br i1 %38, label %39, label %42, !sec !{!"public"}

39:                                               ; preds = %32, !sec !{!"public"}
  %40 = load i64, ptr %6, align 8, !sec !{!"public", !"public"}
  store i64 %40, ptr %5, align 8, !sec !{!"public", !"public"}
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %42

42:                                               ; preds = %39, %32, !sec !{!"public"}
  br label %43

43:                                               ; preds = %42, %22, %16, !sec !{!"public"}
  %44 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %45 = trunc i8 %44 to i1, !sec !{!"public"}
  br i1 %45, label %46, label %49, !sec !{!"public"}

46:                                               ; preds = %43, !sec !{!"public"}
  %47 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %47), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %49

49:                                               ; preds = %46, %43, !sec !{!"public"}
  store i64 0, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %50

50:                                               ; preds = %75, %49, !sec !{!"public"}
  %51 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %52 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %54 = load i64, ptr %53, align 8, !sec !{!"public", !"public"}
  %55 = icmp ult i64 %51, %54, !sec !{!"public"}
  br i1 %55, label %56, label %78, !sec !{!"public"}

56:                                               ; preds = %50, !sec !{!"public"}
  %57 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %58 = trunc i8 %57 to i1, !sec !{!"public"}
  br i1 %58, label %59, label %67, !sec !{!"public"}

59:                                               ; preds = %56, !sec !{!"public"}
  %60 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %61 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %62 = load ptr, ptr %61, align 8, !sec !{!"public", !"public"}
  %63 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %64 = getelementptr inbounds ptr, ptr %62, i64 %63, !sec !{!"public", !"public", !"public"}
  %65 = load ptr, ptr %64, align 8, !sec !{!"public", !"public"}
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %65), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %67

67:                                               ; preds = %59, %56, !sec !{!"public"}
  %68 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %70 = load ptr, ptr %69, align 8, !sec !{!"public", !"public"}
  %71 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %72 = getelementptr inbounds i64, ptr %70, i64 %71, !sec !{!"public", !"public", !"public"}
  %73 = load i64, ptr %72, align 8, !sec !{!"public", !"public"}
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %73), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %75

75:                                               ; preds = %67, !sec !{!"public"}
  %76 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %77 = add i64 %76, 1, !sec !{!"public"}
  store i64 %77, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %50, !llvm.loop !12

78:                                               ; preds = %50, !sec !{!"public"}
  %79 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %81 = load i8, ptr %80, align 8, !sec !{!"public", !"public"}
  %82 = trunc i8 %81 to i1, !sec !{!"public"}
  br i1 %82, label %101, label %83, !sec !{!"public"}

83:                                               ; preds = %78, !sec !{!"public"}
  store i64 0, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %84

84:                                               ; preds = %97, %83, !sec !{!"public"}
  %85 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %86 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %87 = getelementptr inbounds %struct.node, ptr %86, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %88 = load i64, ptr %87, align 8, !sec !{!"public", !"public"}
  %89 = icmp ule i64 %85, %88, !sec !{!"public"}
  br i1 %89, label %90, label %100, !sec !{!"public"}

90:                                               ; preds = %84, !sec !{!"public"}
  %91 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %92 = getelementptr inbounds %struct.node, ptr %91, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %93 = load ptr, ptr %92, align 8, !sec !{!"public", !"public"}
  %94 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %95 = getelementptr inbounds ptr, ptr %93, i64 %94, !sec !{!"public", !"public", !"public"}
  %96 = load ptr, ptr %95, align 8, !sec !{!"public", !"public"}
  call void @enqueue(ptr noundef %96), !sec !{!"call", !"void", !{!"public"}}
  br label %97

97:                                               ; preds = %90, !sec !{!"public"}
  %98 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %99 = add i64 %98, 1, !sec !{!"public"}
  store i64 %99, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %84, !llvm.loop !13

100:                                              ; preds = %84, !sec !{!"public"}
  br label %101

101:                                              ; preds = %100, %78, !sec !{!"public"}
  %102 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %103 = trunc i8 %102 to i1, !sec !{!"public"}
  br i1 %103, label %104, label %129, !sec !{!"public"}

104:                                              ; preds = %101, !sec !{!"public"}
  %105 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %106 = getelementptr inbounds %struct.node, ptr %105, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %107 = load i8, ptr %106, align 8, !sec !{!"public", !"public"}
  %108 = trunc i8 %107 to i1, !sec !{!"public"}
  br i1 %108, label %109, label %118, !sec !{!"public"}

109:                                              ; preds = %104, !sec !{!"public"}
  %110 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %111 = getelementptr inbounds %struct.node, ptr %110, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %112 = load ptr, ptr %111, align 8, !sec !{!"public", !"public"}
  %113 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %114 = sub i64 %113, 1, !sec !{!"public"}
  %115 = getelementptr inbounds ptr, ptr %112, i64 %114, !sec !{!"public", !"public", !"public"}
  %116 = load ptr, ptr %115, align 8, !sec !{!"public", !"public"}
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %116), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %128

118:                                              ; preds = %104, !sec !{!"public"}
  %119 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %120 = getelementptr inbounds %struct.node, ptr %119, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %121 = load ptr, ptr %120, align 8, !sec !{!"public", !"public"}
  %122 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %123 = getelementptr inbounds %struct.node, ptr %122, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %124 = load i64, ptr %123, align 8, !sec !{!"public", !"public"}
  %125 = getelementptr inbounds ptr, ptr %121, i64 %124, !sec !{!"public", !"public", !"public"}
  %126 = load ptr, ptr %125, align 8, !sec !{!"public", !"public"}
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %126), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %128

128:                                              ; preds = %118, %109, !sec !{!"public"}
  br label %129

129:                                              ; preds = %128, %101, !sec !{!"public"}
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.16), !sec !{!"call", !"public", !{!"public"}}
  br label %13, !llvm.loop !14

131:                                              ; preds = %13, !sec !{!"public"}
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %133

133:                                              ; preds = %131, %9, !sec !{!"public"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 !sec !{!"void", !"public", !{!"private", !"public", !"public"}} {
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"public"}
  %6 = alloca i8, align 1, !sec !{!"public"}
  %7 = alloca ptr, align 8, !sec !{!"public"}
  store ptr %0, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %5, align 8, !sec !{!"public", !"public"}
  %8 = zext i1 %2 to i8, !sec !{!"public"}
  store i8 %8, ptr %6, align 1, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %10 = load i64, ptr %5, align 8, !sec !{!"public", !"public"}
  %11 = load i8, ptr %6, align 1, !sec !{!"public", !"public"}
  %12 = trunc i8 %11 to i1, !sec !{!"public"}
  %13 = call ptr @find(ptr noundef %9, i64 noundef %10, i1 noundef zeroext %12, ptr noundef null), !sec !{!"call", !"public", !{!"private", !"public", !"public", !"public"}}
  store ptr %13, ptr %7, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %15 = icmp eq ptr %14, null, !sec !{!"public"}
  br i1 %15, label %16, label %19, !sec !{!"public"}

16:                                               ; preds = %3, !sec !{!"public"}
  %17 = load i64, ptr %5, align 8, !sec !{!"public", !"public"}
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i64 noundef %17), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %26

19:                                               ; preds = %3, !sec !{!"public"}
  %20 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %5, align 8, !sec !{!"public", !"public"}
  %22 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %23 = getelementptr inbounds %struct.record, ptr %22, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %24 = load i64, ptr %23, align 8, !sec !{!"public", !"public"}
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %20, i64 noundef %21, i64 noundef %24), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  br label %26

26:                                               ; preds = %19, %16, !sec !{!"public"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2, ptr noundef %3) #0 !sec !{!"public", !"public", !{!"private", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
  %5 = alloca ptr, align 8, !sec !{!"public"}
  %6 = alloca ptr, align 8, !sec !{!"public"}
  %7 = alloca i64, align 8, !sec !{!"public"}
  %8 = alloca i8, align 1, !sec !{!"public"}
  %9 = alloca ptr, align 8, !sec !{!"public"}
  %10 = alloca i64, align 8, !sec !{!"public"}
  %11 = alloca ptr, align 8, !sec !{!"public"}
  store ptr %0, ptr %6, align 8, !sec !{!"public", !"public"}
  store i64 %1, ptr %7, align 8, !sec !{!"public", !"public"}
  %12 = zext i1 %2 to i8, !sec !{!"public"}
  store i8 %12, ptr %8, align 1, !sec !{!"public", !"public"}
  store ptr %3, ptr %9, align 8, !sec !{!"public", !"public"}
  %13 = load ptr, ptr %6, align 8, !sec !{!"public", !"public"}
  %14 = icmp eq ptr %13, null, !sec !{!"public"}
  br i1 %14, label %15, label %21, !sec !{!"public"}

15:                                               ; preds = %4, !sec !{!"public"}
  %16 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %17 = icmp ne ptr %16, null, !sec !{!"public"}
  br i1 %17, label %18, label %20, !sec !{!"public"}

18:                                               ; preds = %15, !sec !{!"public"}
  %19 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %19, align 8, !sec !{!"public", !"public"}
  br label %20

20:                                               ; preds = %18, %15, !sec !{!"public"}
  store ptr null, ptr %5, align 8, !sec !{!"public", !"public"}
  br label %67

21:                                               ; preds = %4, !sec !{!"public"}
  store i64 0, ptr %10, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %11, align 8, !sec !{!"public", !"public"}
  %22 = load ptr, ptr %6, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr %7, align 8, !sec !{!"public", !"public"}
  %24 = load i8, ptr %8, align 1, !sec !{!"public", !"public"}
  %25 = trunc i8 %24 to i1, !sec !{!"public"}
  %26 = call ptr @find_leaf(ptr noundef %22, i64 noundef %23, i1 noundef zeroext %25), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  store ptr %26, ptr %11, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %10, align 8, !sec !{!"public", !"public"}
  br label %27

27:                                               ; preds = %44, %21, !sec !{!"public"}
  %28 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %29 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load i64, ptr %30, align 8, !sec !{!"public", !"public"}
  %32 = icmp ult i64 %28, %31, !sec !{!"public"}
  br i1 %32, label %33, label %47, !sec !{!"public"}

33:                                               ; preds = %27, !sec !{!"public"}
  %34 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %36 = load ptr, ptr %35, align 8, !sec !{!"public", !"public"}
  %37 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %38 = getelementptr inbounds i64, ptr %36, i64 %37, !sec !{!"public", !"public", !"public"}
  %39 = load i64, ptr %38, align 8, !sec !{!"public", !"public"}
  %40 = load i64, ptr %7, align 8, !sec !{!"public", !"public"}
  %41 = icmp eq i64 %39, %40, !sec !{!"public"}
  br i1 %41, label %42, label %43, !sec !{!"public"}

42:                                               ; preds = %33, !sec !{!"public"}
  br label %47

43:                                               ; preds = %33, !sec !{!"public"}
  br label %44

44:                                               ; preds = %43, !sec !{!"public"}
  %45 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %46 = add i64 %45, 1, !sec !{!"public"}
  store i64 %46, ptr %10, align 8, !sec !{!"public", !"public"}
  br label %27, !llvm.loop !15

47:                                               ; preds = %42, %27, !sec !{!"public"}
  %48 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %49 = icmp ne ptr %48, null, !sec !{!"public"}
  br i1 %49, label %50, label %53, !sec !{!"public"}

50:                                               ; preds = %47, !sec !{!"public"}
  %51 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  %52 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  store ptr %51, ptr %52, align 8, !sec !{!"public", !"public"}
  br label %53

53:                                               ; preds = %50, %47, !sec !{!"public"}
  %54 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %55 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  %56 = getelementptr inbounds %struct.node, ptr %55, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %57 = load i64, ptr %56, align 8, !sec !{!"public", !"public"}
  %58 = icmp eq i64 %54, %57, !sec !{!"public"}
  br i1 %58, label %59, label %60, !sec !{!"public"}

59:                                               ; preds = %53, !sec !{!"public"}
  store ptr null, ptr %5, align 8, !sec !{!"public", !"public"}
  br label %67

60:                                               ; preds = %53, !sec !{!"public"}
  %61 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  %62 = getelementptr inbounds %struct.node, ptr %61, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %63 = load ptr, ptr %62, align 8, !sec !{!"public", !"public"}
  %64 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %65 = getelementptr inbounds ptr, ptr %63, i64 %64, !sec !{!"public", !"public", !"public"}
  %66 = load ptr, ptr %65, align 8, !sec !{!"public", !"public"}
  store ptr %66, ptr %5, align 8, !sec !{!"public", !"public"}
  br label %67

67:                                               ; preds = %60, %59, %20, !sec !{!"public"}
  %68 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  ret ptr %68, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3) #0 !sec !{!"void", !"public", !{!"private", !"private", !"private", !"public"}} {
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca i64, align 8, !sec !{!"private"}
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca i8, align 1, !sec !{!"public"}
  %9 = alloca i64, align 8, !sec !{!"public"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca ptr, align 8, !sec !{!"public"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"public"}
  store ptr %0, ptr %5, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %6, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %7, align 8, !sec !{!"private", !"private"}
  %15 = zext i1 %3 to i8, !sec !{!"public"}
  store i8 %15, ptr %8, align 1, !sec !{!"public", !"public"}
  %16 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %17 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %18 = sub i64 %16, %17, !sec !{!"private"}
  %19 = add i64 %18, 1, !sec !{!"private"}
  store i64 %19, ptr %10, align 8, !sec !{!"private", !"private"}
  %20 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %21 = call ptr @llvm.stacksave.p0(), !sec !{!"call", !"public", !{}}
  store ptr %21, ptr %11, align 8, !sec !{!"public", !"public"}
  %22 = alloca i64, i64 %20, align 16, !sec !{!"public"}
  store i64 %20, ptr %12, align 8, !sec !{!"private", !"private"}
  %23 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %24 = alloca ptr, i64 %23, align 16, !sec !{!"public"}
  store i64 %23, ptr %13, align 8, !sec !{!"private", !"private"}
  %25 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %26 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %27 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %28 = load i8, ptr %8, align 1, !sec !{!"public", !"public"}
  %29 = trunc i8 %28 to i1, !sec !{!"public"}
  %30 = call i64 @find_range(ptr noundef %25, i64 noundef %26, i64 noundef %27, i1 noundef zeroext %29, ptr noundef %22, ptr noundef %24), !sec !{!"call", !"public", !{!"private", !"private", !"private", !"public", !"public", !"public"}}
  store i64 %30, ptr %14, align 8, !sec !{!"public", !"public"}
  %31 = load i64, ptr %14, align 8, !sec !{!"public", !"public"}
  %32 = icmp ne i64 %31, 0, !sec !{!"public"}
  br i1 %32, label %35, label %33, !sec !{!"public"}

33:                                               ; preds = %4, !sec !{!"public"}
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.19), !sec !{!"call", !"public", !{!"public"}}
  br label %57

35:                                               ; preds = %4, !sec !{!"public"}
  store i64 0, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %36

36:                                               ; preds = %53, %35, !sec !{!"public"}
  %37 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr %14, align 8, !sec !{!"public", !"public"}
  %39 = icmp ult i64 %37, %38, !sec !{!"public"}
  br i1 %39, label %40, label %56, !sec !{!"public"}

40:                                               ; preds = %36, !sec !{!"public"}
  %41 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %42 = getelementptr inbounds i64, ptr %22, i64 %41, !sec !{!"public", !"public", !"public"}
  %43 = load i64, ptr %42, align 8, !sec !{!"public", !"public"}
  %44 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %45 = getelementptr inbounds ptr, ptr %24, i64 %44, !sec !{!"public", !"public", !"public"}
  %46 = load ptr, ptr %45, align 8, !sec !{!"public", !"public"}
  %47 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %48 = getelementptr inbounds ptr, ptr %24, i64 %47, !sec !{!"public", !"public", !"public"}
  %49 = load ptr, ptr %48, align 8, !sec !{!"public", !"public"}
  %50 = getelementptr inbounds %struct.record, ptr %49, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %51 = load i64, ptr %50, align 8, !sec !{!"public", !"public"}
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i64 noundef %43, ptr noundef %46, i64 noundef %51), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  br label %53

53:                                               ; preds = %40, !sec !{!"public"}
  %54 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %55 = add i64 %54, 1, !sec !{!"public"}
  store i64 %55, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %36, !llvm.loop !16

56:                                               ; preds = %36, !sec !{!"public"}
  br label %57

57:                                               ; preds = %56, %33, !sec !{!"public"}
  %58 = load ptr, ptr %11, align 8, !sec !{!"public", !"public"}
  call void @llvm.stackrestore.p0(ptr %58), !sec !{!"call", !"void", !{!"public"}}
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"public", !"public", !{}} ptr @llvm.stacksave.p0() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @find_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3, ptr noundef %4, ptr noundef %5) #0 !sec !{!"public", !"public", !{!"private", !"private", !"private", !"public", !"public", !"public", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private", !"private"}} {
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca ptr, align 8, !sec !{!"private"}
  %9 = alloca i64, align 8, !sec !{!"private"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca i8, align 1, !sec !{!"private"}
  %12 = alloca ptr, align 8, !sec !{!"private"}
  %13 = alloca ptr, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"private"}
  %15 = alloca i64, align 8, !sec !{!"private"}
  %16 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %8, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %9, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %10, align 8, !sec !{!"private", !"private"}
  %17 = zext i1 %3 to i8, !sec !{!"private"}
  store i8 %17, ptr %11, align 1, !sec !{!"private", !"private"}
  store ptr %4, ptr %12, align 8, !sec !{!"private", !"private"}
  store ptr %5, ptr %13, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %15, align 8, !sec !{!"private", !"private"}
  %18 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %20 = load i8, ptr %11, align 1, !sec !{!"private", !"private"}
  %21 = trunc i8 %20 to i1, !sec !{!"private"}
  %22 = call ptr @find_leaf(ptr noundef %18, i64 noundef %19, i1 noundef zeroext %21), !sec !{!"call", !"private", !{!"private", !"private", !"private"}}
  store ptr %22, ptr %16, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %24 = icmp eq ptr %23, null, !sec !{!"private"}
  br i1 %24, label %25, label %26, !sec !{!"private"}

25:                                               ; preds = %6, !sec !{!"private"}
  store i64 0, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %111

26:                                               ; preds = %6, !sec !{!"private"}
  store i64 0, ptr %14, align 8, !sec !{!"private", !"private"}
  br label %27

27:                                               ; preds = %45, %26, !sec !{!"private"}
  %28 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %29 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %31 = load i64, ptr %30, align 8, !sec !{!"private", !"private"}
  %32 = icmp ult i64 %28, %31, !sec !{!"private"}
  br i1 %32, label %33, label %42, !sec !{!"private"}

33:                                               ; preds = %27, !sec !{!"private"}
  %34 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %36 = load ptr, ptr %35, align 8, !sec !{!"private", !"private"}
  %37 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %38 = getelementptr inbounds i64, ptr %36, i64 %37, !sec !{!"private", !"private", !"private"}
  %39 = load i64, ptr %38, align 8, !sec !{!"private", !"private"}
  %40 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %41 = icmp ult i64 %39, %40, !sec !{!"private"}
  br label %42

42:                                               ; preds = %33, %27, !sec !{!"private"}
  %43 = phi i1 [ false, %27 ], [ %41, %33 ], !sec !{!"private", !"private", !"private"}
  br i1 %43, label %44, label %48, !sec !{!"private"}

44:                                               ; preds = %42, !sec !{!"private"}
  br label %45

45:                                               ; preds = %44, !sec !{!"private"}
  %46 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %47 = add i64 %46, 1, !sec !{!"private"}
  store i64 %47, ptr %14, align 8, !sec !{!"private", !"private"}
  br label %27, !llvm.loop !17

48:                                               ; preds = %42, !sec !{!"private"}
  %49 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %50 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %52 = load i64, ptr %51, align 8, !sec !{!"private", !"private"}
  %53 = icmp eq i64 %49, %52, !sec !{!"private"}
  br i1 %53, label %54, label %55, !sec !{!"private"}

54:                                               ; preds = %48, !sec !{!"private"}
  store i64 0, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %111

55:                                               ; preds = %48, !sec !{!"private"}
  br label %56

56:                                               ; preds = %101, %55, !sec !{!"private"}
  %57 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %58 = icmp ne ptr %57, null, !sec !{!"private"}
  br i1 %58, label %59, label %109, !sec !{!"private"}

59:                                               ; preds = %56, !sec !{!"private"}
  br label %60

60:                                               ; preds = %98, %59, !sec !{!"private"}
  %61 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %62 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %64 = load i64, ptr %63, align 8, !sec !{!"private", !"private"}
  %65 = icmp ult i64 %61, %64, !sec !{!"private"}
  br i1 %65, label %66, label %75, !sec !{!"private"}

66:                                               ; preds = %60, !sec !{!"private"}
  %67 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %69 = load ptr, ptr %68, align 8, !sec !{!"private", !"private"}
  %70 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %71 = getelementptr inbounds i64, ptr %69, i64 %70, !sec !{!"private", !"private", !"private"}
  %72 = load i64, ptr %71, align 8, !sec !{!"private", !"private"}
  %73 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %74 = icmp ule i64 %72, %73, !sec !{!"private"}
  br label %75

75:                                               ; preds = %66, %60, !sec !{!"private"}
  %76 = phi i1 [ false, %60 ], [ %74, %66 ], !sec !{!"private", !"private", !"private"}
  br i1 %76, label %77, label %101, !sec !{!"private"}

77:                                               ; preds = %75, !sec !{!"private"}
  %78 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %79 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %80 = load ptr, ptr %79, align 8, !sec !{!"private", !"private"}
  %81 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %82 = getelementptr inbounds i64, ptr %80, i64 %81, !sec !{!"private", !"private", !"private"}
  %83 = load i64, ptr %82, align 8, !sec !{!"private", !"private"}
  %84 = load ptr, ptr %12, align 8, !sec !{!"private", !"private"}
  %85 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %86 = getelementptr inbounds i64, ptr %84, i64 %85, !sec !{!"private", !"private", !"private"}
  store i64 %83, ptr %86, align 8, !sec !{!"private", !"private"}
  %87 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %89 = load ptr, ptr %88, align 8, !sec !{!"private", !"private"}
  %90 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90, !sec !{!"private", !"private", !"private"}
  %92 = load ptr, ptr %91, align 8, !sec !{!"private", !"private"}
  %93 = load ptr, ptr %13, align 8, !sec !{!"private", !"private"}
  %94 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %95 = getelementptr inbounds ptr, ptr %93, i64 %94, !sec !{!"private", !"private", !"private"}
  store ptr %92, ptr %95, align 8, !sec !{!"private", !"private"}
  %96 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %97 = add i64 %96, 1, !sec !{!"private"}
  store i64 %97, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %98

98:                                               ; preds = %77, !sec !{!"private"}
  %99 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %100 = add i64 %99, 1, !sec !{!"private"}
  store i64 %100, ptr %14, align 8, !sec !{!"private", !"private"}
  br label %60, !llvm.loop !18

101:                                              ; preds = %75, !sec !{!"private"}
  %102 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %103 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %104 = load ptr, ptr %103, align 8, !sec !{!"private", !"private"}
  %105 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %106 = sub i64 %105, 1, !sec !{!"private"}
  %107 = getelementptr inbounds ptr, ptr %104, i64 %106, !sec !{!"private", !"private", !"private"}
  %108 = load ptr, ptr %107, align 8, !sec !{!"private", !"private"}
  store ptr %108, ptr %16, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %14, align 8, !sec !{!"private", !"private"}
  br label %56, !llvm.loop !19

109:                                              ; preds = %56, !sec !{!"private"}
  %110 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  store i64 %110, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %111

111:                                              ; preds = %109, %54, %25, !sec !{!"private"}
  %112 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  ret i64 %112, !sec !{!"private"}
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"void", !"public", !{!"public"}} void @llvm.stackrestore.p0(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find_leaf(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 !sec !{!"NOSEC", !"NOSEC", !{!"NOSEC", !"NOSEC", !"NOSEC", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
  %4 = alloca ptr, align 8, !sec !{!"public"}
  %5 = alloca ptr, align 8, !sec !{!"public"}
  %6 = alloca i64, align 8, !sec !{!"public"}
  %7 = alloca i8, align 1, !sec !{!"public"}
  %8 = alloca i64, align 8, !sec !{!"public"}
  %9 = alloca ptr, align 8, !sec !{!"public"}
  store ptr %0, ptr %5, align 8, !sec !{!"public", !"public"}
  store i64 %1, ptr %6, align 8, !sec !{!"public", !"public"}
  %10 = zext i1 %2 to i8, !sec !{!"public"}
  store i8 %10, ptr %7, align 1, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  %12 = icmp eq ptr %11, null, !sec !{!"public"}
  br i1 %12, label %13, label %20, !sec !{!"public"}

13:                                               ; preds = %3, !sec !{!"public"}
  %14 = load i8, ptr %7, align 1, !sec !{!"public", !"public"}
  %15 = trunc i8 %14 to i1, !sec !{!"public"}
  br i1 %15, label %16, label %18, !sec !{!"public"}

16:                                               ; preds = %13, !sec !{!"public"}
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %18

18:                                               ; preds = %16, %13, !sec !{!"public"}
  %19 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  store ptr %19, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %126

20:                                               ; preds = %3, !sec !{!"public"}
  store i64 0, ptr %8, align 8, !sec !{!"public", !"public"}
  %21 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  store ptr %21, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %22

22:                                               ; preds = %86, %20, !sec !{!"public"}
  %23 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %25 = load i8, ptr %24, align 8, !sec !{!"public", !"public"}
  %26 = trunc i8 %25 to i1, !sec !{!"public"}
  %27 = xor i1 %26, true, !sec !{!"public"}
  br i1 %27, label %28, label %93, !sec !{!"public"}

28:                                               ; preds = %22, !sec !{!"public"}
  %29 = load i8, ptr %7, align 1, !sec !{!"public", !"public"}
  %30 = trunc i8 %29 to i1, !sec !{!"public"}
  br i1 %30, label %31, label %59, !sec !{!"public"}

31:                                               ; preds = %28, !sec !{!"public"}
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.21), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %33

33:                                               ; preds = %48, %31, !sec !{!"public"}
  %34 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %35 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %37 = load i64, ptr %36, align 8, !sec !{!"public", !"public"}
  %38 = sub i64 %37, 1, !sec !{!"public"}
  %39 = icmp ult i64 %34, %38, !sec !{!"public"}
  br i1 %39, label %40, label %51, !sec !{!"public"}

40:                                               ; preds = %33, !sec !{!"public"}
  %41 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %43 = load ptr, ptr %42, align 8, !sec !{!"public", !"public"}
  %44 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %45 = getelementptr inbounds i64, ptr %43, i64 %44, !sec !{!"public", !"public", !"public"}
  %46 = load i64, ptr %45, align 8, !sec !{!"public", !"public"}
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %46), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %48

48:                                               ; preds = %40, !sec !{!"public"}
  %49 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %50 = add i64 %49, 1, !sec !{!"public"}
  store i64 %50, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %33, !llvm.loop !20

51:                                               ; preds = %33, !sec !{!"public"}
  %52 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %54 = load ptr, ptr %53, align 8, !sec !{!"public", !"public"}
  %55 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %56 = getelementptr inbounds i64, ptr %54, i64 %55, !sec !{!"public", !"public", !"public"}
  %57 = load i64, ptr %56, align 8, !sec !{!"public", !"public"}
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i64 noundef %57), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %59

59:                                               ; preds = %51, %28, !sec !{!"public"}
  store i64 0, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %60

60:                                               ; preds = %79, %59, !sec !{!"public"}
  %61 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %62 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %64 = load i64, ptr %63, align 8, !sec !{!"public", !"public"}
  %65 = icmp ult i64 %61, %64, !sec !{!"public"}
  br i1 %65, label %66, label %80, !sec !{!"public"}

66:                                               ; preds = %60, !sec !{!"public"}
  %67 = load i64, ptr %6, align 8, !sec !{!"public", !"public"}
  %68 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %70 = load ptr, ptr %69, align 8, !sec !{!"public", !"public"}
  %71 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %72 = getelementptr inbounds i64, ptr %70, i64 %71, !sec !{!"public", !"public", !"public"}
  %73 = load i64, ptr %72, align 8, !sec !{!"public", !"public"}
  %74 = icmp uge i64 %67, %73, !sec !{!"public"}
  br i1 %74, label %75, label %78, !sec !{!"public"}

75:                                               ; preds = %66, !sec !{!"public"}
  %76 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %77 = add i64 %76, 1, !sec !{!"public"}
  store i64 %77, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %79

78:                                               ; preds = %66, !sec !{!"public"}
  br label %80

79:                                               ; preds = %75, !sec !{!"public"}
  br label %60, !llvm.loop !21

80:                                               ; preds = %78, %60, !sec !{!"public"}
  %81 = load i8, ptr %7, align 1, !sec !{!"public", !"public"}
  %82 = trunc i8 %81 to i1, !sec !{!"public"}
  br i1 %82, label %83, label %86, !sec !{!"public"}

83:                                               ; preds = %80, !sec !{!"public"}
  %84 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i64 noundef %84), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %86

86:                                               ; preds = %83, %80, !sec !{!"public"}
  %87 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %89 = load ptr, ptr %88, align 8, !sec !{!"public", !"public"}
  %90 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90, !sec !{!"public", !"public", !"public"}
  %92 = load ptr, ptr %91, align 8, !sec !{!"public", !"public"}
  store ptr %92, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %22, !llvm.loop !22

93:                                               ; preds = %22, !sec !{!"public"}
  %94 = load i8, ptr %7, align 1, !sec !{!"public", !"public"}
  %95 = trunc i8 %94 to i1, !sec !{!"public"}
  br i1 %95, label %96, label %124, !sec !{!"public"}

96:                                               ; preds = %93, !sec !{!"public"}
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.24), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %98

98:                                               ; preds = %113, %96, !sec !{!"public"}
  %99 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %100 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %102 = load i64, ptr %101, align 8, !sec !{!"public", !"public"}
  %103 = sub i64 %102, 1, !sec !{!"public"}
  %104 = icmp ult i64 %99, %103, !sec !{!"public"}
  br i1 %104, label %105, label %116, !sec !{!"public"}

105:                                              ; preds = %98, !sec !{!"public"}
  %106 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %108 = load ptr, ptr %107, align 8, !sec !{!"public", !"public"}
  %109 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %110 = getelementptr inbounds i64, ptr %108, i64 %109, !sec !{!"public", !"public", !"public"}
  %111 = load i64, ptr %110, align 8, !sec !{!"public", !"public"}
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %111), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %113

113:                                              ; preds = %105, !sec !{!"public"}
  %114 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %115 = add i64 %114, 1, !sec !{!"public"}
  store i64 %115, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %98, !llvm.loop !23

116:                                              ; preds = %98, !sec !{!"public"}
  %117 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  %118 = getelementptr inbounds %struct.node, ptr %117, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %119 = load ptr, ptr %118, align 8, !sec !{!"public", !"public"}
  %120 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %121 = getelementptr inbounds i64, ptr %119, i64 %120, !sec !{!"public", !"public", !"public"}
  %122 = load i64, ptr %121, align 8, !sec !{!"public", !"public"}
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i64 noundef %122), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %124

124:                                              ; preds = %116, %93, !sec !{!"public"}
  %125 = load ptr, ptr %9, align 8, !sec !{!"public", !"public"}
  store ptr %125, ptr %4, align 8, !sec !{!"public", !"public"}
  br label %126

126:                                              ; preds = %124, %18, !sec !{!"public"}
  %127 = load ptr, ptr %4, align 8, !sec !{!"public", !"public"}
  ret ptr %127, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @cut(i64 noundef %0) #0 !sec !{!"public", !"public", !{!"public"}} {
  %2 = alloca i64, align 8, !sec !{!"public"}
  %3 = alloca i64, align 8, !sec !{!"public"}
  store i64 %0, ptr %3, align 8, !sec !{!"public", !"public"}
  %4 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %5 = urem i64 %4, 2, !sec !{!"public"}
  %6 = icmp eq i64 %5, 0, !sec !{!"public"}
  br i1 %6, label %7, label %10, !sec !{!"public"}

7:                                                ; preds = %1, !sec !{!"public"}
  %8 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %9 = udiv i64 %8, 2, !sec !{!"public"}
  store i64 %9, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14

10:                                               ; preds = %1, !sec !{!"public"}
  %11 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %12 = udiv i64 %11, 2, !sec !{!"public"}
  %13 = add i64 %12, 1, !sec !{!"public"}
  store i64 %13, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14

14:                                               ; preds = %10, %7, !sec !{!"public"}
  %15 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  ret i64 %15, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_node() #0 !sec !{!"public", !"public", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"public"}
  %2 = alloca i64, align 8, !sec !{!"public"}
  %3 = alloca ptr, align 8, !sec !{!"public"}
  %4 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  %5 = icmp ne ptr %4, null, !sec !{!"public"}
  br i1 %5, label %30, label %6, !sec !{!"public"}

6:                                                ; preds = %0, !sec !{!"public"}
  %7 = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %7, ptr %1, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %9 = icmp eq ptr %8, null, !sec !{!"public"}
  br i1 %9, label %10, label %13, !sec !{!"public"}

10:                                               ; preds = %6, !sec !{!"public"}
  %11 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.26), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

13:                                               ; preds = %6, !sec !{!"public"}
  store i64 0, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14

14:                                               ; preds = %26, %13, !sec !{!"public"}
  %15 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %16 = icmp ult i64 %15, 18724, !sec !{!"public"}
  br i1 %16, label %17, label %29, !sec !{!"public"}

17:                                               ; preds = %14, !sec !{!"public"}
  %18 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %20 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %21 = getelementptr inbounds %struct.node, ptr %19, i64 %20, !sec !{!"public", !"public", !"public"}
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %18, ptr %22, align 8, !sec !{!"public", !"public"}
  %23 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %24 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %25 = getelementptr inbounds %struct.node, ptr %23, i64 %24, !sec !{!"public", !"public", !"public"}
  store ptr %25, ptr @free_nodes, align 8
  br label %26

26:                                               ; preds = %17, !sec !{!"public"}
  %27 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %28 = add i64 %27, 1, !sec !{!"public"}
  store i64 %28, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14, !llvm.loop !24

29:                                               ; preds = %14, !sec !{!"public"}
  br label %30

30:                                               ; preds = %29, %0, !sec !{!"public"}
  %31 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  store ptr %31, ptr %3, align 8, !sec !{!"public", !"public"}
  %32 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load ptr, ptr %33, align 8, !sec !{!"public", !"public"}
  store ptr %34, ptr @free_nodes, align 8
  %35 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 8 %35, i8 0, i64 8, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %36 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  ret ptr %36, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate(i64 noundef %0, i64 noundef %1) #0 !sec !{!"void", !"public", !{!"public", !"public"}} {
  %3 = alloca i64, align 8, !sec !{!"public"}
  %4 = alloca i64, align 8, !sec !{!"public"}
  %5 = alloca ptr, align 8, !sec !{!"public"}
  store i64 %0, ptr %3, align 8, !sec !{!"public", !"public"}
  store i64 %1, ptr %4, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %7 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %8 = call i32 @posix_memalign(ptr noundef %5, i64 noundef %6, i64 noundef %7) #8, !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %9 = icmp ne i32 %8, 0, !sec !{!"public"}
  br i1 %9, label %10, label %12, !sec !{!"public"}

10:                                               ; preds = %2, !sec !{!"public"}
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.44), !sec !{!"call", !"public", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

12:                                               ; preds = %2, !sec !{!"public"}
  %13 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  %14 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %15 = add i64 %14, %13, !sec !{!"public"}
  store i64 %15, ptr @allocator_stat, align 8
  %16 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %3, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 1 %16, i8 0, i64 %17, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %18 = load ptr, ptr %5, align 8, !sec !{!"public", !"public"}
  ret ptr %18, !sec !{!"public"}
}

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare !sec !{!"void", !"public", !{!"public"}} void @exit(i32 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare !sec !{!"void", !"public", !{!"public", !"public", !"public", !"public"}} void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public", !"public"}} i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_node(ptr noundef %0) #0 !sec !{!"void", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %3 = load ptr, ptr @free_nodes, align 8, !sec !{!"private", !"private"}
  %4 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %3, ptr %5, align 8, !sec !{!"private", !"private"}
  %6 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  store ptr %6, ptr @free_nodes, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_record() #0 !sec !{!"private", !"public", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"public"}
  %2 = alloca i64, align 8, !sec !{!"public"}
  %3 = alloca ptr, align 8, !sec !{!"public"}
  %4 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  %5 = icmp ne ptr %4, null, !sec !{!"public"}
  br i1 %5, label %30, label %6, !sec !{!"public"}

6:                                                ; preds = %0, !sec !{!"public"}
  %7 = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %7, ptr %1, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %9 = icmp eq ptr %8, null, !sec !{!"public"}
  br i1 %9, label %10, label %13, !sec !{!"public"}

10:                                               ; preds = %6, !sec !{!"public"}
  %11 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.26), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

13:                                               ; preds = %6, !sec !{!"public"}
  store i64 0, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14

14:                                               ; preds = %26, %13, !sec !{!"public"}
  %15 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %16 = icmp ult i64 %15, 32768, !sec !{!"public"}
  br i1 %16, label %17, label %29, !sec !{!"public"}

17:                                               ; preds = %14, !sec !{!"public"}
  %18 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %20 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %21 = getelementptr inbounds %struct.record, ptr %19, i64 %20, !sec !{!"public", !"public", !"public"}
  %22 = getelementptr inbounds %struct.record, ptr %21, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %18, ptr %22, align 8, !sec !{!"public", !"public"}
  %23 = load ptr, ptr %1, align 8, !sec !{!"public", !"public"}
  %24 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %25 = getelementptr inbounds %struct.record, ptr %23, i64 %24, !sec !{!"public", !"public", !"public"}
  store ptr %25, ptr @free_recs, align 8
  br label %26

26:                                               ; preds = %17, !sec !{!"public"}
  %27 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %28 = add i64 %27, 1, !sec !{!"public"}
  store i64 %28, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %14, !llvm.loop !25

29:                                               ; preds = %14, !sec !{!"public"}
  br label %30

30:                                               ; preds = %29, %0, !sec !{!"public"}
  %31 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  store ptr %31, ptr %3, align 8, !sec !{!"public", !"public"}
  %32 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %33 = getelementptr inbounds %struct.record, ptr %32, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load ptr, ptr %33, align 8, !sec !{!"public", !"public"}
  store ptr %34, ptr @free_recs, align 8
  %35 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 8 %35, i8 0, i64 32, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %36 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  ret ptr %36, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_record(ptr noundef %0) #0 !sec !{!"void", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %3 = load ptr, ptr @free_recs, align 8, !sec !{!"private", !"private"}
  %4 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %5 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %3, ptr %5, align 8, !sec !{!"private", !"private"}
  %6 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  store ptr %6, ptr @free_recs, align 8
  ret void
}