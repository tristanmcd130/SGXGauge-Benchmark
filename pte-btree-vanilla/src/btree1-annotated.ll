@order = dso_local global i64 6, align 8 !sec !{!"public"}

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
define dso_local ptr @dequeue() #0 !sec !{!"public", !"public", !{!"public"}} {
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
define dso_local void @print_tree(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"public"}} {
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
define dso_local ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2, ptr noundef %3) #0 !sec !{!"NOSEC", !"NOSEC", !{!"private", !"NOSEC", !"public", !"NOSEC", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
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
define dso_local i64 @cut(i64 noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca i64, align 8, !sec !{!"private"}
  %3 = alloca i64, align 8, !sec !{!"private"}
  store i64 %0, ptr %3, align 8, !sec !{!"private", !"private"}
  %4 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %5 = urem i64 %4, 2, !sec !{!"private"}
  %6 = icmp eq i64 %5, 0, !sec !{!"private"}
  br i1 %6, label %7, label %10, !sec !{!"private"}

7:                                                ; preds = %1, !sec !{!"private"}
  %8 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %9 = udiv i64 %8, 2, !sec !{!"private"}
  store i64 %9, ptr %2, align 8, !sec !{!"private", !"private"}
  br label %14

10:                                               ; preds = %1, !sec !{!"private"}
  %11 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %12 = udiv i64 %11, 2, !sec !{!"private"}
  %13 = add i64 %12, 1, !sec !{!"private"}
  store i64 %13, ptr %2, align 8, !sec !{!"private", !"private"}
  br label %14

14:                                               ; preds = %10, %7, !sec !{!"private"}
  %15 = load i64, ptr %2, align 8, !sec !{!"private", !"private"}
  ret i64 %15, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_node() #0 !sec !{!"private", !"private", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
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
define dso_local ptr @alloc_record() #0 !sec !{!"private", !"private", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_record(i64 noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca i64, align 8, !sec !{!"private"}
  %3 = alloca ptr, align 8, !sec !{!"private"}
  store i64 %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %4 = call ptr (i64, ...) @alloc_record(i64 noundef 32), !sec !{!"call", !"private", !{!"public"}}
  store ptr %4, ptr %3, align 8, !sec !{!"private", !"private"}
  %5 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %6 = icmp eq ptr %5, null, !sec !{!"private"}
  br i1 %6, label %7, label %8, !sec !{!"private"}

7:                                                ; preds = %1, !sec !{!"public"}
  call void @perror(ptr noundef @.str.27) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

8:                                                ; preds = %1, !sec !{!"private"}
  %9 = load i64, ptr %2, align 8, !sec !{!"private", !"private"}
  %10 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %11 = getelementptr inbounds %struct.record, ptr %10, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %9, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %12

12:                                               ; preds = %8, !sec !{!"private"}
  %13 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  ret ptr %13, !sec !{!"private"}
}

; Function Attrs: cold
declare !sec !{!"public", !"public", !{!"public"}} void @perror(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_node() #0 !sec !{!"private", !"private", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"private"}
  %2 = call ptr (i64, ...) @alloc_node(i64 noundef 56), !sec !{!"call", !"private", !{!"public"}}
  store ptr %2, ptr %1, align 8, !sec !{!"private", !"private"}
  %3 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %4 = icmp eq ptr %3, null, !sec !{!"private"}
  br i1 %4, label %5, label %6, !sec !{!"private"}

5:                                                ; preds = %0, !sec !{!"public"}
  call void @perror(ptr noundef @.str.28) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

6:                                                ; preds = %0, !sec !{!"private"}
  %7 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %8 = sub i64 %7, 1, !sec !{!"private"}
  %9 = mul i64 %8, 8, !sec !{!"private"}
  %10 = call ptr @allocate_align64(i64 noundef %9), !sec !{!"call", !"private", !{!"private"}}
  %11 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %10, ptr %12, align 8, !sec !{!"private", !"private"}
  %13 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = icmp eq ptr %15, null, !sec !{!"private"}
  br i1 %16, label %17, label %18, !sec !{!"private"}

17:                                               ; preds = %6, !sec !{!"public"}
  call void @perror(ptr noundef @.str.29) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

18:                                               ; preds = %6, !sec !{!"private"}
  %19 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %20 = mul i64 %19, 8, !sec !{!"private"}
  %21 = call ptr @allocate_align64(i64 noundef %20), !sec !{!"call", !"private", !{!"private"}}
  %22 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %21, ptr %23, align 8, !sec !{!"private", !"private"}
  %24 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %26 = load ptr, ptr %25, align 8, !sec !{!"private", !"private"}
  %27 = icmp eq ptr %26, null, !sec !{!"private"}
  br i1 %27, label %28, label %29, !sec !{!"private"}

28:                                               ; preds = %18, !sec !{!"public"}
  call void @perror(ptr noundef @.str.30) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

29:                                               ; preds = %18, !sec !{!"private"}
  %30 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %31 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  store i8 0, ptr %31, align 8, !sec !{!"private", !"private"}
  %32 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  store i64 0, ptr %33, align 8, !sec !{!"private", !"private"}
  %34 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %35, align 8, !sec !{!"private", !"private"}
  %36 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %37 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 6, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %37, align 8, !sec !{!"private", !"private"}
  %38 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  ret ptr %38, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate_align64(i64 noundef %0) #0 !sec !{!"private", !"private", !{!"private", !"public", !"public", !"public"}} {
  %2 = alloca i64, align 8, !sec !{!"public"}
  %3 = alloca ptr, align 8, !sec !{!"public"}
  store i64 %0, ptr %2, align 8, !sec !{!"public", !"public"}
  %4 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %5 = call i32 @posix_memalign(ptr noundef %3, i64 noundef 64, i64 noundef %4) #8, !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %6 = icmp ne i32 %5, 0, !sec !{!"public"}
  br i1 %6, label %7, label %9, !sec !{!"public"}

7:                                                ; preds = %1, !sec !{!"public"}
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.44), !sec !{!"call", !"public", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

9:                                                ; preds = %1, !sec !{!"public"}
  %10 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %12 = add i64 %11, %10, !sec !{!"public"}
  store i64 %12, ptr @allocator_stat, align 8
  %13 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  %14 = load i64, ptr %2, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 1 %13, i8 0, i64 %14, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %15 = load ptr, ptr %3, align 8, !sec !{!"public", !"public"}
  ret ptr %15, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_leaf() #0 !sec !{!"private", !"private", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"private"}
  %2 = call ptr @make_node(), !sec !{!"call", !"private", !{}}
  store ptr %2, ptr %1, align 8, !sec !{!"private", !"private"}
  %3 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  store i8 1, ptr %4, align 8, !sec !{!"private", !"private"}
  %5 = load ptr, ptr %1, align 8, !sec !{!"private", !"private"}
  ret ptr %5, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_left_index(ptr noundef %0, ptr noundef %1) #0 !sec !{!"private", !"private", !{!"private", !"private"}} {
  %3 = alloca ptr, align 8, !sec !{!"private"}
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %3, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %6

6:                                                ; preds = %23, %2, !sec !{!"private"}
  %7 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %8 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %10 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %11 = icmp ule i64 %7, %10, !sec !{!"private"}
  br i1 %11, label %12, label %21, !sec !{!"private"}

12:                                               ; preds = %6, !sec !{!"private"}
  %13 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %17 = getelementptr inbounds ptr, ptr %15, i64 %16, !sec !{!"private", !"private", !"private"}
  %18 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %19 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %20 = icmp ne ptr %18, %19, !sec !{!"private"}
  br label %21

21:                                               ; preds = %12, %6, !sec !{!"private"}
  %22 = phi i1 [ false, %6 ], [ %20, %12 ], !sec !{!"private", !"private", !"private"}
  br i1 %22, label %23, label %26, !sec !{!"private"}

23:                                               ; preds = %21, !sec !{!"private"}
  %24 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %25 = add i64 %24, 1, !sec !{!"private"}
  store i64 %25, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %6, !llvm.loop !26

26:                                               ; preds = %21, !sec !{!"private"}
  %27 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  ret i64 %27, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private"}} {
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %2, ptr %6, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %8, align 8, !sec !{!"private", !"private"}
  br label %9

9:                                                ; preds = %26, %3, !sec !{!"private"}
  %10 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %11 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %13 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %14 = icmp ult i64 %10, %13, !sec !{!"private"}
  br i1 %14, label %15, label %24, !sec !{!"private"}

15:                                               ; preds = %9, !sec !{!"private"}
  %16 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %18 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %20 = getelementptr inbounds i64, ptr %18, i64 %19, !sec !{!"private", !"private", !"private"}
  %21 = load i64, ptr %20, align 8, !sec !{!"private", !"private"}
  %22 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %23 = icmp ult i64 %21, %22, !sec !{!"private"}
  br label %24

24:                                               ; preds = %15, %9, !sec !{!"private"}
  %25 = phi i1 [ false, %9 ], [ %23, %15 ], !sec !{!"private", !"private", !"private"}
  br i1 %25, label %26, label %29, !sec !{!"private"}

26:                                               ; preds = %24, !sec !{!"private"}
  %27 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %28 = add i64 %27, 1, !sec !{!"private"}
  store i64 %28, ptr %8, align 8, !sec !{!"private", !"private"}
  br label %9, !llvm.loop !27

29:                                               ; preds = %24, !sec !{!"private"}
  %30 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %31 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %32 = load i64, ptr %31, align 8, !sec !{!"private", !"private"}
  store i64 %32, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %33

33:                                               ; preds = %62, %29, !sec !{!"private"}
  %34 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %35 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %36 = icmp ugt i64 %34, %35, !sec !{!"private"}
  br i1 %36, label %37, label %65, !sec !{!"private"}

37:                                               ; preds = %33, !sec !{!"private"}
  %38 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %39 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %40 = load ptr, ptr %39, align 8, !sec !{!"private", !"private"}
  %41 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %42 = sub i64 %41, 1, !sec !{!"private"}
  %43 = getelementptr inbounds i64, ptr %40, i64 %42, !sec !{!"private", !"private", !"private"}
  %44 = load i64, ptr %43, align 8, !sec !{!"private", !"private"}
  %45 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %46 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %47 = load ptr, ptr %46, align 8, !sec !{!"private", !"private"}
  %48 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %49 = getelementptr inbounds i64, ptr %47, i64 %48, !sec !{!"private", !"private", !"private"}
  store i64 %44, ptr %49, align 8, !sec !{!"private", !"private"}
  %50 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %52 = load ptr, ptr %51, align 8, !sec !{!"private", !"private"}
  %53 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %54 = sub i64 %53, 1, !sec !{!"private"}
  %55 = getelementptr inbounds ptr, ptr %52, i64 %54, !sec !{!"private", !"private", !"private"}
  %56 = load ptr, ptr %55, align 8, !sec !{!"private", !"private"}
  %57 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %59 = load ptr, ptr %58, align 8, !sec !{!"private", !"private"}
  %60 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %61 = getelementptr inbounds ptr, ptr %59, i64 %60, !sec !{!"private", !"private", !"private"}
  store ptr %56, ptr %61, align 8, !sec !{!"private", !"private"}
  br label %62

62:                                               ; preds = %37, !sec !{!"private"}
  %63 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %64 = add i64 %63, -1, !sec !{!"private"}
  store i64 %64, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %33, !llvm.loop !28

65:                                               ; preds = %33, !sec !{!"private"}
  %66 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %67 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %69 = load ptr, ptr %68, align 8, !sec !{!"private", !"private"}
  %70 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %71 = getelementptr inbounds i64, ptr %69, i64 %70, !sec !{!"private", !"private", !"private"}
  store i64 %66, ptr %71, align 8, !sec !{!"private", !"private"}
  %72 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %73 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %74 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %75 = load ptr, ptr %74, align 8, !sec !{!"private", !"private"}
  %76 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %77 = getelementptr inbounds ptr, ptr %75, i64 %76, !sec !{!"private", !"private", !"private"}
  store ptr %72, ptr %77, align 8, !sec !{!"private", !"private"}
  %78 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %79 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %80 = load i64, ptr %79, align 8, !sec !{!"private", !"private"}
  %81 = add i64 %80, 1, !sec !{!"private"}
  store i64 %81, ptr %79, align 8, !sec !{!"private", !"private"}
  %82 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  ret ptr %82, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf_after_splitting(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private"}} {
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca ptr, align 8, !sec !{!"private"}
  %9 = alloca ptr, align 8, !sec !{!"private"}
  %10 = alloca ptr, align 8, !sec !{!"private"}
  %11 = alloca ptr, align 8, !sec !{!"private"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"private"}
  %15 = alloca i64, align 8, !sec !{!"private"}
  %16 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %6, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %7, align 8, !sec !{!"private", !"private"}
  store ptr %3, ptr %8, align 8, !sec !{!"private", !"private"}
  %17 = call ptr @make_leaf(), !sec !{!"call", !"private", !{}}
  store ptr %17, ptr %9, align 8, !sec !{!"private", !"private"}
  %18 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %19 = add i64 %18, 1, !sec !{!"private"}
  %20 = mul i64 %19, 8, !sec !{!"private"}
  %21 = call ptr @allocate_align64(i64 noundef %20), !sec !{!"call", !"private", !{!"private"}}
  store ptr %21, ptr %10, align 8, !sec !{!"private", !"private"}
  %22 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %23 = icmp eq ptr %22, null, !sec !{!"private"}
  br i1 %23, label %24, label %25, !sec !{!"private"}

24:                                               ; preds = %4, !sec !{!"public"}
  call void @perror(ptr noundef @.str.31) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

25:                                               ; preds = %4, !sec !{!"private"}
  %26 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %27 = add i64 %26, 1, !sec !{!"private"}
  %28 = mul i64 %27, 8, !sec !{!"private"}
  %29 = call ptr @allocate_align64(i64 noundef %28), !sec !{!"call", !"private", !{!"private"}}
  store ptr %29, ptr %11, align 8, !sec !{!"private", !"private"}
  %30 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %31 = icmp eq ptr %30, null, !sec !{!"private"}
  br i1 %31, label %32, label %33, !sec !{!"private"}

32:                                               ; preds = %25, !sec !{!"public"}
  call void @perror(ptr noundef @.str.32) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

33:                                               ; preds = %25, !sec !{!"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %34

34:                                               ; preds = %50, %33, !sec !{!"private"}
  %35 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %36 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %37 = sub i64 %36, 1, !sec !{!"private"}
  %38 = icmp ult i64 %35, %37, !sec !{!"private"}
  br i1 %38, label %39, label %48, !sec !{!"private"}

39:                                               ; preds = %34, !sec !{!"private"}
  %40 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %41 = getelementptr inbounds %struct.node, ptr %40, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %42 = load ptr, ptr %41, align 8, !sec !{!"private", !"private"}
  %43 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %44 = getelementptr inbounds i64, ptr %42, i64 %43, !sec !{!"private", !"private", !"private"}
  %45 = load i64, ptr %44, align 8, !sec !{!"private", !"private"}
  %46 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %47 = icmp ult i64 %45, %46, !sec !{!"private"}
  br label %48

48:                                               ; preds = %39, %34, !sec !{!"private"}
  %49 = phi i1 [ false, %34 ], [ %47, %39 ], !sec !{!"private", !"private", !"private"}
  br i1 %49, label %50, label %53, !sec !{!"private"}

50:                                               ; preds = %48, !sec !{!"private"}
  %51 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %52 = add i64 %51, 1, !sec !{!"private"}
  store i64 %52, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %34, !llvm.loop !29

53:                                               ; preds = %48, !sec !{!"private"}
  store i64 0, ptr %15, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %16, align 8, !sec !{!"private", !"private"}
  br label %54

54:                                               ; preds = %86, %53, !sec !{!"private"}
  %55 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %56 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %58 = load i64, ptr %57, align 8, !sec !{!"private", !"private"}
  %59 = icmp ult i64 %55, %58, !sec !{!"private"}
  br i1 %59, label %60, label %91, !sec !{!"private"}

60:                                               ; preds = %54, !sec !{!"private"}
  %61 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %62 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %63 = icmp eq i64 %61, %62, !sec !{!"private"}
  br i1 %63, label %64, label %67, !sec !{!"private"}

64:                                               ; preds = %60, !sec !{!"private"}
  %65 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %66 = add i64 %65, 1, !sec !{!"private"}
  store i64 %66, ptr %16, align 8, !sec !{!"private", !"private"}
  br label %67

67:                                               ; preds = %64, %60, !sec !{!"private"}
  %68 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %70 = load ptr, ptr %69, align 8, !sec !{!"private", !"private"}
  %71 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %72 = getelementptr inbounds i64, ptr %70, i64 %71, !sec !{!"private", !"private", !"private"}
  %73 = load i64, ptr %72, align 8, !sec !{!"private", !"private"}
  %74 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %75 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %76 = getelementptr inbounds i64, ptr %74, i64 %75, !sec !{!"private", !"private", !"private"}
  store i64 %73, ptr %76, align 8, !sec !{!"private", !"private"}
  %77 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %79 = load ptr, ptr %78, align 8, !sec !{!"private", !"private"}
  %80 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %81 = getelementptr inbounds ptr, ptr %79, i64 %80, !sec !{!"private", !"private", !"private"}
  %82 = load ptr, ptr %81, align 8, !sec !{!"private", !"private"}
  %83 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %84 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %85 = getelementptr inbounds ptr, ptr %83, i64 %84, !sec !{!"private", !"private", !"private"}
  store ptr %82, ptr %85, align 8, !sec !{!"private", !"private"}
  br label %86

86:                                               ; preds = %67, !sec !{!"private"}
  %87 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %88 = add i64 %87, 1, !sec !{!"private"}
  store i64 %88, ptr %15, align 8, !sec !{!"private", !"private"}
  %89 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %90 = add i64 %89, 1, !sec !{!"private"}
  store i64 %90, ptr %16, align 8, !sec !{!"private", !"private"}
  br label %54, !llvm.loop !30

91:                                               ; preds = %54, !sec !{!"private"}
  %92 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %93 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %94 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %95 = getelementptr inbounds i64, ptr %93, i64 %94, !sec !{!"private", !"private", !"private"}
  store i64 %92, ptr %95, align 8, !sec !{!"private", !"private"}
  %96 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %97 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %98 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %99 = getelementptr inbounds ptr, ptr %97, i64 %98, !sec !{!"private", !"private", !"private"}
  store ptr %96, ptr %99, align 8, !sec !{!"private", !"private"}
  %100 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  store i64 0, ptr %101, align 8, !sec !{!"private", !"private"}
  %102 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %103 = sub i64 %102, 1, !sec !{!"private"}
  %104 = call i64 @cut(i64 noundef %103), !sec !{!"call", !"private", !{!"private"}}
  store i64 %104, ptr %13, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %105

105:                                              ; preds = %132, %91, !sec !{!"private"}
  %106 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %107 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %108 = icmp ult i64 %106, %107, !sec !{!"private"}
  br i1 %108, label %109, label %135, !sec !{!"private"}

109:                                              ; preds = %105, !sec !{!"private"}
  %110 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %111 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %112 = getelementptr inbounds ptr, ptr %110, i64 %111, !sec !{!"private", !"private", !"private"}
  %113 = load ptr, ptr %112, align 8, !sec !{!"private", !"private"}
  %114 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %115 = getelementptr inbounds %struct.node, ptr %114, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %116 = load ptr, ptr %115, align 8, !sec !{!"private", !"private"}
  %117 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %118 = getelementptr inbounds ptr, ptr %116, i64 %117, !sec !{!"private", !"private", !"private"}
  store ptr %113, ptr %118, align 8, !sec !{!"private", !"private"}
  %119 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %120 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %121 = getelementptr inbounds i64, ptr %119, i64 %120, !sec !{!"private", !"private", !"private"}
  %122 = load i64, ptr %121, align 8, !sec !{!"private", !"private"}
  %123 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %125 = load ptr, ptr %124, align 8, !sec !{!"private", !"private"}
  %126 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %127 = getelementptr inbounds i64, ptr %125, i64 %126, !sec !{!"private", !"private", !"private"}
  store i64 %122, ptr %127, align 8, !sec !{!"private", !"private"}
  %128 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %129 = getelementptr inbounds %struct.node, ptr %128, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %130 = load i64, ptr %129, align 8, !sec !{!"private", !"private"}
  %131 = add i64 %130, 1, !sec !{!"private"}
  store i64 %131, ptr %129, align 8, !sec !{!"private", !"private"}
  br label %132

132:                                              ; preds = %109, !sec !{!"private"}
  %133 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %134 = add i64 %133, 1, !sec !{!"private"}
  store i64 %134, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %105, !llvm.loop !31

135:                                              ; preds = %105, !sec !{!"private"}
  %136 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  store i64 %136, ptr %15, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %16, align 8, !sec !{!"private", !"private"}
  br label %137

137:                                              ; preds = %164, %135, !sec !{!"private"}
  %138 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %139 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %140 = icmp ult i64 %138, %139, !sec !{!"private"}
  br i1 %140, label %141, label %169, !sec !{!"private"}

141:                                              ; preds = %137, !sec !{!"private"}
  %142 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %143 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %144 = getelementptr inbounds ptr, ptr %142, i64 %143, !sec !{!"private", !"private", !"private"}
  %145 = load ptr, ptr %144, align 8, !sec !{!"private", !"private"}
  %146 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %147 = getelementptr inbounds %struct.node, ptr %146, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %148 = load ptr, ptr %147, align 8, !sec !{!"private", !"private"}
  %149 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %150 = getelementptr inbounds ptr, ptr %148, i64 %149, !sec !{!"private", !"private", !"private"}
  store ptr %145, ptr %150, align 8, !sec !{!"private", !"private"}
  %151 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %152 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %153 = getelementptr inbounds i64, ptr %151, i64 %152, !sec !{!"private", !"private", !"private"}
  %154 = load i64, ptr %153, align 8, !sec !{!"private", !"private"}
  %155 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %156 = getelementptr inbounds %struct.node, ptr %155, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %157 = load ptr, ptr %156, align 8, !sec !{!"private", !"private"}
  %158 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %159 = getelementptr inbounds i64, ptr %157, i64 %158, !sec !{!"private", !"private", !"private"}
  store i64 %154, ptr %159, align 8, !sec !{!"private", !"private"}
  %160 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %161 = getelementptr inbounds %struct.node, ptr %160, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %162 = load i64, ptr %161, align 8, !sec !{!"private", !"private"}
  %163 = add i64 %162, 1, !sec !{!"private"}
  store i64 %163, ptr %161, align 8, !sec !{!"private", !"private"}
  br label %164

164:                                              ; preds = %141, !sec !{!"private"}
  %165 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %166 = add i64 %165, 1, !sec !{!"private"}
  store i64 %166, ptr %15, align 8, !sec !{!"private", !"private"}
  %167 = load i64, ptr %16, align 8, !sec !{!"private", !"private"}
  %168 = add i64 %167, 1, !sec !{!"private"}
  store i64 %168, ptr %16, align 8, !sec !{!"private", !"private"}
  br label %137, !llvm.loop !32

169:                                              ; preds = %137, !sec !{!"private"}
  %170 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %170) #8, !sec !{!"free", !"private"}
  %171 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %171) #8, !sec !{!"free", !"private"}
  %172 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %173 = getelementptr inbounds %struct.node, ptr %172, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %174 = load ptr, ptr %173, align 8, !sec !{!"private", !"private"}
  %175 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %176 = sub i64 %175, 1, !sec !{!"private"}
  %177 = getelementptr inbounds ptr, ptr %174, i64 %176, !sec !{!"private", !"private", !"private"}
  %178 = load ptr, ptr %177, align 8, !sec !{!"private", !"private"}
  %179 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %180 = getelementptr inbounds %struct.node, ptr %179, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %181 = load ptr, ptr %180, align 8, !sec !{!"private", !"private"}
  %182 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %183 = sub i64 %182, 1, !sec !{!"private"}
  %184 = getelementptr inbounds ptr, ptr %181, i64 %183, !sec !{!"private", !"private", !"private"}
  store ptr %178, ptr %184, align 8, !sec !{!"private", !"private"}
  %185 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %186 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %187 = getelementptr inbounds %struct.node, ptr %186, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %188 = load ptr, ptr %187, align 8, !sec !{!"private", !"private"}
  %189 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %190 = sub i64 %189, 1, !sec !{!"private"}
  %191 = getelementptr inbounds ptr, ptr %188, i64 %190, !sec !{!"private", !"private", !"private"}
  store ptr %185, ptr %191, align 8, !sec !{!"private", !"private"}
  %192 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %193 = getelementptr inbounds %struct.node, ptr %192, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %194 = load i64, ptr %193, align 8, !sec !{!"private", !"private"}
  store i64 %194, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %195

195:                                              ; preds = %206, %169, !sec !{!"private"}
  %196 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %197 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %198 = sub i64 %197, 1, !sec !{!"private"}
  %199 = icmp ult i64 %196, %198, !sec !{!"private"}
  br i1 %199, label %200, label %209, !sec !{!"private"}

200:                                              ; preds = %195, !sec !{!"private"}
  %201 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %202 = getelementptr inbounds %struct.node, ptr %201, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %203 = load ptr, ptr %202, align 8, !sec !{!"private", !"private"}
  %204 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %205 = getelementptr inbounds ptr, ptr %203, i64 %204, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %205, align 8, !sec !{!"private", !"private"}
  br label %206

206:                                              ; preds = %200, !sec !{!"private"}
  %207 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %208 = add i64 %207, 1, !sec !{!"private"}
  store i64 %208, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %195, !llvm.loop !33

209:                                              ; preds = %195, !sec !{!"private"}
  %210 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %211 = getelementptr inbounds %struct.node, ptr %210, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %212 = load i64, ptr %211, align 8, !sec !{!"private", !"private"}
  store i64 %212, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %213

213:                                              ; preds = %224, %209, !sec !{!"private"}
  %214 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %215 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %216 = sub i64 %215, 1, !sec !{!"private"}
  %217 = icmp ult i64 %214, %216, !sec !{!"private"}
  br i1 %217, label %218, label %227, !sec !{!"private"}

218:                                              ; preds = %213, !sec !{!"private"}
  %219 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %220 = getelementptr inbounds %struct.node, ptr %219, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %221 = load ptr, ptr %220, align 8, !sec !{!"private", !"private"}
  %222 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %223 = getelementptr inbounds ptr, ptr %221, i64 %222, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %223, align 8, !sec !{!"private", !"private"}
  br label %224

224:                                              ; preds = %218, !sec !{!"private"}
  %225 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %226 = add i64 %225, 1, !sec !{!"private"}
  store i64 %226, ptr %15, align 8, !sec !{!"private", !"private"}
  br label %213, !llvm.loop !34

227:                                              ; preds = %213, !sec !{!"private"}
  %228 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %229 = getelementptr inbounds %struct.node, ptr %228, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %230 = load ptr, ptr %229, align 8, !sec !{!"private", !"private"}
  %231 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %232 = getelementptr inbounds %struct.node, ptr %231, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %230, ptr %232, align 8, !sec !{!"private", !"private"}
  %233 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %234 = getelementptr inbounds %struct.node, ptr %233, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %235 = load ptr, ptr %234, align 8, !sec !{!"private", !"private"}
  %236 = getelementptr inbounds i64, ptr %235, i64 0, !sec !{!"private", !"private", !"public"}
  %237 = load i64, ptr %236, align 8, !sec !{!"private", !"private"}
  store i64 %237, ptr %14, align 8, !sec !{!"private", !"private"}
  %238 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %239 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %240 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %241 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %242 = call ptr @insert_into_parent(ptr noundef %238, ptr noundef %239, i64 noundef %240, ptr noundef %241), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private"}}
  ret ptr %242, !sec !{!"private"}
}

; Function Attrs: nounwind
declare !sec !{!"void", !"public", !{}} void @free(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_parent(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private"}} {
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  %9 = alloca ptr, align 8, !sec !{!"private"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %7, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %8, align 8, !sec !{!"private", !"private"}
  store ptr %3, ptr %9, align 8, !sec !{!"private", !"private"}
  %12 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %14 = load ptr, ptr %13, align 8, !sec !{!"private", !"private"}
  store ptr %14, ptr %11, align 8, !sec !{!"private", !"private"}
  %15 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %16 = icmp eq ptr %15, null, !sec !{!"private"}
  br i1 %16, label %17, label %22, !sec !{!"private"}

17:                                               ; preds = %4, !sec !{!"private"}
  %18 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %20 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %21 = call ptr @insert_into_new_root(ptr noundef %18, i64 noundef %19, ptr noundef %20), !sec !{!"call", !"private", !{!"private", !"private", !"private"}}
  store ptr %21, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %46

22:                                               ; preds = %4, !sec !{!"private"}
  %23 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %24 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %25 = call i64 @get_left_index(ptr noundef %23, ptr noundef %24), !sec !{!"call", !"private", !{!"private", !"private"}}
  store i64 %25, ptr %10, align 8, !sec !{!"private", !"private"}
  %26 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i64, ptr %27, align 8, !sec !{!"private", !"private"}
  %29 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %30 = sub i64 %29, 1, !sec !{!"private"}
  %31 = icmp ult i64 %28, %30, !sec !{!"private"}
  br i1 %31, label %32, label %39, !sec !{!"private"}

32:                                               ; preds = %22, !sec !{!"private"}
  %33 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %34 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %35 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %36 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %37 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %38 = call ptr @insert_into_node(ptr noundef %33, ptr noundef %34, i64 noundef %35, i64 noundef %36, ptr noundef %37), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private", !"private"}}
  store ptr %38, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %46

39:                                               ; preds = %22, !sec !{!"private"}
  %40 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %41 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %42 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %43 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %44 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %45 = call ptr @insert_into_node_after_splitting(ptr noundef %40, ptr noundef %41, i64 noundef %42, i64 noundef %43, ptr noundef %44), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private", !"private"}}
  store ptr %45, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %46

46:                                               ; preds = %39, %32, %17, !sec !{!"private"}
  %47 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  ret ptr %47, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_new_root(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private"}} {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = call ptr @make_node()
  store ptr %8, ptr %7, align 8
  %9 = load i64, ptr %5, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds i64, ptr %12, i64 0
  store i64 %9, ptr %13, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  store ptr %14, ptr %18, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 1
  store ptr %19, ptr %23, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 4
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr %25, align 8
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds %struct.node, ptr %28, i32 0, i32 2
  store ptr null, ptr %29, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 2
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 2
  store ptr %33, ptr %35, align 8
  %36 = load ptr, ptr %7, align 8
  ret ptr %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %4) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private", !"private"}} {
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  %9 = alloca i64, align 8, !sec !{!"private"}
  %10 = alloca ptr, align 8, !sec !{!"private"}
  %11 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %7, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %8, align 8, !sec !{!"private", !"private"}
  store i64 %3, ptr %9, align 8, !sec !{!"private", !"private"}
  store ptr %4, ptr %10, align 8, !sec !{!"private", !"private"}
  %12 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %14 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  store i64 %14, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %15

15:                                               ; preds = %44, %5, !sec !{!"private"}
  %16 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %17 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %18 = icmp ugt i64 %16, %17, !sec !{!"private"}
  br i1 %18, label %19, label %47, !sec !{!"private"}

19:                                               ; preds = %15, !sec !{!"private"}
  %20 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %21 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %22 = load ptr, ptr %21, align 8, !sec !{!"private", !"private"}
  %23 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %24 = getelementptr inbounds ptr, ptr %22, i64 %23, !sec !{!"private", !"private", !"private"}
  %25 = load ptr, ptr %24, align 8, !sec !{!"private", !"private"}
  %26 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load ptr, ptr %27, align 8, !sec !{!"private", !"private"}
  %29 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %30 = add i64 %29, 1, !sec !{!"private"}
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30, !sec !{!"private", !"private", !"private"}
  store ptr %25, ptr %31, align 8, !sec !{!"private", !"private"}
  %32 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %34 = load ptr, ptr %33, align 8, !sec !{!"private", !"private"}
  %35 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %36 = sub i64 %35, 1, !sec !{!"private"}
  %37 = getelementptr inbounds i64, ptr %34, i64 %36, !sec !{!"private", !"private", !"private"}
  %38 = load i64, ptr %37, align 8, !sec !{!"private", !"private"}
  %39 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %40 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %41 = load ptr, ptr %40, align 8, !sec !{!"private", !"private"}
  %42 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %43 = getelementptr inbounds i64, ptr %41, i64 %42, !sec !{!"private", !"private", !"private"}
  store i64 %38, ptr %43, align 8, !sec !{!"private", !"private"}
  br label %44

44:                                               ; preds = %19, !sec !{!"private"}
  %45 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %46 = add i64 %45, -1, !sec !{!"private"}
  store i64 %46, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %15, !llvm.loop !35

47:                                               ; preds = %15, !sec !{!"private"}
  %48 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %49 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %51 = load ptr, ptr %50, align 8, !sec !{!"private", !"private"}
  %52 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %53 = add i64 %52, 1, !sec !{!"private"}
  %54 = getelementptr inbounds ptr, ptr %51, i64 %53, !sec !{!"private", !"private", !"private"}
  store ptr %48, ptr %54, align 8, !sec !{!"private", !"private"}
  %55 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %56 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %58 = load ptr, ptr %57, align 8, !sec !{!"private", !"private"}
  %59 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %60 = getelementptr inbounds i64, ptr %58, i64 %59, !sec !{!"private", !"private", !"private"}
  store i64 %55, ptr %60, align 8, !sec !{!"private", !"private"}
  %61 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %62 = getelementptr inbounds %struct.node, ptr %61, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %63 = load i64, ptr %62, align 8, !sec !{!"private", !"private"}
  %64 = add i64 %63, 1, !sec !{!"private"}
  store i64 %64, ptr %62, align 8, !sec !{!"private", !"private"}
  %65 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  ret ptr %65, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node_after_splitting(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %4) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private", !"private"}} {
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  %9 = alloca i64, align 8, !sec !{!"private"}
  %10 = alloca ptr, align 8, !sec !{!"private"}
  %11 = alloca i64, align 8, !sec !{!"private"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"private"}
  %15 = alloca ptr, align 8, !sec !{!"private"}
  %16 = alloca ptr, align 8, !sec !{!"private"}
  %17 = alloca ptr, align 8, !sec !{!"private"}
  %18 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %7, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %8, align 8, !sec !{!"private", !"private"}
  store i64 %3, ptr %9, align 8, !sec !{!"private", !"private"}
  store ptr %4, ptr %10, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %20 = add i64 %19, 1, !sec !{!"private"}
  %21 = mul i64 %20, 8, !sec !{!"private"}
  %22 = call ptr @allocate_align64(i64 noundef %21), !sec !{!"call", !"private", !{!"private"}}
  store ptr %22, ptr %18, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %24 = icmp eq ptr %23, null, !sec !{!"private"}
  br i1 %24, label %25, label %26, !sec !{!"private"}

25:                                               ; preds = %5, !sec !{!"public"}
  call void @perror(ptr noundef @.str.33) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

26:                                               ; preds = %5, !sec !{!"private"}
  %27 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %28 = mul i64 %27, 8, !sec !{!"private"}
  %29 = call ptr @allocate_align64(i64 noundef %28), !sec !{!"call", !"private", !{!"private"}}
  store ptr %29, ptr %17, align 8, !sec !{!"private", !"private"}
  %30 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %31 = icmp eq ptr %30, null, !sec !{!"private"}
  br i1 %31, label %32, label %33, !sec !{!"private"}

32:                                               ; preds = %26, !sec !{!"public"}
  call void @perror(ptr noundef @.str.34) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

33:                                               ; preds = %26, !sec !{!"private"}
  store i64 0, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %34

34:                                               ; preds = %59, %33, !sec !{!"private"}
  %35 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %36 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %37 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %38 = load i64, ptr %37, align 8, !sec !{!"private", !"private"}
  %39 = add i64 %38, 1, !sec !{!"private"}
  %40 = icmp ult i64 %35, %39, !sec !{!"private"}
  br i1 %40, label %41, label %64, !sec !{!"private"}

41:                                               ; preds = %34, !sec !{!"private"}
  %42 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %43 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %44 = add i64 %43, 1, !sec !{!"private"}
  %45 = icmp eq i64 %42, %44, !sec !{!"private"}
  br i1 %45, label %46, label %49, !sec !{!"private"}

46:                                               ; preds = %41, !sec !{!"private"}
  %47 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %48 = add i64 %47, 1, !sec !{!"private"}
  store i64 %48, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %49

49:                                               ; preds = %46, %41, !sec !{!"private"}
  %50 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %52 = load ptr, ptr %51, align 8, !sec !{!"private", !"private"}
  %53 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %54 = getelementptr inbounds ptr, ptr %52, i64 %53, !sec !{!"private", !"private", !"private"}
  %55 = load ptr, ptr %54, align 8, !sec !{!"private", !"private"}
  %56 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %57 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %58 = getelementptr inbounds ptr, ptr %56, i64 %57, !sec !{!"private", !"private", !"private"}
  store ptr %55, ptr %58, align 8, !sec !{!"private", !"private"}
  br label %59

59:                                               ; preds = %49, !sec !{!"private"}
  %60 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %61 = add i64 %60, 1, !sec !{!"private"}
  store i64 %61, ptr %11, align 8, !sec !{!"private", !"private"}
  %62 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %63 = add i64 %62, 1, !sec !{!"private"}
  store i64 %63, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %34, !llvm.loop !36

64:                                               ; preds = %34, !sec !{!"private"}
  store i64 0, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %65

65:                                               ; preds = %88, %64, !sec !{!"private"}
  %66 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %67 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %69 = load i64, ptr %68, align 8, !sec !{!"private", !"private"}
  %70 = icmp ult i64 %66, %69, !sec !{!"private"}
  br i1 %70, label %71, label %93, !sec !{!"private"}

71:                                               ; preds = %65, !sec !{!"private"}
  %72 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %73 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %74 = icmp eq i64 %72, %73, !sec !{!"private"}
  br i1 %74, label %75, label %78, !sec !{!"private"}

75:                                               ; preds = %71, !sec !{!"private"}
  %76 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %77 = add i64 %76, 1, !sec !{!"private"}
  store i64 %77, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %78

78:                                               ; preds = %75, %71, !sec !{!"private"}
  %79 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %81 = load ptr, ptr %80, align 8, !sec !{!"private", !"private"}
  %82 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %83 = getelementptr inbounds i64, ptr %81, i64 %82, !sec !{!"private", !"private", !"private"}
  %84 = load i64, ptr %83, align 8, !sec !{!"private", !"private"}
  %85 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %86 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %87 = getelementptr inbounds i64, ptr %85, i64 %86, !sec !{!"private", !"private", !"private"}
  store i64 %84, ptr %87, align 8, !sec !{!"private", !"private"}
  br label %88

88:                                               ; preds = %78, !sec !{!"private"}
  %89 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %90 = add i64 %89, 1, !sec !{!"private"}
  store i64 %90, ptr %11, align 8, !sec !{!"private", !"private"}
  %91 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %92 = add i64 %91, 1, !sec !{!"private"}
  store i64 %92, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %65, !llvm.loop !37

93:                                               ; preds = %65, !sec !{!"private"}
  %94 = load ptr, ptr %10, align 8, !sec !{!"private", !"private"}
  %95 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %96 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %97 = add i64 %96, 1, !sec !{!"private"}
  %98 = getelementptr inbounds ptr, ptr %95, i64 %97, !sec !{!"private", !"private", !"private"}
  store ptr %94, ptr %98, align 8, !sec !{!"private", !"private"}
  %99 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %100 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %101 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %102 = getelementptr inbounds i64, ptr %100, i64 %101, !sec !{!"private", !"private", !"private"}
  store i64 %99, ptr %102, align 8, !sec !{!"private", !"private"}
  %103 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %104 = call i64 @cut(i64 noundef %103), !sec !{!"call", !"private", !{!"private"}}
  store i64 %104, ptr %13, align 8, !sec !{!"private", !"private"}
  %105 = call ptr @make_node(), !sec !{!"call", !"private", !{}}
  store ptr %105, ptr %15, align 8, !sec !{!"private", !"private"}
  %106 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  store i64 0, ptr %107, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %108

108:                                              ; preds = %136, %93, !sec !{!"private"}
  %109 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %110 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %111 = sub i64 %110, 1, !sec !{!"private"}
  %112 = icmp ult i64 %109, %111, !sec !{!"private"}
  br i1 %112, label %113, label %139, !sec !{!"private"}

113:                                              ; preds = %108, !sec !{!"private"}
  %114 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %115 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %116 = getelementptr inbounds ptr, ptr %114, i64 %115, !sec !{!"private", !"private", !"private"}
  %117 = load ptr, ptr %116, align 8, !sec !{!"private", !"private"}
  %118 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %119 = getelementptr inbounds %struct.node, ptr %118, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %120 = load ptr, ptr %119, align 8, !sec !{!"private", !"private"}
  %121 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %122 = getelementptr inbounds ptr, ptr %120, i64 %121, !sec !{!"private", !"private", !"private"}
  store ptr %117, ptr %122, align 8, !sec !{!"private", !"private"}
  %123 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %124 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %125 = getelementptr inbounds i64, ptr %123, i64 %124, !sec !{!"private", !"private", !"private"}
  %126 = load i64, ptr %125, align 8, !sec !{!"private", !"private"}
  %127 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %128 = getelementptr inbounds %struct.node, ptr %127, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %129 = load ptr, ptr %128, align 8, !sec !{!"private", !"private"}
  %130 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %131 = getelementptr inbounds i64, ptr %129, i64 %130, !sec !{!"private", !"private", !"private"}
  store i64 %126, ptr %131, align 8, !sec !{!"private", !"private"}
  %132 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %133 = getelementptr inbounds %struct.node, ptr %132, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %134 = load i64, ptr %133, align 8, !sec !{!"private", !"private"}
  %135 = add i64 %134, 1, !sec !{!"private"}
  store i64 %135, ptr %133, align 8, !sec !{!"private", !"private"}
  br label %136

136:                                              ; preds = %113, !sec !{!"private"}
  %137 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %138 = add i64 %137, 1, !sec !{!"private"}
  store i64 %138, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %108, !llvm.loop !38

139:                                              ; preds = %108, !sec !{!"private"}
  %140 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %141 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %142 = getelementptr inbounds ptr, ptr %140, i64 %141, !sec !{!"private", !"private", !"private"}
  %143 = load ptr, ptr %142, align 8, !sec !{!"private", !"private"}
  %144 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %145 = getelementptr inbounds %struct.node, ptr %144, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %146 = load ptr, ptr %145, align 8, !sec !{!"private", !"private"}
  %147 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %148 = getelementptr inbounds ptr, ptr %146, i64 %147, !sec !{!"private", !"private", !"private"}
  store ptr %143, ptr %148, align 8, !sec !{!"private", !"private"}
  %149 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %150 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %151 = sub i64 %150, 1, !sec !{!"private"}
  %152 = getelementptr inbounds i64, ptr %149, i64 %151, !sec !{!"private", !"private", !"private"}
  %153 = load i64, ptr %152, align 8, !sec !{!"private", !"private"}
  store i64 %153, ptr %14, align 8, !sec !{!"private", !"private"}
  %154 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %155 = add i64 %154, 1, !sec !{!"private"}
  store i64 %155, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %156

156:                                              ; preds = %183, %139, !sec !{!"private"}
  %157 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %158 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %159 = icmp ult i64 %157, %158, !sec !{!"private"}
  br i1 %159, label %160, label %188, !sec !{!"private"}

160:                                              ; preds = %156, !sec !{!"private"}
  %161 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %162 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %163 = getelementptr inbounds ptr, ptr %161, i64 %162, !sec !{!"private", !"private", !"private"}
  %164 = load ptr, ptr %163, align 8, !sec !{!"private", !"private"}
  %165 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %166 = getelementptr inbounds %struct.node, ptr %165, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %167 = load ptr, ptr %166, align 8, !sec !{!"private", !"private"}
  %168 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %169 = getelementptr inbounds ptr, ptr %167, i64 %168, !sec !{!"private", !"private", !"private"}
  store ptr %164, ptr %169, align 8, !sec !{!"private", !"private"}
  %170 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %171 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %172 = getelementptr inbounds i64, ptr %170, i64 %171, !sec !{!"private", !"private", !"private"}
  %173 = load i64, ptr %172, align 8, !sec !{!"private", !"private"}
  %174 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %175 = getelementptr inbounds %struct.node, ptr %174, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %176 = load ptr, ptr %175, align 8, !sec !{!"private", !"private"}
  %177 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %178 = getelementptr inbounds i64, ptr %176, i64 %177, !sec !{!"private", !"private", !"private"}
  store i64 %173, ptr %178, align 8, !sec !{!"private", !"private"}
  %179 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %180 = getelementptr inbounds %struct.node, ptr %179, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %181 = load i64, ptr %180, align 8, !sec !{!"private", !"private"}
  %182 = add i64 %181, 1, !sec !{!"private"}
  store i64 %182, ptr %180, align 8, !sec !{!"private", !"private"}
  br label %183

183:                                              ; preds = %160, !sec !{!"private"}
  %184 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %185 = add i64 %184, 1, !sec !{!"private"}
  store i64 %185, ptr %11, align 8, !sec !{!"private", !"private"}
  %186 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %187 = add i64 %186, 1, !sec !{!"private"}
  store i64 %187, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %156, !llvm.loop !39

188:                                              ; preds = %156, !sec !{!"private"}
  %189 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %190 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %191 = getelementptr inbounds ptr, ptr %189, i64 %190, !sec !{!"private", !"private", !"private"}
  %192 = load ptr, ptr %191, align 8, !sec !{!"private", !"private"}
  %193 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %194 = getelementptr inbounds %struct.node, ptr %193, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %195 = load ptr, ptr %194, align 8, !sec !{!"private", !"private"}
  %196 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %197 = getelementptr inbounds ptr, ptr %195, i64 %196, !sec !{!"private", !"private", !"private"}
  store ptr %192, ptr %197, align 8, !sec !{!"private", !"private"}
  %198 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %198) #8, !sec !{!"free", !"private"}
  %199 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %199) #8, !sec !{!"free", !"private"}
  %200 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %201 = getelementptr inbounds %struct.node, ptr %200, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %202 = load ptr, ptr %201, align 8, !sec !{!"private", !"private"}
  %203 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %204 = getelementptr inbounds %struct.node, ptr %203, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %202, ptr %204, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %205

205:                                              ; preds = %221, %188, !sec !{!"private"}
  %206 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %207 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %208 = getelementptr inbounds %struct.node, ptr %207, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %209 = load i64, ptr %208, align 8, !sec !{!"private", !"private"}
  %210 = icmp ule i64 %206, %209, !sec !{!"private"}
  br i1 %210, label %211, label %224, !sec !{!"private"}

211:                                              ; preds = %205, !sec !{!"private"}
  %212 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %213 = getelementptr inbounds %struct.node, ptr %212, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %214 = load ptr, ptr %213, align 8, !sec !{!"private", !"private"}
  %215 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %216 = getelementptr inbounds ptr, ptr %214, i64 %215, !sec !{!"private", !"private", !"private"}
  %217 = load ptr, ptr %216, align 8, !sec !{!"private", !"private"}
  store ptr %217, ptr %16, align 8, !sec !{!"private", !"private"}
  %218 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %219 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %220 = getelementptr inbounds %struct.node, ptr %219, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %218, ptr %220, align 8, !sec !{!"private", !"private"}
  br label %221

221:                                              ; preds = %211, !sec !{!"private"}
  %222 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %223 = add i64 %222, 1, !sec !{!"private"}
  store i64 %223, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %205, !llvm.loop !40

224:                                              ; preds = %205, !sec !{!"private"}
  %225 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %226 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %227 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %228 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %229 = call ptr @insert_into_parent(ptr noundef %225, ptr noundef %226, i64 noundef %227, ptr noundef %228), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private"}}
  ret ptr %229, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_new_root(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private"}} {
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %2, ptr %6, align 8, !sec !{!"private", !"private"}
  %8 = call ptr @make_node(), !sec !{!"call", !"private", !{}}
  store ptr %8, ptr %7, align 8, !sec !{!"private", !"private"}
  %9 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %10 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %12 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %13 = getelementptr inbounds i64, ptr %12, i64 0, !sec !{!"private", !"private", !"public"}
  store i64 %9, ptr %13, align 8, !sec !{!"private", !"private"}
  %14 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %15 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %17 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %18 = getelementptr inbounds ptr, ptr %17, i64 0, !sec !{!"private", !"private", !"public"}
  store ptr %14, ptr %18, align 8, !sec !{!"private", !"private"}
  %19 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %20 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %21 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %22 = load ptr, ptr %21, align 8, !sec !{!"private", !"private"}
  %23 = getelementptr inbounds ptr, ptr %22, i64 1, !sec !{!"private", !"private", !"public"}
  store ptr %19, ptr %23, align 8, !sec !{!"private", !"private"}
  %24 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %26 = load i64, ptr %25, align 8, !sec !{!"private", !"private"}
  %27 = add i64 %26, 1, !sec !{!"private"}
  store i64 %27, ptr %25, align 8, !sec !{!"private", !"private"}
  %28 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %29 = getelementptr inbounds %struct.node, ptr %28, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %29, align 8, !sec !{!"private", !"private"}
  %30 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %31 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %30, ptr %32, align 8, !sec !{!"private", !"private"}
  %33 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %34 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %33, ptr %35, align 8, !sec !{!"private", !"private"}
  %36 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  ret ptr %36, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @start_new_tree(i64 noundef %0, ptr noundef %1) #0 !sec !{!"private", !"private", !{!"private", !"private"}} {
  %3 = alloca i64, align 8, !sec !{!"private"}
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca ptr, align 8, !sec !{!"private"}
  store i64 %0, ptr %3, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %4, align 8, !sec !{!"private", !"private"}
  %6 = call ptr @make_leaf(), !sec !{!"call", !"private", !{}}
  store ptr %6, ptr %5, align 8, !sec !{!"private", !"private"}
  %7 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %8 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %10 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %11 = getelementptr inbounds i64, ptr %10, i64 0, !sec !{!"private", !"private", !"public"}
  store i64 %7, ptr %11, align 8, !sec !{!"private", !"private"}
  %12 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %13 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = getelementptr inbounds ptr, ptr %15, i64 0, !sec !{!"private", !"private", !"public"}
  store ptr %12, ptr %16, align 8, !sec !{!"private", !"private"}
  %17 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %18 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %19 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %20 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %21 = sub i64 %20, 1, !sec !{!"private"}
  %22 = getelementptr inbounds ptr, ptr %19, i64 %21, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %22, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %24, align 8, !sec !{!"private", !"private"}
  %25 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %27 = load i64, ptr %26, align 8, !sec !{!"private", !"private"}
  %28 = add i64 %27, 1, !sec !{!"private"}
  store i64 %28, ptr %26, align 8, !sec !{!"private", !"private"}
  %29 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  ret ptr %29, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 !sec !{!"private", !"private", !{!"private", !"private", !"public"}} {
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca i64, align 8, !sec !{!"private"}
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca ptr, align 8, !sec !{!"private"}
  %9 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %5, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %6, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %7, align 8, !sec !{!"public", !"private"}
  store ptr null, ptr %8, align 8, !sec !{!"private", !"private"}
  store ptr null, ptr %9, align 8, !sec !{!"private", !"private"}
  %10 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %11 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %12 = call ptr @find(ptr noundef %10, i64 noundef %11, i1 noundef zeroext false, ptr noundef null), !sec !{!"call", !"private", !{!"private", !"private", !"public", !"public"}}
  store ptr %12, ptr %8, align 8, !sec !{!"private", !"private"}
  %13 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %14 = icmp ne ptr %13, null, !sec !{!"private"}
  br i1 %14, label %15, label %20, !sec !{!"private"}

15:                                               ; preds = %3, !sec !{!"private"}
  %16 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %17 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %18 = getelementptr inbounds %struct.record, ptr %17, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %16, ptr %18, align 8, !sec !{!"private", !"private"}
  %19 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %19, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %51

20:                                               ; preds = %3, !sec !{!"private"}
  %21 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %22 = call ptr @make_record(i64 noundef %21), !sec !{!"call", !"private", !{!"private"}}
  store ptr %22, ptr %8, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %24 = icmp eq ptr %23, null, !sec !{!"private"}
  br i1 %24, label %25, label %29, !sec !{!"private"}

25:                                               ; preds = %20, !sec !{!"private"}
  %26 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %27 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %28 = call ptr @start_new_tree(i64 noundef %26, ptr noundef %27), !sec !{!"call", !"private", !{!"private", !"private"}}
  store ptr %28, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %51

29:                                               ; preds = %20, !sec !{!"private"}
  %30 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %31 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %32 = call ptr @find_leaf(ptr noundef %30, i64 noundef %31, i1 noundef zeroext false), !sec !{!"call", !"private", !{!"private", !"private", !"public"}}
  store ptr %32, ptr %9, align 8, !sec !{!"private", !"private"}
  %33 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %34 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %35 = load i64, ptr %34, align 8, !sec !{!"private", !"private"}
  %36 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %37 = sub i64 %36, 1, !sec !{!"private"}
  %38 = icmp ult i64 %35, %37, !sec !{!"private"}
  br i1 %38, label %39, label %45, !sec !{!"private"}

39:                                               ; preds = %29, !sec !{!"private"}
  %40 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %41 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %42 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %43 = call ptr @insert_into_leaf(ptr noundef %40, i64 noundef %41, ptr noundef %42), !sec !{!"call", !"private", !{!"private", !"private", !"private"}}
  store ptr %43, ptr %9, align 8, !sec !{!"private", !"private"}
  %44 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %44, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %51

45:                                               ; preds = %29, !sec !{!"private"}
  %46 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %47 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %48 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %49 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %50 = call ptr @insert_into_leaf_after_splitting(ptr noundef %46, ptr noundef %47, i64 noundef %48, ptr noundef %49), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private"}}
  store ptr %50, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %51

51:                                               ; preds = %45, %39, %25, %15, !sec !{!"private"}
  %52 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  ret ptr %52, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_neighbor_index(ptr noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  %3 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %4

4:                                                ; preds = %27, %1, !sec !{!"private"}
  %5 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %6 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %8 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %10 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %11 = icmp ule i64 %5, %10, !sec !{!"private"}
  br i1 %11, label %12, label %30, !sec !{!"private"}

12:                                               ; preds = %4, !sec !{!"private"}
  %13 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %15 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %17 = load ptr, ptr %16, align 8, !sec !{!"private", !"private"}
  %18 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %19 = getelementptr inbounds ptr, ptr %17, i64 %18, !sec !{!"private", !"private", !"private"}
  %20 = load ptr, ptr %19, align 8, !sec !{!"private", !"private"}
  %21 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %22 = icmp eq ptr %20, %21, !sec !{!"private"}
  br i1 %22, label %23, label %26, !sec !{!"private"}

23:                                               ; preds = %12, !sec !{!"private"}
  %24 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %25 = sub i64 %24, 1, !sec !{!"private"}
  ret i64 %25, !sec !{!"private"}

26:                                               ; preds = %12, !sec !{!"private"}
  br label %27

27:                                               ; preds = %26, !sec !{!"private"}
  %28 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %29 = add i64 %28, 1, !sec !{!"private"}
  store i64 %29, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %4, !llvm.loop !41

30:                                               ; preds = %4, !sec !{!"public"}
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.35), !sec !{!"call", !"public", !{!"public"}}
  %32 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %33 = ptrtoint ptr %32 to i64, !sec !{!"private"}
  %d33 = call i64 @declassify.i64(i64 noundef %33), !sec !{!"declassify", !"private", !"public"}
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.36, i64 noundef %d33), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable
}

define dso_local i64 @declassify.i64(i64 noundef %0) #0 !sec !{!"public", !"public", !{!"private"}} {
  ret i64 %0 !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @remove_entry_from_node(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private"}} {
  %4 = alloca ptr, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca i64, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %4, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr %2, ptr %6, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %9

9:                                                ; preds = %18, %3, !sec !{!"private"}
  %10 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %12 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %13 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %14 = getelementptr inbounds i64, ptr %12, i64 %13, !sec !{!"private", !"private", !"private"}
  %15 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %16 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %17 = icmp ne i64 %15, %16, !sec !{!"private"}
  br i1 %17, label %18, label %21, !sec !{!"private"}

18:                                               ; preds = %9, !sec !{!"private"}
  %19 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %20 = add i64 %19, 1, !sec !{!"private"}
  store i64 %20, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %9, !llvm.loop !42

21:                                               ; preds = %9, !sec !{!"private"}
  %22 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %23 = add i64 %22, 1, !sec !{!"private"}
  store i64 %23, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %24

24:                                               ; preds = %43, %21, !sec !{!"private"}
  %25 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %26 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i64, ptr %27, align 8, !sec !{!"private", !"private"}
  %29 = icmp ult i64 %25, %28, !sec !{!"private"}
  br i1 %29, label %30, label %46, !sec !{!"private"}

30:                                               ; preds = %24, !sec !{!"private"}
  %31 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %33 = load ptr, ptr %32, align 8, !sec !{!"private", !"private"}
  %34 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %35 = getelementptr inbounds i64, ptr %33, i64 %34, !sec !{!"private", !"private", !"private"}
  %36 = load i64, ptr %35, align 8, !sec !{!"private", !"private"}
  %37 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %38 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %39 = load ptr, ptr %38, align 8, !sec !{!"private", !"private"}
  %40 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %41 = sub i64 %40, 1, !sec !{!"private"}
  %42 = getelementptr inbounds i64, ptr %39, i64 %41, !sec !{!"private", !"private", !"private"}
  store i64 %36, ptr %42, align 8, !sec !{!"private", !"private"}
  br label %43

43:                                               ; preds = %30, !sec !{!"private"}
  %44 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %45 = add i64 %44, 1, !sec !{!"private"}
  store i64 %45, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %24, !llvm.loop !43

46:                                               ; preds = %24, !sec !{!"private"}
  %47 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %48 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %49 = load i8, ptr %48, align 8, !sec !{!"private", !"private"}
  %50 = trunc i8 %49 to i1, !sec !{!"private"}
  br i1 %50, label %51, label %55, !sec !{!"private"}

51:                                               ; preds = %46, !sec !{!"private"}
  %52 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %54 = load i64, ptr %53, align 8, !sec !{!"private", !"private"}
  br label %60

55:                                               ; preds = %46, !sec !{!"private"}
  %56 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %58 = load i64, ptr %57, align 8, !sec !{!"private", !"private"}
  %59 = add i64 %58, 1, !sec !{!"private"}
  br label %60

60:                                               ; preds = %55, %51, !sec !{!"private"}
  %61 = phi i64 [ %54, %51 ], [ %59, %55 ], !sec !{!"private", !"private", !"private"}
  store i64 %61, ptr %8, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %62

62:                                               ; preds = %71, %60, !sec !{!"private"}
  %63 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %64 = getelementptr inbounds %struct.node, ptr %63, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %65 = load ptr, ptr %64, align 8, !sec !{!"private", !"private"}
  %66 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %67 = getelementptr inbounds ptr, ptr %65, i64 %66, !sec !{!"private", !"private", !"private"}
  %68 = load ptr, ptr %67, align 8, !sec !{!"private", !"private"}
  %69 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %70 = icmp ne ptr %68, %69, !sec !{!"private"}
  br i1 %70, label %71, label %74, !sec !{!"private"}

71:                                               ; preds = %62, !sec !{!"private"}
  %72 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %73 = add i64 %72, 1, !sec !{!"private"}
  store i64 %73, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %62, !llvm.loop !44

74:                                               ; preds = %62, !sec !{!"private"}
  %75 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %76 = add i64 %75, 1, !sec !{!"private"}
  store i64 %76, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %77

77:                                               ; preds = %94, %74, !sec !{!"private"}
  %78 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %79 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %80 = icmp ult i64 %78, %79, !sec !{!"private"}
  br i1 %80, label %81, label %97, !sec !{!"private"}

81:                                               ; preds = %77, !sec !{!"private"}
  %82 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %83 = getelementptr inbounds %struct.node, ptr %82, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %84 = load ptr, ptr %83, align 8, !sec !{!"private", !"private"}
  %85 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %86 = getelementptr inbounds ptr, ptr %84, i64 %85, !sec !{!"private", !"private", !"private"}
  %87 = load ptr, ptr %86, align 8, !sec !{!"private", !"private"}
  %88 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %89 = getelementptr inbounds %struct.node, ptr %88, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %90 = load ptr, ptr %89, align 8, !sec !{!"private", !"private"}
  %91 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %92 = sub i64 %91, 1, !sec !{!"private"}
  %93 = getelementptr inbounds ptr, ptr %90, i64 %92, !sec !{!"private", !"private", !"private"}
  store ptr %87, ptr %93, align 8, !sec !{!"private", !"private"}
  br label %94

94:                                               ; preds = %81, !sec !{!"private"}
  %95 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %96 = add i64 %95, 1, !sec !{!"private"}
  store i64 %96, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %77, !llvm.loop !45

97:                                               ; preds = %77, !sec !{!"private"}
  %98 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %100 = load i64, ptr %99, align 8, !sec !{!"private", !"private"}
  %101 = add i64 %100, -1, !sec !{!"private"}
  store i64 %101, ptr %99, align 8, !sec !{!"private", !"private"}
  %102 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %103 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %104 = load i8, ptr %103, align 8, !sec !{!"private", !"private"}
  %105 = trunc i8 %104 to i1, !sec !{!"private"}
  br i1 %105, label %106, label %125, !sec !{!"private"}

106:                                              ; preds = %97, !sec !{!"private"}
  %107 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %108 = getelementptr inbounds %struct.node, ptr %107, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %109 = load i64, ptr %108, align 8, !sec !{!"private", !"private"}
  store i64 %109, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %110

110:                                              ; preds = %121, %106, !sec !{!"private"}
  %111 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %112 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %113 = sub i64 %112, 1, !sec !{!"private"}
  %114 = icmp ult i64 %111, %113, !sec !{!"private"}
  br i1 %114, label %115, label %124, !sec !{!"private"}

115:                                              ; preds = %110, !sec !{!"private"}
  %116 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %117 = getelementptr inbounds %struct.node, ptr %116, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %118 = load ptr, ptr %117, align 8, !sec !{!"private", !"private"}
  %119 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %120 = getelementptr inbounds ptr, ptr %118, i64 %119, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %120, align 8, !sec !{!"private", !"private"}
  br label %121

121:                                              ; preds = %115, !sec !{!"private"}
  %122 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %123 = add i64 %122, 1, !sec !{!"private"}
  store i64 %123, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %110, !llvm.loop !46

124:                                              ; preds = %110, !sec !{!"private"}
  br label %144

125:                                              ; preds = %97, !sec !{!"private"}
  %126 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %127 = getelementptr inbounds %struct.node, ptr %126, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %128 = load i64, ptr %127, align 8, !sec !{!"private", !"private"}
  %129 = add i64 %128, 1, !sec !{!"private"}
  store i64 %129, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %130

130:                                              ; preds = %140, %125, !sec !{!"private"}
  %131 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %132 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %133 = icmp ult i64 %131, %132, !sec !{!"private"}
  br i1 %133, label %134, label %143, !sec !{!"private"}

134:                                              ; preds = %130, !sec !{!"private"}
  %135 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %136 = getelementptr inbounds %struct.node, ptr %135, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %137 = load ptr, ptr %136, align 8, !sec !{!"private", !"private"}
  %138 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %139 = getelementptr inbounds ptr, ptr %137, i64 %138, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %139, align 8, !sec !{!"private", !"private"}
  br label %140

140:                                              ; preds = %134, !sec !{!"private"}
  %141 = load i64, ptr %7, align 8, !sec !{!"private", !"private"}
  %142 = add i64 %141, 1, !sec !{!"private"}
  store i64 %142, ptr %7, align 8, !sec !{!"private", !"private"}
  br label %130, !llvm.loop !47

143:                                              ; preds = %130, !sec !{!"private"}
  br label %144

144:                                              ; preds = %143, %124, !sec !{!"private"}
  %145 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  ret ptr %145, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @adjust_root(ptr noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  %3 = alloca ptr, align 8, !sec !{!"private"}
  %4 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %3, align 8, !sec !{!"private", !"private"}
  %5 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %6 = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %7 = load i64, ptr %6, align 8, !sec !{!"private", !"private"}
  %8 = icmp ugt i64 %7, 0, !sec !{!"private"}
  br i1 %8, label %9, label %11, !sec !{!"private"}

9:                                                ; preds = %1, !sec !{!"private"}
  %10 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  store ptr %10, ptr %2, align 8, !sec !{!"private", !"private"}
  br label %34

11:                                               ; preds = %1, !sec !{!"private"}
  %12 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %14 = load i8, ptr %13, align 8, !sec !{!"private", !"private"}
  %15 = trunc i8 %14 to i1, !sec !{!"private"}
  br i1 %15, label %24, label %16, !sec !{!"private"}

16:                                               ; preds = %11, !sec !{!"private"}
  %17 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %18 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %19 = load ptr, ptr %18, align 8, !sec !{!"private", !"private"}
  %20 = getelementptr inbounds ptr, ptr %19, i64 0, !sec !{!"private", !"private", !"public"}
  %21 = load ptr, ptr %20, align 8, !sec !{!"private", !"private"}
  store ptr %21, ptr %4, align 8, !sec !{!"private", !"private"}
  %22 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr null, ptr %23, align 8, !sec !{!"private", !"private"}
  br label %25

24:                                               ; preds = %11, !sec !{!"private"}
  store ptr null, ptr %4, align 8, !sec !{!"private", !"private"}
  br label %25

25:                                               ; preds = %24, %16, !sec !{!"private"}
  %26 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load ptr, ptr %27, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %28) #8, !sec !{!"free", !"private"}
  %29 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %31 = load ptr, ptr %30, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %31) #8, !sec !{!"free", !"private"}
  %32 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  call void @free_node(ptr noundef %32), !sec !{!"call", !"void", !{!"private"}}
  %33 = load ptr, ptr %4, align 8, !sec !{!"private", !"private"}
  store ptr %33, ptr %2, align 8, !sec !{!"private", !"private"}
  br label %34

34:                                               ; preds = %25, %9, !sec !{!"private"}
  %35 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  ret ptr %35, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @coalesce_nodes(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3, i64 noundef %4) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private", !"private"}} {
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca ptr, align 8, !sec !{!"private"}
  %9 = alloca i64, align 8, !sec !{!"private"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca i64, align 8, !sec !{!"private"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"private"}
  %15 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %7, align 8, !sec !{!"private", !"private"}
  store ptr %2, ptr %8, align 8, !sec !{!"private", !"private"}
  store i64 %3, ptr %9, align 8, !sec !{!"private", !"private"}
  store i64 %4, ptr %10, align 8, !sec !{!"private", !"private"}
  %16 = load i64, ptr %9, align 8, !sec !{!"private", !"private"}
  %17 = icmp eq i64 %16, -1, !sec !{!"private"}
  br i1 %17, label %18, label %22, !sec !{!"private"}

18:                                               ; preds = %5, !sec !{!"private"}
  %19 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  store ptr %19, ptr %15, align 8, !sec !{!"private", !"private"}
  %20 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  store ptr %20, ptr %7, align 8, !sec !{!"private", !"private"}
  %21 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  store ptr %21, ptr %8, align 8, !sec !{!"private", !"private"}
  br label %22

22:                                               ; preds = %18, %5, !sec !{!"private"}
  %23 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %25 = load i64, ptr %24, align 8, !sec !{!"private", !"private"}
  store i64 %25, ptr %13, align 8, !sec !{!"private", !"private"}
  %26 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i8, ptr %27, align 8, !sec !{!"private", !"private"}
  %29 = trunc i8 %28 to i1, !sec !{!"private"}
  br i1 %29, label %119, label %30, !sec !{!"private"}

30:                                               ; preds = %22, !sec !{!"private"}
  %31 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %32 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %34 = load ptr, ptr %33, align 8, !sec !{!"private", !"private"}
  %35 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %36 = getelementptr inbounds i64, ptr %34, i64 %35, !sec !{!"private", !"private", !"private"}
  store i64 %31, ptr %36, align 8, !sec !{!"private", !"private"}
  %37 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %38 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %39 = load i64, ptr %38, align 8, !sec !{!"private", !"private"}
  %40 = add i64 %39, 1, !sec !{!"private"}
  store i64 %40, ptr %38, align 8, !sec !{!"private", !"private"}
  %41 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %43 = load i64, ptr %42, align 8, !sec !{!"private", !"private"}
  store i64 %43, ptr %14, align 8, !sec !{!"private", !"private"}
  %44 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %45 = add i64 %44, 1, !sec !{!"private"}
  store i64 %45, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %46

46:                                               ; preds = %81, %30, !sec !{!"private"}
  %47 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %48 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %49 = icmp ult i64 %47, %48, !sec !{!"private"}
  br i1 %49, label %50, label %86, !sec !{!"private"}

50:                                               ; preds = %46, !sec !{!"private"}
  %51 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %52 = getelementptr inbounds %struct.node, ptr %51, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %53 = load ptr, ptr %52, align 8, !sec !{!"private", !"private"}
  %54 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %55 = getelementptr inbounds i64, ptr %53, i64 %54, !sec !{!"private", !"private", !"private"}
  %56 = load i64, ptr %55, align 8, !sec !{!"private", !"private"}
  %57 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %59 = load ptr, ptr %58, align 8, !sec !{!"private", !"private"}
  %60 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %61 = getelementptr inbounds i64, ptr %59, i64 %60, !sec !{!"private", !"private", !"private"}
  store i64 %56, ptr %61, align 8, !sec !{!"private", !"private"}
  %62 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %64 = load ptr, ptr %63, align 8, !sec !{!"private", !"private"}
  %65 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %66 = getelementptr inbounds ptr, ptr %64, i64 %65, !sec !{!"private", !"private", !"private"}
  %67 = load ptr, ptr %66, align 8, !sec !{!"private", !"private"}
  %68 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %70 = load ptr, ptr %69, align 8, !sec !{!"private", !"private"}
  %71 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %72 = getelementptr inbounds ptr, ptr %70, i64 %71, !sec !{!"private", !"private", !"private"}
  store ptr %67, ptr %72, align 8, !sec !{!"private", !"private"}
  %73 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %74 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %75 = load i64, ptr %74, align 8, !sec !{!"private", !"private"}
  %76 = add i64 %75, 1, !sec !{!"private"}
  store i64 %76, ptr %74, align 8, !sec !{!"private", !"private"}
  %77 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %79 = load i64, ptr %78, align 8, !sec !{!"private", !"private"}
  %80 = add i64 %79, -1, !sec !{!"private"}
  store i64 %80, ptr %78, align 8, !sec !{!"private", !"private"}
  br label %81

81:                                               ; preds = %50, !sec !{!"private"}
  %82 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %83 = add i64 %82, 1, !sec !{!"private"}
  store i64 %83, ptr %11, align 8, !sec !{!"private", !"private"}
  %84 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %85 = add i64 %84, 1, !sec !{!"private"}
  store i64 %85, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %46, !llvm.loop !48

86:                                               ; preds = %46, !sec !{!"private"}
  %87 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %89 = load ptr, ptr %88, align 8, !sec !{!"private", !"private"}
  %90 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90, !sec !{!"private", !"private", !"private"}
  %92 = load ptr, ptr %91, align 8, !sec !{!"private", !"private"}
  %93 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %94 = getelementptr inbounds %struct.node, ptr %93, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %95 = load ptr, ptr %94, align 8, !sec !{!"private", !"private"}
  %96 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %97 = getelementptr inbounds ptr, ptr %95, i64 %96, !sec !{!"private", !"private", !"private"}
  store ptr %92, ptr %97, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %98

98:                                               ; preds = %115, %86, !sec !{!"private"}
  %99 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %100 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %102 = load i64, ptr %101, align 8, !sec !{!"private", !"private"}
  %103 = add i64 %102, 1, !sec !{!"private"}
  %104 = icmp ult i64 %99, %103, !sec !{!"private"}
  br i1 %104, label %105, label %118, !sec !{!"private"}

105:                                              ; preds = %98, !sec !{!"private"}
  %106 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %108 = load ptr, ptr %107, align 8, !sec !{!"private", !"private"}
  %109 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %110 = getelementptr inbounds ptr, ptr %108, i64 %109, !sec !{!"private", !"private", !"private"}
  %111 = load ptr, ptr %110, align 8, !sec !{!"private", !"private"}
  store ptr %111, ptr %15, align 8, !sec !{!"private", !"private"}
  %112 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %113 = load ptr, ptr %15, align 8, !sec !{!"private", !"private"}
  %114 = getelementptr inbounds %struct.node, ptr %113, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %112, ptr %114, align 8, !sec !{!"private", !"private"}
  br label %115

115:                                              ; preds = %105, !sec !{!"private"}
  %116 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %117 = add i64 %116, 1, !sec !{!"private"}
  store i64 %117, ptr %11, align 8, !sec !{!"private", !"private"}
  br label %98, !llvm.loop !49

118:                                              ; preds = %98, !sec !{!"private"}
  br label %173

119:                                              ; preds = %22, !sec !{!"private"}
  %120 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  store i64 %120, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %121

121:                                              ; preds = %154, %119, !sec !{!"private"}
  %122 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %123 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %125 = load i64, ptr %124, align 8, !sec !{!"private", !"private"}
  %126 = icmp ult i64 %122, %125, !sec !{!"private"}
  br i1 %126, label %127, label %159, !sec !{!"private"}

127:                                              ; preds = %121, !sec !{!"private"}
  %128 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %129 = getelementptr inbounds %struct.node, ptr %128, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %130 = load ptr, ptr %129, align 8, !sec !{!"private", !"private"}
  %131 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %132 = getelementptr inbounds i64, ptr %130, i64 %131, !sec !{!"private", !"private", !"private"}
  %133 = load i64, ptr %132, align 8, !sec !{!"private", !"private"}
  %134 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %135 = getelementptr inbounds %struct.node, ptr %134, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %136 = load ptr, ptr %135, align 8, !sec !{!"private", !"private"}
  %137 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %138 = getelementptr inbounds i64, ptr %136, i64 %137, !sec !{!"private", !"private", !"private"}
  store i64 %133, ptr %138, align 8, !sec !{!"private", !"private"}
  %139 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %140 = getelementptr inbounds %struct.node, ptr %139, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %141 = load ptr, ptr %140, align 8, !sec !{!"private", !"private"}
  %142 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %143 = getelementptr inbounds ptr, ptr %141, i64 %142, !sec !{!"private", !"private", !"private"}
  %144 = load ptr, ptr %143, align 8, !sec !{!"private", !"private"}
  %145 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %146 = getelementptr inbounds %struct.node, ptr %145, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %147 = load ptr, ptr %146, align 8, !sec !{!"private", !"private"}
  %148 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %149 = getelementptr inbounds ptr, ptr %147, i64 %148, !sec !{!"private", !"private", !"private"}
  store ptr %144, ptr %149, align 8, !sec !{!"private", !"private"}
  %150 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %151 = getelementptr inbounds %struct.node, ptr %150, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %152 = load i64, ptr %151, align 8, !sec !{!"private", !"private"}
  %153 = add i64 %152, 1, !sec !{!"private"}
  store i64 %153, ptr %151, align 8, !sec !{!"private", !"private"}
  br label %154

154:                                              ; preds = %127, !sec !{!"private"}
  %155 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %156 = add i64 %155, 1, !sec !{!"private"}
  store i64 %156, ptr %11, align 8, !sec !{!"private", !"private"}
  %157 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %158 = add i64 %157, 1, !sec !{!"private"}
  store i64 %158, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %121, !llvm.loop !50

159:                                              ; preds = %121, !sec !{!"private"}
  %160 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %161 = getelementptr inbounds %struct.node, ptr %160, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %162 = load ptr, ptr %161, align 8, !sec !{!"private", !"private"}
  %163 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %164 = sub i64 %163, 1, !sec !{!"private"}
  %165 = getelementptr inbounds ptr, ptr %162, i64 %164, !sec !{!"private", !"private", !"private"}
  %166 = load ptr, ptr %165, align 8, !sec !{!"private", !"private"}
  %167 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %168 = getelementptr inbounds %struct.node, ptr %167, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %169 = load ptr, ptr %168, align 8, !sec !{!"private", !"private"}
  %170 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %171 = sub i64 %170, 1, !sec !{!"private"}
  %172 = getelementptr inbounds ptr, ptr %169, i64 %171, !sec !{!"private", !"private", !"private"}
  store ptr %166, ptr %172, align 8, !sec !{!"private", !"private"}
  br label %173

173:                                              ; preds = %159, %118, !sec !{!"private"}
  %174 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %175 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %176 = getelementptr inbounds %struct.node, ptr %175, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %177 = load ptr, ptr %176, align 8, !sec !{!"private", !"private"}
  %178 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %179 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %180 = call ptr @delete_entry(ptr noundef %174, ptr noundef %177, i64 noundef %178, ptr noundef %179), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private"}}
  store ptr %180, ptr %6, align 8, !sec !{!"private", !"private"}
  %181 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %182 = getelementptr inbounds %struct.node, ptr %181, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %183 = load ptr, ptr %182, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %183) #8, !sec !{!"free", !"private"}
  %184 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %185 = getelementptr inbounds %struct.node, ptr %184, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %186 = load ptr, ptr %185, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %186) #8, !sec !{!"free", !"private"}
  %187 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  call void @free_node(ptr noundef %187), !sec !{!"call", !"void", !{!"private"}}
  %188 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  ret ptr %188, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete_entry(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private"}} {
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca i64, align 8, !sec !{!"private"}
  %9 = alloca ptr, align 8, !sec !{!"private"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca ptr, align 8, !sec !{!"private"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca i64, align 8, !sec !{!"private"}
  %15 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %7, align 8, !sec !{!"private", !"private"}
  store i64 %2, ptr %8, align 8, !sec !{!"private", !"private"}
  store ptr %3, ptr %9, align 8, !sec !{!"private", !"private"}
  %16 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %17 = load i64, ptr %8, align 8, !sec !{!"private", !"private"}
  %18 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %19 = call ptr @remove_entry_from_node(ptr noundef %16, i64 noundef %17, ptr noundef %18), !sec !{!"call", !"private", !{!"private", !"private", !"private"}}
  store ptr %19, ptr %7, align 8, !sec !{!"private", !"private"}
  %20 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %21 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %22 = icmp eq ptr %20, %21, !sec !{!"private"}
  br i1 %22, label %23, label %26, !sec !{!"private"}

23:                                               ; preds = %4, !sec !{!"private"}
  %24 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %25 = call ptr @adjust_root(ptr noundef %24), !sec !{!"call", !"private", !{!"private"}}
  store ptr %25, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %122

26:                                               ; preds = %4, !sec !{!"private"}
  %27 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %29 = load i8, ptr %28, align 8, !sec !{!"private", !"private"}
  %30 = trunc i8 %29 to i1, !sec !{!"private"}
  br i1 %30, label %31, label %35, !sec !{!"private"}

31:                                               ; preds = %26, !sec !{!"private"}
  %32 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %33 = sub i64 %32, 1, !sec !{!"private"}
  %34 = call i64 @cut(i64 noundef %33), !sec !{!"call", !"private", !{!"private"}}
  br label %39

35:                                               ; preds = %26, !sec !{!"private"}
  %36 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %37 = call i64 @cut(i64 noundef %36), !sec !{!"call", !"private", !{!"private"}}
  %38 = sub i64 %37, 1, !sec !{!"private"}
  br label %39

39:                                               ; preds = %35, %31, !sec !{!"private"}
  %40 = phi i64 [ %34, %31 ], [ %38, %35 ], !sec !{!"private", !"private", !"private"}
  store i64 %40, ptr %10, align 8, !sec !{!"private", !"private"}
  %41 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %43 = load i64, ptr %42, align 8, !sec !{!"private", !"private"}
  %44 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %45 = icmp uge i64 %43, %44, !sec !{!"private"}
  br i1 %45, label %46, label %48, !sec !{!"private"}

46:                                               ; preds = %39, !sec !{!"private"}
  %47 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  store ptr %47, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %122

48:                                               ; preds = %39, !sec !{!"private"}
  %49 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %50 = call i64 @get_neighbor_index(ptr noundef %49), !sec !{!"call", !"private", !{!"private"}}
  store i64 %50, ptr %12, align 8, !sec !{!"private", !"private"}
  %51 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %52 = icmp eq i64 %51, -1, !sec !{!"private"}
  br i1 %52, label %53, label %54, !sec !{!"private"}

53:                                               ; preds = %48, !sec !{!"private"}
  br label %56

54:                                               ; preds = %48, !sec !{!"private"}
  %55 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  br label %56

56:                                               ; preds = %54, %53, !sec !{!"private"}
  %57 = phi i64 [ 0, %53 ], [ %55, %54 ], !sec !{!"private", !"private", !"private"}
  store i64 %57, ptr %13, align 8, !sec !{!"private", !"private"}
  %58 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %59 = getelementptr inbounds %struct.node, ptr %58, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %60 = load ptr, ptr %59, align 8, !sec !{!"private", !"private"}
  %61 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %62 = load ptr, ptr %61, align 8, !sec !{!"private", !"private"}
  %63 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %64 = getelementptr inbounds i64, ptr %62, i64 %63, !sec !{!"private", !"private", !"private"}
  %65 = load i64, ptr %64, align 8, !sec !{!"private", !"private"}
  store i64 %65, ptr %14, align 8, !sec !{!"private", !"private"}
  %66 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %67 = icmp eq i64 %66, -1, !sec !{!"private"}
  br i1 %67, label %68, label %76, !sec !{!"private"}

68:                                               ; preds = %56, !sec !{!"private"}
  %69 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %70 = getelementptr inbounds %struct.node, ptr %69, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %71 = load ptr, ptr %70, align 8, !sec !{!"private", !"private"}
  %72 = getelementptr inbounds %struct.node, ptr %71, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %73 = load ptr, ptr %72, align 8, !sec !{!"private", !"private"}
  %74 = getelementptr inbounds ptr, ptr %73, i64 1, !sec !{!"private", !"private", !"public"}
  %75 = load ptr, ptr %74, align 8, !sec !{!"private", !"private"}
  br label %85

76:                                               ; preds = %56, !sec !{!"private"}
  %77 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %79 = load ptr, ptr %78, align 8, !sec !{!"private", !"private"}
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %81 = load ptr, ptr %80, align 8, !sec !{!"private", !"private"}
  %82 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %83 = getelementptr inbounds ptr, ptr %81, i64 %82, !sec !{!"private", !"private", !"private"}
  %84 = load ptr, ptr %83, align 8, !sec !{!"private", !"private"}
  br label %85

85:                                               ; preds = %76, %68, !sec !{!"private"}
  %86 = phi ptr [ %75, %68 ], [ %84, %76 ], !sec !{!"private", !"private", !"private"}
  store ptr %86, ptr %11, align 8, !sec !{!"private", !"private"}
  %87 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %89 = load i8, ptr %88, align 8, !sec !{!"private", !"private"}
  %90 = trunc i8 %89 to i1, !sec !{!"private"}
  br i1 %90, label %91, label %93, !sec !{!"private"}

91:                                               ; preds = %85, !sec !{!"private"}
  %92 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  br label %96

93:                                               ; preds = %85, !sec !{!"private"}
  %94 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %95 = sub i64 %94, 1, !sec !{!"private"}
  br label %96

96:                                               ; preds = %93, %91, !sec !{!"private"}
  %97 = phi i64 [ %92, %91 ], [ %95, %93 ], !sec !{!"private", !"private", !"private"}
  store i64 %97, ptr %15, align 8, !sec !{!"private", !"private"}
  %98 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %100 = load i64, ptr %99, align 8, !sec !{!"private", !"private"}
  %101 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %102 = getelementptr inbounds %struct.node, ptr %101, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %103 = load i64, ptr %102, align 8, !sec !{!"private", !"private"}
  %104 = add i64 %100, %103, !sec !{!"private"}
  %105 = load i64, ptr %15, align 8, !sec !{!"private", !"private"}
  %106 = icmp ult i64 %104, %105, !sec !{!"private"}
  br i1 %106, label %107, label %114, !sec !{!"private"}

107:                                              ; preds = %96, !sec !{!"private"}
  %108 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %109 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %110 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %111 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %112 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %113 = call ptr @coalesce_nodes(ptr noundef %108, ptr noundef %109, ptr noundef %110, i64 noundef %111, i64 noundef %112), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private", !"private"}}
  store ptr %113, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %122

114:                                              ; preds = %96, !sec !{!"private"}
  %115 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %116 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  %117 = load ptr, ptr %11, align 8, !sec !{!"private", !"private"}
  %118 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %119 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %120 = load i64, ptr %14, align 8, !sec !{!"private", !"private"}
  %121 = call ptr @redistribute_nodes(ptr noundef %115, ptr noundef %116, ptr noundef %117, i64 noundef %118, i64 noundef %119, i64 noundef %120), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private", !"private", !"private"}}
  store ptr %121, ptr %5, align 8, !sec !{!"private", !"private"}
  br label %122

122:                                              ; preds = %114, %107, %46, %23, !sec !{!"private"}
  %123 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  ret ptr %123, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @redistribute_nodes(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private", !"private", !"private"}} {
  %7 = alloca ptr, align 8, !sec !{!"private"}
  %8 = alloca ptr, align 8, !sec !{!"private"}
  %9 = alloca ptr, align 8, !sec !{!"private"}
  %10 = alloca i64, align 8, !sec !{!"private"}
  %11 = alloca i64, align 8, !sec !{!"private"}
  %12 = alloca i64, align 8, !sec !{!"private"}
  %13 = alloca i64, align 8, !sec !{!"private"}
  %14 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %7, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %8, align 8, !sec !{!"private", !"private"}
  store ptr %2, ptr %9, align 8, !sec !{!"private", !"private"}
  store i64 %3, ptr %10, align 8, !sec !{!"private", !"private"}
  store i64 %4, ptr %11, align 8, !sec !{!"private", !"private"}
  store i64 %5, ptr %12, align 8, !sec !{!"private", !"private"}
  %15 = load i64, ptr %10, align 8, !sec !{!"private", !"private"}
  %16 = icmp ne i64 %15, -1, !sec !{!"private"}
  br i1 %16, label %17, label %176, !sec !{!"private"}

17:                                               ; preds = %6, !sec !{!"private"}
  %18 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %20 = load i8, ptr %19, align 8, !sec !{!"private", !"private"}
  %21 = trunc i8 %20 to i1, !sec !{!"private"}
  br i1 %21, label %39, label %22, !sec !{!"private"}

22:                                               ; preds = %17, !sec !{!"private"}
  %23 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %25 = load ptr, ptr %24, align 8, !sec !{!"private", !"private"}
  %26 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i64, ptr %27, align 8, !sec !{!"private", !"private"}
  %29 = getelementptr inbounds ptr, ptr %25, i64 %28, !sec !{!"private", !"private", !"private"}
  %30 = load ptr, ptr %29, align 8, !sec !{!"private", !"private"}
  %31 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %33 = load ptr, ptr %32, align 8, !sec !{!"private", !"private"}
  %34 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %36 = load i64, ptr %35, align 8, !sec !{!"private", !"private"}
  %37 = add i64 %36, 1, !sec !{!"private"}
  %38 = getelementptr inbounds ptr, ptr %33, i64 %37, !sec !{!"private", !"private", !"private"}
  store ptr %30, ptr %38, align 8, !sec !{!"private", !"private"}
  br label %39

39:                                               ; preds = %22, %17, !sec !{!"private"}
  %40 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %41 = getelementptr inbounds %struct.node, ptr %40, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %42 = load i64, ptr %41, align 8, !sec !{!"private", !"private"}
  store i64 %42, ptr %13, align 8, !sec !{!"private", !"private"}
  br label %43

43:                                               ; preds = %71, %39, !sec !{!"private"}
  %44 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %45 = icmp ugt i64 %44, 0, !sec !{!"private"}
  br i1 %45, label %46, label %74, !sec !{!"private"}

46:                                               ; preds = %43, !sec !{!"private"}
  %47 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %48 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %49 = load ptr, ptr %48, align 8, !sec !{!"private", !"private"}
  %50 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %51 = sub i64 %50, 1, !sec !{!"private"}
  %52 = getelementptr inbounds i64, ptr %49, i64 %51, !sec !{!"private", !"private", !"private"}
  %53 = load i64, ptr %52, align 8, !sec !{!"private", !"private"}
  %54 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %55 = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %56 = load ptr, ptr %55, align 8, !sec !{!"private", !"private"}
  %57 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %58 = getelementptr inbounds i64, ptr %56, i64 %57, !sec !{!"private", !"private", !"private"}
  store i64 %53, ptr %58, align 8, !sec !{!"private", !"private"}
  %59 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %60 = getelementptr inbounds %struct.node, ptr %59, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %61 = load ptr, ptr %60, align 8, !sec !{!"private", !"private"}
  %62 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %63 = sub i64 %62, 1, !sec !{!"private"}
  %64 = getelementptr inbounds ptr, ptr %61, i64 %63, !sec !{!"private", !"private", !"private"}
  %65 = load ptr, ptr %64, align 8, !sec !{!"private", !"private"}
  %66 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %67 = getelementptr inbounds %struct.node, ptr %66, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %68 = load ptr, ptr %67, align 8, !sec !{!"private", !"private"}
  %69 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %70 = getelementptr inbounds ptr, ptr %68, i64 %69, !sec !{!"private", !"private", !"private"}
  store ptr %65, ptr %70, align 8, !sec !{!"private", !"private"}
  br label %71

71:                                               ; preds = %46, !sec !{!"private"}
  %72 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %73 = add i64 %72, -1, !sec !{!"private"}
  store i64 %73, ptr %13, align 8, !sec !{!"private", !"private"}
  br label %43, !llvm.loop !51

74:                                               ; preds = %43, !sec !{!"private"}
  %75 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %76 = getelementptr inbounds %struct.node, ptr %75, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %77 = load i8, ptr %76, align 8, !sec !{!"private", !"private"}
  %78 = trunc i8 %77 to i1, !sec !{!"private"}
  br i1 %78, label %128, label %79, !sec !{!"private"}

79:                                               ; preds = %74, !sec !{!"private"}
  %80 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %81 = getelementptr inbounds %struct.node, ptr %80, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %82 = load ptr, ptr %81, align 8, !sec !{!"private", !"private"}
  %83 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %84 = getelementptr inbounds %struct.node, ptr %83, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %85 = load i64, ptr %84, align 8, !sec !{!"private", !"private"}
  %86 = getelementptr inbounds ptr, ptr %82, i64 %85, !sec !{!"private", !"private", !"private"}
  %87 = load ptr, ptr %86, align 8, !sec !{!"private", !"private"}
  %88 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %89 = getelementptr inbounds %struct.node, ptr %88, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %90 = load ptr, ptr %89, align 8, !sec !{!"private", !"private"}
  %91 = getelementptr inbounds ptr, ptr %90, i64 0, !sec !{!"private", !"private", !"public"}
  store ptr %87, ptr %91, align 8, !sec !{!"private", !"private"}
  %92 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %93 = getelementptr inbounds %struct.node, ptr %92, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %94 = load ptr, ptr %93, align 8, !sec !{!"private", !"private"}
  %95 = getelementptr inbounds ptr, ptr %94, i64 0, !sec !{!"private", !"private", !"public"}
  %96 = load ptr, ptr %95, align 8, !sec !{!"private", !"private"}
  store ptr %96, ptr %14, align 8, !sec !{!"private", !"private"}
  %97 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %98 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %97, ptr %99, align 8, !sec !{!"private", !"private"}
  %100 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %102 = load ptr, ptr %101, align 8, !sec !{!"private", !"private"}
  %103 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %104 = getelementptr inbounds %struct.node, ptr %103, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %105 = load i64, ptr %104, align 8, !sec !{!"private", !"private"}
  %106 = getelementptr inbounds ptr, ptr %102, i64 %105, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %106, align 8, !sec !{!"private", !"private"}
  %107 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %108 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %109 = getelementptr inbounds %struct.node, ptr %108, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %110 = load ptr, ptr %109, align 8, !sec !{!"private", !"private"}
  %111 = getelementptr inbounds i64, ptr %110, i64 0, !sec !{!"private", !"private", !"public"}
  store i64 %107, ptr %111, align 8, !sec !{!"private", !"private"}
  %112 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %113 = getelementptr inbounds %struct.node, ptr %112, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %114 = load ptr, ptr %113, align 8, !sec !{!"private", !"private"}
  %115 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %116 = getelementptr inbounds %struct.node, ptr %115, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %117 = load i64, ptr %116, align 8, !sec !{!"private", !"private"}
  %118 = sub i64 %117, 1, !sec !{!"private"}
  %119 = getelementptr inbounds i64, ptr %114, i64 %118, !sec !{!"private", !"private", !"private"}
  %120 = load i64, ptr %119, align 8, !sec !{!"private", !"private"}
  %121 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %122 = getelementptr inbounds %struct.node, ptr %121, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %123 = load ptr, ptr %122, align 8, !sec !{!"private", !"private"}
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %125 = load ptr, ptr %124, align 8, !sec !{!"private", !"private"}
  %126 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %127 = getelementptr inbounds i64, ptr %125, i64 %126, !sec !{!"private", !"private", !"private"}
  store i64 %120, ptr %127, align 8, !sec !{!"private", !"private"}
  br label %175

128:                                              ; preds = %74, !sec !{!"private"}
  %129 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %130 = getelementptr inbounds %struct.node, ptr %129, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %131 = load ptr, ptr %130, align 8, !sec !{!"private", !"private"}
  %132 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %133 = getelementptr inbounds %struct.node, ptr %132, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %134 = load i64, ptr %133, align 8, !sec !{!"private", !"private"}
  %135 = sub i64 %134, 1, !sec !{!"private"}
  %136 = getelementptr inbounds ptr, ptr %131, i64 %135, !sec !{!"private", !"private", !"private"}
  %137 = load ptr, ptr %136, align 8, !sec !{!"private", !"private"}
  %138 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %139 = getelementptr inbounds %struct.node, ptr %138, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %140 = load ptr, ptr %139, align 8, !sec !{!"private", !"private"}
  %141 = getelementptr inbounds ptr, ptr %140, i64 0, !sec !{!"private", !"private", !"public"}
  store ptr %137, ptr %141, align 8, !sec !{!"private", !"private"}
  %142 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %143 = getelementptr inbounds %struct.node, ptr %142, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %144 = load ptr, ptr %143, align 8, !sec !{!"private", !"private"}
  %145 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %146 = getelementptr inbounds %struct.node, ptr %145, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %147 = load i64, ptr %146, align 8, !sec !{!"private", !"private"}
  %148 = sub i64 %147, 1, !sec !{!"private"}
  %149 = getelementptr inbounds ptr, ptr %144, i64 %148, !sec !{!"private", !"private", !"private"}
  store ptr null, ptr %149, align 8, !sec !{!"private", !"private"}
  %150 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %151 = getelementptr inbounds %struct.node, ptr %150, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %152 = load ptr, ptr %151, align 8, !sec !{!"private", !"private"}
  %153 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %154 = getelementptr inbounds %struct.node, ptr %153, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %155 = load i64, ptr %154, align 8, !sec !{!"private", !"private"}
  %156 = sub i64 %155, 1, !sec !{!"private"}
  %157 = getelementptr inbounds i64, ptr %152, i64 %156, !sec !{!"private", !"private", !"private"}
  %158 = load i64, ptr %157, align 8, !sec !{!"private", !"private"}
  %159 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %160 = getelementptr inbounds %struct.node, ptr %159, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %161 = load ptr, ptr %160, align 8, !sec !{!"private", !"private"}
  %162 = getelementptr inbounds i64, ptr %161, i64 0, !sec !{!"private", !"private", !"public"}
  store i64 %158, ptr %162, align 8, !sec !{!"private", !"private"}
  %163 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %164 = getelementptr inbounds %struct.node, ptr %163, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %165 = load ptr, ptr %164, align 8, !sec !{!"private", !"private"}
  %166 = getelementptr inbounds i64, ptr %165, i64 0, !sec !{!"private", !"private", !"public"}
  %167 = load i64, ptr %166, align 8, !sec !{!"private", !"private"}
  %168 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %169 = getelementptr inbounds %struct.node, ptr %168, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %170 = load ptr, ptr %169, align 8, !sec !{!"private", !"private"}
  %171 = getelementptr inbounds %struct.node, ptr %170, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %172 = load ptr, ptr %171, align 8, !sec !{!"private", !"private"}
  %173 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %174 = getelementptr inbounds i64, ptr %172, i64 %173, !sec !{!"private", !"private", !"private"}
  store i64 %167, ptr %174, align 8, !sec !{!"private", !"private"}
  br label %175

175:                                              ; preds = %128, %79, !sec !{!"private"}
  br label %319

176:                                              ; preds = %6, !sec !{!"private"}
  %177 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %178 = getelementptr inbounds %struct.node, ptr %177, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %179 = load i8, ptr %178, align 8, !sec !{!"private", !"private"}
  %180 = trunc i8 %179 to i1, !sec !{!"private"}
  br i1 %180, label %181, label %218, !sec !{!"private"}

181:                                              ; preds = %176, !sec !{!"private"}
  %182 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %183 = getelementptr inbounds %struct.node, ptr %182, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %184 = load ptr, ptr %183, align 8, !sec !{!"private", !"private"}
  %185 = getelementptr inbounds i64, ptr %184, i64 0, !sec !{!"private", !"private", !"public"}
  %186 = load i64, ptr %185, align 8, !sec !{!"private", !"private"}
  %187 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %188 = getelementptr inbounds %struct.node, ptr %187, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %189 = load ptr, ptr %188, align 8, !sec !{!"private", !"private"}
  %190 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %191 = getelementptr inbounds %struct.node, ptr %190, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %192 = load i64, ptr %191, align 8, !sec !{!"private", !"private"}
  %193 = getelementptr inbounds i64, ptr %189, i64 %192, !sec !{!"private", !"private", !"private"}
  store i64 %186, ptr %193, align 8, !sec !{!"private", !"private"}
  %194 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %195 = getelementptr inbounds %struct.node, ptr %194, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %196 = load ptr, ptr %195, align 8, !sec !{!"private", !"private"}
  %197 = getelementptr inbounds ptr, ptr %196, i64 0, !sec !{!"private", !"private", !"public"}
  %198 = load ptr, ptr %197, align 8, !sec !{!"private", !"private"}
  %199 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %200 = getelementptr inbounds %struct.node, ptr %199, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %201 = load ptr, ptr %200, align 8, !sec !{!"private", !"private"}
  %202 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %203 = getelementptr inbounds %struct.node, ptr %202, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %204 = load i64, ptr %203, align 8, !sec !{!"private", !"private"}
  %205 = getelementptr inbounds ptr, ptr %201, i64 %204, !sec !{!"private", !"private", !"private"}
  store ptr %198, ptr %205, align 8, !sec !{!"private", !"private"}
  %206 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %207 = getelementptr inbounds %struct.node, ptr %206, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %208 = load ptr, ptr %207, align 8, !sec !{!"private", !"private"}
  %209 = getelementptr inbounds i64, ptr %208, i64 1, !sec !{!"private", !"private", !"public"}
  %210 = load i64, ptr %209, align 8, !sec !{!"private", !"private"}
  %211 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %212 = getelementptr inbounds %struct.node, ptr %211, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %213 = load ptr, ptr %212, align 8, !sec !{!"private", !"private"}
  %214 = getelementptr inbounds %struct.node, ptr %213, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %215 = load ptr, ptr %214, align 8, !sec !{!"private", !"private"}
  %216 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %217 = getelementptr inbounds i64, ptr %215, i64 %216, !sec !{!"private", !"private", !"private"}
  store i64 %210, ptr %217, align 8, !sec !{!"private", !"private"}
  br label %264

218:                                              ; preds = %176, !sec !{!"private"}
  %219 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %220 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %221 = getelementptr inbounds %struct.node, ptr %220, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %222 = load ptr, ptr %221, align 8, !sec !{!"private", !"private"}
  %223 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %224 = getelementptr inbounds %struct.node, ptr %223, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %225 = load i64, ptr %224, align 8, !sec !{!"private", !"private"}
  %226 = getelementptr inbounds i64, ptr %222, i64 %225, !sec !{!"private", !"private", !"private"}
  store i64 %219, ptr %226, align 8, !sec !{!"private", !"private"}
  %227 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %228 = getelementptr inbounds %struct.node, ptr %227, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %229 = load ptr, ptr %228, align 8, !sec !{!"private", !"private"}
  %230 = getelementptr inbounds ptr, ptr %229, i64 0, !sec !{!"private", !"private", !"public"}
  %231 = load ptr, ptr %230, align 8, !sec !{!"private", !"private"}
  %232 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %233 = getelementptr inbounds %struct.node, ptr %232, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %234 = load ptr, ptr %233, align 8, !sec !{!"private", !"private"}
  %235 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %236 = getelementptr inbounds %struct.node, ptr %235, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %237 = load i64, ptr %236, align 8, !sec !{!"private", !"private"}
  %238 = add i64 %237, 1, !sec !{!"private"}
  %239 = getelementptr inbounds ptr, ptr %234, i64 %238, !sec !{!"private", !"private", !"private"}
  store ptr %231, ptr %239, align 8, !sec !{!"private", !"private"}
  %240 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %241 = getelementptr inbounds %struct.node, ptr %240, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %242 = load ptr, ptr %241, align 8, !sec !{!"private", !"private"}
  %243 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %244 = getelementptr inbounds %struct.node, ptr %243, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %245 = load i64, ptr %244, align 8, !sec !{!"private", !"private"}
  %246 = add i64 %245, 1, !sec !{!"private"}
  %247 = getelementptr inbounds ptr, ptr %242, i64 %246, !sec !{!"private", !"private", !"private"}
  %248 = load ptr, ptr %247, align 8, !sec !{!"private", !"private"}
  store ptr %248, ptr %14, align 8, !sec !{!"private", !"private"}
  %249 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %250 = load ptr, ptr %14, align 8, !sec !{!"private", !"private"}
  %251 = getelementptr inbounds %struct.node, ptr %250, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  store ptr %249, ptr %251, align 8, !sec !{!"private", !"private"}
  %252 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %253 = getelementptr inbounds %struct.node, ptr %252, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %254 = load ptr, ptr %253, align 8, !sec !{!"private", !"private"}
  %255 = getelementptr inbounds i64, ptr %254, i64 0, !sec !{!"private", !"private", !"public"}
  %256 = load i64, ptr %255, align 8, !sec !{!"private", !"private"}
  %257 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %258 = getelementptr inbounds %struct.node, ptr %257, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %259 = load ptr, ptr %258, align 8, !sec !{!"private", !"private"}
  %260 = getelementptr inbounds %struct.node, ptr %259, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %261 = load ptr, ptr %260, align 8, !sec !{!"private", !"private"}
  %262 = load i64, ptr %11, align 8, !sec !{!"private", !"private"}
  %263 = getelementptr inbounds i64, ptr %261, i64 %262, !sec !{!"private", !"private", !"private"}
  store i64 %256, ptr %263, align 8, !sec !{!"private", !"private"}
  br label %264

264:                                              ; preds = %218, %181, !sec !{!"private"}
  store i64 0, ptr %13, align 8, !sec !{!"private", !"private"}
  br label %265

265:                                              ; preds = %297, %264, !sec !{!"private"}
  %266 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %267 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %268 = getelementptr inbounds %struct.node, ptr %267, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %269 = load i64, ptr %268, align 8, !sec !{!"private", !"private"}
  %270 = sub i64 %269, 1, !sec !{!"private"}
  %271 = icmp ult i64 %266, %270, !sec !{!"private"}
  br i1 %271, label %272, label %300, !sec !{!"private"}

272:                                              ; preds = %265, !sec !{!"private"}
  %273 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %274 = getelementptr inbounds %struct.node, ptr %273, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %275 = load ptr, ptr %274, align 8, !sec !{!"private", !"private"}
  %276 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %277 = add i64 %276, 1, !sec !{!"private"}
  %278 = getelementptr inbounds i64, ptr %275, i64 %277, !sec !{!"private", !"private", !"private"}
  %279 = load i64, ptr %278, align 8, !sec !{!"private", !"private"}
  %280 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %281 = getelementptr inbounds %struct.node, ptr %280, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %282 = load ptr, ptr %281, align 8, !sec !{!"private", !"private"}
  %283 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %284 = getelementptr inbounds i64, ptr %282, i64 %283, !sec !{!"private", !"private", !"private"}
  store i64 %279, ptr %284, align 8, !sec !{!"private", !"private"}
  %285 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %286 = getelementptr inbounds %struct.node, ptr %285, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %287 = load ptr, ptr %286, align 8, !sec !{!"private", !"private"}
  %288 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %289 = add i64 %288, 1, !sec !{!"private"}
  %290 = getelementptr inbounds ptr, ptr %287, i64 %289, !sec !{!"private", !"private", !"private"}
  %291 = load ptr, ptr %290, align 8, !sec !{!"private", !"private"}
  %292 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %293 = getelementptr inbounds %struct.node, ptr %292, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %294 = load ptr, ptr %293, align 8, !sec !{!"private", !"private"}
  %295 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %296 = getelementptr inbounds ptr, ptr %294, i64 %295, !sec !{!"private", !"private", !"private"}
  store ptr %291, ptr %296, align 8, !sec !{!"private", !"private"}
  br label %297

297:                                              ; preds = %272, !sec !{!"private"}
  %298 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %299 = add i64 %298, 1, !sec !{!"private"}
  store i64 %299, ptr %13, align 8, !sec !{!"private", !"private"}
  br label %265, !llvm.loop !52

300:                                              ; preds = %265, !sec !{!"private"}
  %301 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %302 = getelementptr inbounds %struct.node, ptr %301, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %303 = load i8, ptr %302, align 8, !sec !{!"private", !"private"}
  %304 = trunc i8 %303 to i1, !sec !{!"private"}
  br i1 %304, label %318, label %305, !sec !{!"private"}

305:                                              ; preds = %300, !sec !{!"private"}
  %306 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %307 = getelementptr inbounds %struct.node, ptr %306, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %308 = load ptr, ptr %307, align 8, !sec !{!"private", !"private"}
  %309 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %310 = add i64 %309, 1, !sec !{!"private"}
  %311 = getelementptr inbounds ptr, ptr %308, i64 %310, !sec !{!"private", !"private", !"private"}
  %312 = load ptr, ptr %311, align 8, !sec !{!"private", !"private"}
  %313 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %314 = getelementptr inbounds %struct.node, ptr %313, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %315 = load ptr, ptr %314, align 8, !sec !{!"private", !"private"}
  %316 = load i64, ptr %13, align 8, !sec !{!"private", !"private"}
  %317 = getelementptr inbounds ptr, ptr %315, i64 %316, !sec !{!"private", !"private", !"private"}
  store ptr %312, ptr %317, align 8, !sec !{!"private", !"private"}
  br label %318

318:                                              ; preds = %305, %300, !sec !{!"private"}
  br label %319

319:                                              ; preds = %318, %175, !sec !{!"private"}
  %320 = load ptr, ptr %8, align 8, !sec !{!"private", !"private"}
  %321 = getelementptr inbounds %struct.node, ptr %320, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %322 = load i64, ptr %321, align 8, !sec !{!"private", !"private"}
  %323 = add i64 %322, 1, !sec !{!"private"}
  store i64 %323, ptr %321, align 8, !sec !{!"private", !"private"}
  %324 = load ptr, ptr %9, align 8, !sec !{!"private", !"private"}
  %325 = getelementptr inbounds %struct.node, ptr %324, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %326 = load i64, ptr %325, align 8, !sec !{!"private", !"private"}
  %327 = add i64 %326, -1, !sec !{!"private"}
  store i64 %327, ptr %325, align 8, !sec !{!"private", !"private"}
  %328 = load ptr, ptr %7, align 8, !sec !{!"private", !"private"}
  ret ptr %328, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete(ptr noundef %0, i64 noundef %1) #0 !sec !{!"private", !"private", !{!"private", !"private"}} {
  %3 = alloca ptr, align 8, !sec !{!"private"}
  %4 = alloca i64, align 8, !sec !{!"private"}
  %5 = alloca ptr, align 8, !sec !{!"private"}
  %6 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %3, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %4, align 8, !sec !{!"private", !"private"}
  store ptr null, ptr %5, align 8, !sec !{!"private", !"private"}
  store ptr null, ptr %6, align 8, !sec !{!"private", !"private"}
  %7 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %8 = load i64, ptr %4, align 8, !sec !{!"private", !"private"}
  %9 = call ptr @find(ptr noundef %7, i64 noundef %8, i1 noundef zeroext false, ptr noundef %5), !sec !{!"call", !"private", !{!"private", !"private", !"public", !"private"}}
  store ptr %9, ptr %6, align 8, !sec !{!"private", !"private"}
  %10 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %11 = icmp ne ptr %10, null, !sec !{!"private"}
  br i1 %11, label %12, label %22, !sec !{!"private"}

12:                                               ; preds = %2, !sec !{!"private"}
  %13 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %14 = icmp ne ptr %13, null, !sec !{!"private"}
  br i1 %14, label %15, label %22, !sec !{!"private"}

15:                                               ; preds = %12, !sec !{!"private"}
  %16 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %17 = load ptr, ptr %5, align 8, !sec !{!"private", !"private"}
  %18 = load i64, ptr %4, align 8, !sec !{!"private", !"private"}
  %19 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  %20 = call ptr @delete_entry(ptr noundef %16, ptr noundef %17, i64 noundef %18, ptr noundef %19), !sec !{!"call", !"private", !{!"private", !"private", !"private", !"private"}}
  store ptr %20, ptr %3, align 8, !sec !{!"private", !"private"}
  %21 = load ptr, ptr %6, align 8, !sec !{!"private", !"private"}
  call void @free_record(ptr noundef %21), !sec !{!"call", !"void", !{!"private"}}
  br label %22

22:                                               ; preds = %15, %12, %2, !sec !{!"private"}
  %23 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  ret ptr %23, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @destroy_tree_nodes(ptr noundef %0) #0 !sec !{!"void", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  %3 = alloca i64, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %4 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %6 = load i8, ptr %5, align 8, !sec !{!"private", !"private"}
  %7 = trunc i8 %6 to i1, !sec !{!"private"}
  br i1 %7, label %8, label %26, !sec !{!"private"}

8:                                                ; preds = %1, !sec !{!"private"}
  store i64 0, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %9

9:                                                ; preds = %22, %8, !sec !{!"private"}
  %10 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %11 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %13 = load i64, ptr %12, align 8, !sec !{!"private", !"private"}
  %14 = icmp ult i64 %10, %13, !sec !{!"private"}
  br i1 %14, label %15, label %25, !sec !{!"private"}

15:                                               ; preds = %9, !sec !{!"private"}
  %16 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %18 = load ptr, ptr %17, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %20 = getelementptr inbounds ptr, ptr %18, i64 %19, !sec !{!"private", !"private", !"private"}
  %21 = load ptr, ptr %20, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %21) #8, !sec !{!"free", !"private"}
  br label %22

22:                                               ; preds = %15, !sec !{!"private"}
  %23 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %24 = add i64 %23, 1, !sec !{!"private"}
  store i64 %24, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %9, !llvm.loop !53

25:                                               ; preds = %9, !sec !{!"private"}
  br label %45

26:                                               ; preds = %1, !sec !{!"private"}
  store i64 0, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %27

27:                                               ; preds = %41, %26, !sec !{!"private"}
  %28 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %29 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %31 = load i64, ptr %30, align 8, !sec !{!"private", !"private"}
  %32 = add i64 %31, 1, !sec !{!"private"}
  %33 = icmp ult i64 %28, %32, !sec !{!"private"}
  br i1 %33, label %34, label %44, !sec !{!"private"}

34:                                               ; preds = %27, !sec !{!"private"}
  %35 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %37 = load ptr, ptr %36, align 8, !sec !{!"private", !"private"}
  %38 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %39 = getelementptr inbounds ptr, ptr %37, i64 %38, !sec !{!"private", !"private", !"private"}
  %40 = load ptr, ptr %39, align 8, !sec !{!"private", !"private"}
  call void @destroy_tree_nodes(ptr noundef %40), !sec !{!"call", !"void", !{!"private"}}
  br label %41

41:                                               ; preds = %34, !sec !{!"private"}
  %42 = load i64, ptr %3, align 8, !sec !{!"private", !"private"}
  %43 = add i64 %42, 1, !sec !{!"private"}
  store i64 %43, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %27, !llvm.loop !54

44:                                               ; preds = %27, !sec !{!"private"}
  br label %45

45:                                               ; preds = %44, %25, !sec !{!"private"}
  %46 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %47 = getelementptr inbounds %struct.node, ptr %46, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %48 = load ptr, ptr %47, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %48) #8, !sec !{!"free", !"private"}
  %49 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %51 = load ptr, ptr %50, align 8, !sec !{!"private", !"private"}
  call void @free(ptr noundef %51) #8, !sec !{!"free", !"private"}
  %52 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  call void @free_node(ptr noundef %52), !sec !{!"call", !"void", !{!"private"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @destroy_tree(ptr noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8, !sec !{!"private"}
  store ptr %0, ptr %2, align 8, !sec !{!"private", !"private"}
  %3 = load ptr, ptr %2, align 8, !sec !{!"private", !"private"}
  call void @destroy_tree_nodes(ptr noundef %3), !sec !{!"call", !"void", !{!"private"}}
  ret ptr null, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @myrand() #0 !sec !{!"public", !"public", !{}} {
  call void @next(), !sec !{!"call", !"void", !{}}
  %1 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16, !sec !{!"public", !"public"}
  %2 = shl i64 %1, 15, !sec !{!"public"}
  %3 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"public", !"public"}
  %4 = lshr i64 %3, 1, !sec !{!"public"}
  %5 = add i64 %2, %4, !sec !{!"public"}
  ret i64 %5, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @next() #0 !sec !{!"void", !"private", !{}} {
  %1 = alloca [2 x i64], align 16, !sec !{!"private"}
  %2 = alloca [2 x i64], align 16, !sec !{!"private"}
  %3 = alloca [2 x i64], align 16, !sec !{!"private"}
  %4 = alloca i64, align 8, !sec !{!"private"}
  %5 = alloca i64, align 8, !sec !{!"private"}
  %6 = alloca i32, align 4, !sec !{!"private"}
  %7 = alloca i32, align 4, !sec !{!"private"}
  %8 = alloca i32, align 4, !sec !{!"private"}
  %9 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %10 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %11 = mul nsw i64 %9, %10, !sec !{!"private"}
  %12 = trunc i64 %11 to i32, !sec !{!"private"}
  store i32 %12, ptr %6, align 4, !sec !{!"private", !"private"}
  %13 = load i32, ptr %6, align 4, !sec !{!"private", !"private"}
  %14 = and i32 %13, 65535, !sec !{!"private"}
  %15 = zext i32 %14 to i64, !sec !{!"private"}
  %16 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %15, ptr %16, align 16, !sec !{!"private", !"private"}
  %17 = load i32, ptr %6, align 4, !sec !{!"private", !"private"}
  %18 = ashr i32 %17, 16, !sec !{!"private"}
  %19 = and i32 %18, 65535, !sec !{!"private"}
  %20 = zext i32 %19 to i64, !sec !{!"private"}
  %21 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %20, ptr %21, align 8, !sec !{!"private", !"private"}
  %22 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %23 = load i64, ptr %22, align 16, !sec !{!"private", !"private"}
  %24 = trunc i64 %23 to i32, !sec !{!"private"}
  %25 = sext i32 %24 to i64, !sec !{!"private"}
  %26 = load i64, ptr @c, align 8, !sec !{!"private", !"public"}
  %27 = add nsw i64 %25, %26, !sec !{!"private"}
  %28 = icmp sgt i64 %27, 65535, !sec !{!"private"}
  %29 = zext i1 %28 to i32, !sec !{!"private"}
  %30 = sext i32 %29 to i64, !sec !{!"private"}
  store i64 %30, ptr %4, align 8, !sec !{!"private", !"private"}
  %31 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %32 = load i64, ptr %31, align 16, !sec !{!"private", !"private"}
  %33 = load i64, ptr @c, align 8, !sec !{!"private", !"public"}
  %34 = add i64 %32, %33, !sec !{!"private"}
  %35 = trunc i64 %34 to i32, !sec !{!"private"}
  %36 = and i32 %35, 65535, !sec !{!"private"}
  %37 = zext i32 %36 to i64, !sec !{!"private"}
  %38 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %37, ptr %38, align 16, !sec !{!"private", !"private"}
  %39 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %40 = load i64, ptr %39, align 8, !sec !{!"private", !"private"}
  %41 = trunc i64 %40 to i32, !sec !{!"private"}
  %42 = sext i32 %41 to i64, !sec !{!"private"}
  %43 = load i64, ptr %4, align 8, !sec !{!"private", !"private"}
  %44 = add nsw i64 %42, %43, !sec !{!"private"}
  %45 = icmp sgt i64 %44, 65535, !sec !{!"private"}
  %46 = zext i1 %45 to i32, !sec !{!"private"}
  %47 = sext i32 %46 to i64, !sec !{!"private"}
  store i64 %47, ptr %5, align 8, !sec !{!"private", !"private"}
  %48 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %49 = load i64, ptr %48, align 8, !sec !{!"private", !"private"}
  %50 = load i64, ptr %4, align 8, !sec !{!"private", !"private"}
  %51 = add i64 %49, %50, !sec !{!"private"}
  %52 = trunc i64 %51 to i32, !sec !{!"private"}
  %53 = and i32 %52, 65535, !sec !{!"private"}
  %54 = zext i32 %53 to i64, !sec !{!"private"}
  %55 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %54, ptr %55, align 8, !sec !{!"private", !"private"}
  %56 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %57 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %58 = mul nsw i64 %56, %57, !sec !{!"private"}
  %59 = trunc i64 %58 to i32, !sec !{!"private"}
  store i32 %59, ptr %7, align 4, !sec !{!"private", !"private"}
  %60 = load i32, ptr %7, align 4, !sec !{!"private", !"private"}
  %61 = and i32 %60, 65535, !sec !{!"private"}
  %62 = zext i32 %61 to i64, !sec !{!"private"}
  %63 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %62, ptr %63, align 16, !sec !{!"private", !"private"}
  %64 = load i32, ptr %7, align 4, !sec !{!"private", !"private"}
  %65 = ashr i32 %64, 16, !sec !{!"private"}
  %66 = and i32 %65, 65535, !sec !{!"private"}
  %67 = zext i32 %66 to i64, !sec !{!"private"}
  %68 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %67, ptr %68, align 8, !sec !{!"private", !"private"}
  %69 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %70 = load i64, ptr %69, align 8, !sec !{!"private", !"private"}
  %71 = trunc i64 %70 to i32, !sec !{!"private"}
  %72 = sext i32 %71 to i64, !sec !{!"private"}
  %73 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %74 = load i64, ptr %73, align 16, !sec !{!"private", !"private"}
  %75 = add nsw i64 %72, %74, !sec !{!"private"}
  %76 = icmp sgt i64 %75, 65535, !sec !{!"private"}
  %77 = zext i1 %76 to i32, !sec !{!"private"}
  %78 = sext i32 %77 to i64, !sec !{!"private"}
  store i64 %78, ptr %4, align 8, !sec !{!"private", !"private"}
  %79 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %80 = load i64, ptr %79, align 8, !sec !{!"private", !"private"}
  %81 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %82 = load i64, ptr %81, align 16, !sec !{!"private", !"private"}
  %83 = add i64 %80, %82, !sec !{!"private"}
  %84 = trunc i64 %83 to i32, !sec !{!"private"}
  %85 = and i32 %84, 65535, !sec !{!"private"}
  %86 = zext i32 %85 to i64, !sec !{!"private"}
  %87 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %86, ptr %87, align 8, !sec !{!"private", !"private"}
  %88 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %89 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %90 = mul nsw i64 %88, %89, !sec !{!"private"}
  %91 = trunc i64 %90 to i32, !sec !{!"private"}
  store i32 %91, ptr %8, align 4, !sec !{!"private", !"private"}
  %92 = load i32, ptr %8, align 4, !sec !{!"private", !"private"}
  %93 = and i32 %92, 65535, !sec !{!"private"}
  %94 = zext i32 %93 to i64, !sec !{!"private"}
  %95 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %94, ptr %95, align 16, !sec !{!"private", !"private"}
  %96 = load i32, ptr %8, align 4, !sec !{!"private", !"private"}
  %97 = ashr i32 %96, 16, !sec !{!"private"}
  %98 = and i32 %97, 65535, !sec !{!"private"}
  %99 = zext i32 %98 to i64, !sec !{!"private"}
  %100 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %99, ptr %100, align 8, !sec !{!"private", !"private"}
  %101 = load i64, ptr %4, align 8, !sec !{!"private", !"private"}
  %102 = load i64, ptr %5, align 8, !sec !{!"private", !"private"}
  %103 = add i64 %101, %102, !sec !{!"private"}
  %104 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %105 = load i64, ptr %104, align 8, !sec !{!"private", !"private"}
  %106 = trunc i64 %105 to i32, !sec !{!"private"}
  %107 = sext i32 %106 to i64, !sec !{!"private"}
  %108 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %109 = load i64, ptr %108, align 16, !sec !{!"private", !"private"}
  %110 = add nsw i64 %107, %109, !sec !{!"private"}
  %111 = icmp sgt i64 %110, 65535, !sec !{!"private"}
  %112 = zext i1 %111 to i32, !sec !{!"private"}
  %113 = sext i32 %112 to i64, !sec !{!"private"}
  %114 = add i64 %103, %113, !sec !{!"private"}
  %115 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %116 = load i64, ptr %115, align 8, !sec !{!"private", !"private"}
  %117 = add i64 %114, %116, !sec !{!"private"}
  %118 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %119 = load i64, ptr %118, align 8, !sec !{!"private", !"private"}
  %120 = add i64 %117, %119, !sec !{!"private"}
  %121 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %122 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16, !sec !{!"private", !"public"}
  %123 = mul i64 %121, %122, !sec !{!"private"}
  %124 = add i64 %120, %123, !sec !{!"private"}
  %125 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %126 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %127 = mul i64 %125, %126, !sec !{!"private"}
  %128 = add i64 %124, %127, !sec !{!"private"}
  %129 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16, !sec !{!"private", !"public"}
  %130 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %131 = mul i64 %129, %130, !sec !{!"private"}
  %132 = add i64 %128, %131, !sec !{!"private"}
  %133 = trunc i64 %132 to i32, !sec !{!"private"}
  %134 = and i32 %133, 65535, !sec !{!"private"}
  %135 = zext i32 %134 to i64, !sec !{!"private"}
  store i64 %135, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  %136 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %137 = load i64, ptr %136, align 8, !sec !{!"private", !"private"}
  %138 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %139 = load i64, ptr %138, align 16, !sec !{!"private", !"private"}
  %140 = add i64 %137, %139, !sec !{!"private"}
  %141 = trunc i64 %140 to i32, !sec !{!"private"}
  %142 = and i32 %141, 65535, !sec !{!"private"}
  %143 = zext i32 %142 to i64, !sec !{!"private"}
  store i64 %143, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %144 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %145 = load i64, ptr %144, align 16, !sec !{!"private", !"private"}
  %146 = trunc i64 %145 to i32, !sec !{!"private"}
  %147 = and i32 %146, 65535, !sec !{!"private"}
  %148 = zext i32 %147 to i64, !sec !{!"private"}
  store i64 %148, ptr @x, align 16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myrandseed(i32 noundef %0) #0 !sec !{!"void", !"private", !{!"private"}} {
  %2 = alloca i32, align 4, !sec !{!"private"}
  store i32 %0, ptr %2, align 4, !sec !{!"private", !"private"}
  store i64 13070, ptr @x, align 16
  %3 = load i32, ptr %2, align 4, !sec !{!"private", !"private"}
  %4 = and i32 %3, 65535, !sec !{!"private"}
  %5 = zext i32 %4 to i64, !sec !{!"private"}
  store i64 %5, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %6 = load i32, ptr %2, align 4, !sec !{!"private", !"private"}
  %7 = ashr i32 %6, 16, !sec !{!"private"}
  %8 = and i32 %7, 65535, !sec !{!"private"}
  %9 = zext i32 %8 to i64, !sec !{!"private"}
  store i64 %9, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  store i64 58989, ptr @a, align 16
  store i64 57068, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8
  store i64 5, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16
  store i64 11, ptr @c, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @real_main() #0 !sec !{!"public", !"public", !{}} {
  %1 = alloca ptr, align 8, !sec !{!"public"}
  %2 = alloca ptr, align 8, !sec !{!"public"}
  %3 = alloca ptr, align 8, !sec !{!"private"}
  %4 = alloca i64, align 8, !sec !{!"public"}
  %5 = alloca i64, align 8, !sec !{!"public"}
  %6 = alloca i64, align 8, !sec !{!"public"}
  %7 = alloca ptr, align 8, !sec !{!"public"}
  %8 = alloca i64, align 8, !sec !{!"public"}
  %9 = alloca i64, align 8, !sec !{!"public"}
  %10 = alloca i64, align 8, !sec !{!"public"}
  %11 = alloca i64, align 8, !sec !{!"public"}
  %12 = alloca i64, align 8, !sec !{!"public"}
  %13 = alloca i64, align 8, !sec !{!"public"}
  %14 = alloca %struct.timeval, align 8, !sec !{!"public"}
  %15 = alloca %struct.timeval, align 8, !sec !{!"public"}
  %16 = alloca i64, align 8, !sec !{!"public"}
  %17 = alloca i64, align 8, !sec !{!"public"}
  %18 = alloca ptr, align 8, !sec !{!"public"}
  %19 = alloca ptr, align 8, !sec !{!"public"}
  store ptr null, ptr %3, align 8, !sec !{!"private", !"private"}
  store i8 0, ptr @verbose_output, align 1
  call void @myrandseed(i32 noundef -889275714), !sec !{!"call", !"void", !{!"private"}}
  store i64 1548576, ptr %4, align 8, !sec !{!"public", !"public"}
  store i64 1200000000, ptr %5, align 8, !sec !{!"public", !"public"}
  %20 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %21 = mul i64 %20, 64, !sec !{!"public"}
  store i64 %21, ptr %6, align 8, !sec !{!"public", !"public"}
  %22 = load i64, ptr %6, align 8, !sec !{!"public", !"public"}
  %23 = call ptr @allocate(i64 noundef %22, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %23, ptr %7, align 8, !sec !{!"public", !"public"}
  %24 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %25 = icmp eq ptr %24, null, !sec !{!"public"}
  br i1 %25, label %26, label %29, !sec !{!"public"}

26:                                               ; preds = %0, !sec !{!"public"}
  %27 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %27, ptr noundef @.str.37), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

29:                                               ; preds = %0, !sec !{!"public"}
  %30 = load i64, ptr %6, align 8, !sec !{!"public", !"public"}
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.38, i64 noundef %30), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %32

32:                                               ; preds = %29, !sec !{!"public"}
  store i64 0, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %33

33:                                               ; preds = %50, %32, !sec !{!"public"}
  %34 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %35 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %36 = icmp ult i64 %34, %35, !sec !{!"public"}
  br i1 %36, label %37, label %53, !sec !{!"public"}

37:                                               ; preds = %33, !sec !{!"public"}
  %38 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %39 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %40 = getelementptr inbounds %struct.element, ptr %38, i64 %39, !sec !{!"public", !"public", !"public"}
  %41 = getelementptr inbounds %struct.element, ptr %40, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 4, ptr %41, align 8, !sec !{!"public", !"public"}
  %42 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %43 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %44 = getelementptr inbounds %struct.element, ptr %42, i64 %43, !sec !{!"public", !"public", !"public"}
  %45 = getelementptr inbounds %struct.element, ptr %44, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store i64 0, ptr %45, align 8, !sec !{!"public", !"public"}
  %46 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %47 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %48 = getelementptr inbounds %struct.element, ptr %46, i64 %47, !sec !{!"public", !"public", !"public"}
  %49 = getelementptr inbounds %struct.element, ptr %48, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store i64 1, ptr %49, align 8, !sec !{!"public", !"public"}
  br label %50

50:                                               ; preds = %37, !sec !{!"public"}
  %51 = load i64, ptr %8, align 8, !sec !{!"public", !"public"}
  %52 = add i64 %51, 1, !sec !{!"public"}
  store i64 %52, ptr %8, align 8, !sec !{!"public", !"public"}
  br label %33, !llvm.loop !55

53:                                               ; preds = %33, !sec !{!"public"}
  %54 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  store i64 %54, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %55

55:                                               ; preds = %82, %53, !sec !{!"public"}
  %56 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %57 = icmp ugt i64 %56, 1, !sec !{!"public"}
  br i1 %57, label %58, label %85, !sec !{!"public"}

58:                                               ; preds = %55, !sec !{!"public"}
  %59 = call i64 @myrand(), !sec !{!"call", !"public", !{}}
  %60 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %61 = add i64 %60, 1, !sec !{!"public"}
  %62 = urem i64 %59, %61, !sec !{!"public"}
  store i64 %62, ptr %10, align 8, !sec !{!"public", !"public"}
  %63 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %64 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %65 = getelementptr inbounds %struct.element, ptr %63, i64 %64, !sec !{!"public", !"public", !"public"}
  %66 = getelementptr inbounds %struct.element, ptr %65, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %67 = load i64, ptr %66, align 8, !sec !{!"public", !"public"}
  store i64 %67, ptr %11, align 8, !sec !{!"public", !"public"}
  %68 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %69 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %70 = getelementptr inbounds %struct.element, ptr %68, i64 %69, !sec !{!"public", !"public", !"public"}
  %71 = getelementptr inbounds %struct.element, ptr %70, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %72 = load i64, ptr %71, align 8, !sec !{!"public", !"public"}
  %73 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %74 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %75 = getelementptr inbounds %struct.element, ptr %73, i64 %74, !sec !{!"public", !"public", !"public"}
  %76 = getelementptr inbounds %struct.element, ptr %75, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %72, ptr %76, align 8, !sec !{!"public", !"public"}
  %77 = load i64, ptr %11, align 8, !sec !{!"public", !"public"}
  %78 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %79 = load i64, ptr %10, align 8, !sec !{!"public", !"public"}
  %80 = getelementptr inbounds %struct.element, ptr %78, i64 %79, !sec !{!"public", !"public", !"public"}
  %81 = getelementptr inbounds %struct.element, ptr %80, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %77, ptr %81, align 8, !sec !{!"public", !"public"}
  br label %82

82:                                               ; preds = %58, !sec !{!"public"}
  %83 = load i64, ptr %9, align 8, !sec !{!"public", !"public"}
  %84 = add i64 %83, -1, !sec !{!"public"}
  store i64 %84, ptr %9, align 8, !sec !{!"public", !"public"}
  br label %55, !llvm.loop !56

85:                                               ; preds = %55, !sec !{!"public"}
  store i64 0, ptr %12, align 8, !sec !{!"public", !"public"}
  br label %86

86:                                               ; preds = %102, %85, !sec !{!"public"}
  %87 = load i64, ptr %12, align 8, !sec !{!"public", !"public"}
  %88 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %89 = icmp ult i64 %87, %88, !sec !{!"public"}
  br i1 %89, label %90, label %105, !sec !{!"public"}

90:                                               ; preds = %86, !sec !{!"public"}
  %91 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %92 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %93 = load i64, ptr %12, align 8, !sec !{!"public", !"public"}
  %94 = getelementptr inbounds %struct.element, ptr %92, i64 %93, !sec !{!"public", !"public", !"public"}
  %95 = getelementptr inbounds %struct.element, ptr %94, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %96 = load i64, ptr %95, align 8, !sec !{!"private", !"public"}
  %97 = load ptr, ptr %7, align 8, !sec !{!"public", !"public"}
  %98 = load i64, ptr %12, align 8, !sec !{!"public", !"public"}
  %99 = getelementptr inbounds %struct.element, ptr %97, i64 %98, !sec !{!"public", !"public", !"public"}
  %100 = ptrtoint ptr %99 to i64, !sec !{!"public"}
  %101 = call ptr @insert(ptr noundef %91, i64 noundef %96, i64 noundef %100), !sec !{!"call", !"private", !{!"private", !"private", !"public"}}
  store ptr %101, ptr %3, align 8, !sec !{!"private", !"private"}
  br label %102

102:                                              ; preds = %90, !sec !{!"public"}
  %103 = load i64, ptr %12, align 8, !sec !{!"public", !"public"}
  %104 = add i64 %103, 1, !sec !{!"public"}
  store i64 %104, ptr %12, align 8, !sec !{!"public", !"public"}
  br label %86, !llvm.loop !57

105:                                              ; preds = %86, !sec !{!"public"}
  %106 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.39, i64 noundef %106), !sec !{!"call", !"public", !{!"public", !"public"}}
  %108 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %109 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, i64 noundef %108), !sec !{!"call", !"public", !{!"public", !"public"}}
  %110 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %111 = lshr i64 %110, 20, !sec !{!"public"}
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.41, i64 noundef %111), !sec !{!"call", !"public", !{!"public", !"public"}}
  %113 = call i32 @usleep(i32 noundef 250), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %13, align 8, !sec !{!"public", !"public"}
  %114 = call i32 @gettimeofday(ptr noundef %14, ptr noundef null) #8, !sec !{!"call", !"public", !{!"public", !"public"}}
  store i64 0, ptr %16, align 8, !sec !{!"public", !"public"}
  br label %115

115:                                              ; preds = %148, %105, !sec !{!"public"}
  %116 = load i64, ptr %16, align 8, !sec !{!"public", !"public"}
  %117 = load i64, ptr %5, align 8, !sec !{!"public", !"public"}
  %118 = icmp ult i64 %116, %117, !sec !{!"public"}
  br i1 %118, label %119, label %151, !sec !{!"public"}

119:                                              ; preds = %115, !sec !{!"public"}
  %120 = call i64 @myrand(), !sec !{!"call", !"public", !{}}
  %121 = load i64, ptr %4, align 8, !sec !{!"public", !"public"}
  %122 = mul i64 %121, 2, !sec !{!"public"}
  %123 = urem i64 %120, %122, !sec !{!"public"}
  store i64 %123, ptr %17, align 8, !sec !{!"public", !"public"}
  %124 = load ptr, ptr %3, align 8, !sec !{!"private", !"private"}
  %125 = load i64, ptr %17, align 8, !sec !{!"public", !"public"}
  %126 = call ptr @find(ptr noundef %124, i64 noundef %125, i1 noundef zeroext false, ptr noundef null), !sec !{!"call", !"public", !{!"private", !"public", !"public", !"public"}}
  store ptr %126, ptr %18, align 8, !sec !{!"public", !"public"}
  %127 = load ptr, ptr %18, align 8, !sec !{!"public", !"public"}
  %128 = icmp ne ptr %127, null, !sec !{!"public"}
  br i1 %128, label %129, label %147, !sec !{!"public"}

129:                                              ; preds = %119, !sec !{!"public"}
  %130 = load ptr, ptr %18, align 8, !sec !{!"public", !"public"}
  %131 = getelementptr inbounds %struct.record, ptr %130, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %132 = load i64, ptr %131, align 8, !sec !{!"public", !"public"}
  %133 = inttoptr i64 %132 to ptr
  store ptr %133, ptr %19, align 8, !sec !{!"public", !"public"}
  %134 = load ptr, ptr %18, align 8, !sec !{!"public", !"public"}
  %135 = getelementptr inbounds %struct.record, ptr %134, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %136 = load i64, ptr %135, align 8, !sec !{!"public", !"public"}
  %137 = add i64 %136, 1, !sec !{!"public"}
  store i64 %137, ptr %135, align 8, !sec !{!"public", !"public"}
  %138 = load ptr, ptr %19, align 8, !sec !{!"public", !"public"}
  %139 = icmp ne ptr %138, null, !sec !{!"public"}
  br i1 %139, label %140, label %146, !sec !{!"public"}

140:                                              ; preds = %129, !sec !{!"public"}
  %141 = load ptr, ptr %19, align 8, !sec !{!"public", !"public"}
  %142 = getelementptr inbounds %struct.element, ptr %141, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %143 = load i64, ptr %142, align 8, !sec !{!"public", !"public"}
  %144 = load i64, ptr %13, align 8, !sec !{!"public", !"public"}
  %145 = add i64 %144, %143, !sec !{!"public"}
  store i64 %145, ptr %13, align 8, !sec !{!"public", !"public"}
  br label %146

146:                                              ; preds = %140, %129, !sec !{!"public"}
  br label %147

147:                                              ; preds = %146, %119, !sec !{!"public"}
  br label %148

148:                                              ; preds = %147, !sec !{!"public"}
  %149 = load i64, ptr %16, align 8, !sec !{!"public", !"public"}
  %150 = add i64 %149, 1, !sec !{!"public"}
  store i64 %150, ptr %16, align 8, !sec !{!"public", !"public"}
  br label %115, !llvm.loop !58

151:                                              ; preds = %115, !sec !{!"public"}
  %152 = call i32 @gettimeofday(ptr noundef %15, ptr noundef null) #8, !sec !{!"call", !"public", !{!"public", !"public"}}
  %153 = load i64, ptr %13, align 8, !sec !{!"public", !"public"}
  %154 = getelementptr inbounds %struct.timeval, ptr %15, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %155 = load i64, ptr %154, align 8, !sec !{!"public", !"public"}
  %156 = getelementptr inbounds %struct.timeval, ptr %14, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %157 = load i64, ptr %156, align 8, !sec !{!"public", !"public"}
  %158 = sub nsw i64 %155, %157, !sec !{!"public"}
  %159 = call i32 (ptr, ...) @printf(ptr noundef @.str.42, i64 noundef %153, i64 noundef %158), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %160 = call i32 (ptr, ...) @printf(ptr noundef @.str.43), !sec !{!"call", !"public", !{!"public"}}
  ret i32 0, !sec !{!"public"}
}

declare !sec !{!"public", !"public", !{!"public", !"public"}} i32 @usleep(i32 noundef) #1

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public"}} i32 @gettimeofday(ptr noundef, ptr noundef) #6

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public", !"public"}} i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) #6