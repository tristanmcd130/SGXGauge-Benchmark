; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @license_notice() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef @.str.1)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @printf(ptr noundef, ...) #1

define dso_local void @usage_1() #0 !sec !{!"void", !"public", !{}} {
  %1 = load i64, ptr @order, align 8
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 3, i32 noundef 20)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_2() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_3() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 3, i32 noundef 20)
  ret void
}

; TODO: should 12 and 17 really be public?
; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enqueue(ptr noundef %0) #0 !sec !{!"void", !"private", !{!"nosec"}} {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr @queue, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  store ptr %7, ptr @queue, align 8
  %8 = load ptr, ptr @queue, align 8
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 6
  store ptr null, ptr %9, align 8
  br label %27

10:                                               ; preds = %1
  %11 = load ptr, ptr @queue, align 8
  store ptr %11, ptr %3, align 8
  br label %12

12:                                               ; preds = %17, %10
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 6
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %21

17:                                               ; preds = %12
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 6
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %3, align 8
  br label %12, !llvm.loop !6

21:                                               ; preds = %12
  %22 = load ptr, ptr %2, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 6
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 6
  store ptr null, ptr %26, align 8
  br label %27

27:                                               ; preds = %21, %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dequeue() #0 !sec !{!"public", !"public", !{}} {
  %1 = alloca ptr, align 8
  %2 = load ptr, ptr @queue, align 8
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr @queue, align 8
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  store ptr %5, ptr @queue, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 6
  store ptr null, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  ret ptr %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_leaves(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"nonsec"}} {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %87

9:                                                ; preds = %1
  %10 = load ptr, ptr %2, align 8
  store ptr %10, ptr %4, align 8
  br label %11

11:                                               ; preds = %17, %9
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 3
  %14 = load i8, ptr %13, align 8
  %15 = trunc i8 %14 to i1
  %16 = xor i1 %15, true
  br i1 %16, label %17, label %23

17:                                               ; preds = %11
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 0
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %4, align 8
  br label %11, !llvm.loop !8

23:                                               ; preds = %11
  br label %24

24:                                               ; preds = %23, %84
  store i64 0, ptr %3, align 8
  br label %25

25:                                               ; preds = %50, %24
  %26 = load i64, ptr %3, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 4
  %29 = load i64, ptr %28, align 8
  %30 = icmp ult i64 %26, %29
  br i1 %30, label %31, label %53

31:                                               ; preds = %25
  %32 = load i8, ptr @verbose_output, align 1
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %42

34:                                               ; preds = %31
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %3, align 8
  %39 = getelementptr inbounds ptr, ptr %37, i64 %38
  %40 = load ptr, ptr %39, align 8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %40)
  br label %42

42:                                               ; preds = %34, %31
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %3, align 8
  %47 = getelementptr inbounds i64, ptr %45, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %48)
  br label %50

50:                                               ; preds = %42
  %51 = load i64, ptr %3, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr %3, align 8
  br label %25, !llvm.loop !9

53:                                               ; preds = %25
  %54 = load i8, ptr @verbose_output, align 1
  %55 = trunc i8 %54 to i1
  br i1 %55, label %56, label %65

56:                                               ; preds = %53
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = load i64, ptr @order, align 8
  %61 = sub i64 %60, 1
  %62 = getelementptr inbounds ptr, ptr %59, i64 %61
  %63 = load ptr, ptr %62, align 8
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %63)
  br label %65

65:                                               ; preds = %56, %53
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds %struct.node, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = load i64, ptr @order, align 8
  %70 = sub i64 %69, 1
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70
  %72 = load ptr, ptr %71, align 8
  %73 = icmp ne ptr %72, null
  br i1 %73, label %74, label %83

74:                                               ; preds = %65
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.node, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  %79 = load i64, ptr @order, align 8
  %80 = sub i64 %79, 1
  %81 = getelementptr inbounds ptr, ptr %78, i64 %80
  %82 = load ptr, ptr %81, align 8
  store ptr %82, ptr %4, align 8
  br label %84

83:                                               ; preds = %65
  br label %85

84:                                               ; preds = %74
  br label %24

85:                                               ; preds = %83
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %87

87:                                               ; preds = %85, %7
  ret void
}

; WHILE LOOP WITH PRIVATE CONDITION
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @height(ptr noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr %5, ptr %4, align 8
  br label %6

6:                                                ; preds = %12, %1
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 3
  %9 = load i8, ptr %8, align 8
  %10 = trunc i8 %9 to i1
  %11 = xor i1 %10, true
  br i1 %11, label %12, label %20

12:                                               ; preds = %6
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %4, align 8
  %18 = load i64, ptr %3, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %3, align 8
  br label %6, !llvm.loop !10

20:                                               ; preds = %6
  %21 = load i64, ptr %3, align 8
  ret i64 %21
}

; WHILE LOOP WITH PRIVATE CONDITION
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @path_to_root(ptr noundef %0, ptr noundef %1) #0 !sec !{!"private", !"private", !{!"nosec", !"nosec"}} {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  br label %8

8:                                                ; preds = %12, %2
  %9 = load ptr, ptr %6, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %9, %10
  br i1 %11, label %12, label %18

12:                                               ; preds = %8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  %16 = load i64, ptr %5, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr %5, align 8
  br label %8, !llvm.loop !11

18:                                               ; preds = %8
  %19 = load i64, ptr %5, align 8
  ret i64 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_tree(ptr noundef %0) #0 !sec !{!"void", !"public", !{!"nonsec"}} {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store ptr null, ptr %3, align 8
  store i64 0, ptr %4, align 8
  store i64 0, ptr %5, align 8
  store i64 0, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %133

11:                                               ; preds = %1
  store ptr null, ptr @queue, align 8
  %12 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %12)
  br label %13

13:                                               ; preds = %129, %11
  %14 = load ptr, ptr @queue, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %131

16:                                               ; preds = %13
  %17 = call ptr @dequeue()
  store ptr %17, ptr %3, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %43

22:                                               ; preds = %16
  %23 = load ptr, ptr %3, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 0
  %30 = load ptr, ptr %29, align 8
  %31 = icmp eq ptr %23, %30
  br i1 %31, label %32, label %43

32:                                               ; preds = %22
  %33 = load ptr, ptr %2, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = call i64 @path_to_root(ptr noundef %33, ptr noundef %34)
  store i64 %35, ptr %6, align 8
  %36 = load i64, ptr %6, align 8
  %37 = load i64, ptr %5, align 8
  %38 = icmp ne i64 %36, %37
  br i1 %38, label %39, label %42

39:                                               ; preds = %32
  %40 = load i64, ptr %6, align 8
  store i64 %40, ptr %5, align 8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %42

42:                                               ; preds = %39, %32
  br label %43

43:                                               ; preds = %42, %22, %16
  %44 = load i8, ptr @verbose_output, align 1
  %45 = trunc i8 %44 to i1
  br i1 %45, label %46, label %49

46:                                               ; preds = %43
  %47 = load ptr, ptr %3, align 8
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %47)
  br label %49

49:                                               ; preds = %46, %43
  store i64 0, ptr %4, align 8
  br label %50

50:                                               ; preds = %75, %49
  %51 = load i64, ptr %4, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 4
  %54 = load i64, ptr %53, align 8
  %55 = icmp ult i64 %51, %54
  br i1 %55, label %56, label %78

56:                                               ; preds = %50
  %57 = load i8, ptr @verbose_output, align 1
  %58 = trunc i8 %57 to i1
  br i1 %58, label %59, label %67

59:                                               ; preds = %56
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 0
  %62 = load ptr, ptr %61, align 8
  %63 = load i64, ptr %4, align 8
  %64 = getelementptr inbounds ptr, ptr %62, i64 %63
  %65 = load ptr, ptr %64, align 8
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %65)
  br label %67

67:                                               ; preds = %59, %56
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  %71 = load i64, ptr %4, align 8
  %72 = getelementptr inbounds i64, ptr %70, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %73)
  br label %75

75:                                               ; preds = %67
  %76 = load i64, ptr %4, align 8
  %77 = add i64 %76, 1
  store i64 %77, ptr %4, align 8
  br label %50, !llvm.loop !12

78:                                               ; preds = %50
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 3
  %81 = load i8, ptr %80, align 8
  %82 = trunc i8 %81 to i1
  br i1 %82, label %101, label %83

83:                                               ; preds = %78
  store i64 0, ptr %4, align 8
  br label %84

84:                                               ; preds = %97, %83
  %85 = load i64, ptr %4, align 8
  %86 = load ptr, ptr %3, align 8
  %87 = getelementptr inbounds %struct.node, ptr %86, i32 0, i32 4
  %88 = load i64, ptr %87, align 8
  %89 = icmp ule i64 %85, %88
  br i1 %89, label %90, label %100

90:                                               ; preds = %84
  %91 = load ptr, ptr %3, align 8
  %92 = getelementptr inbounds %struct.node, ptr %91, i32 0, i32 0
  %93 = load ptr, ptr %92, align 8
  %94 = load i64, ptr %4, align 8
  %95 = getelementptr inbounds ptr, ptr %93, i64 %94
  %96 = load ptr, ptr %95, align 8
  call void @enqueue(ptr noundef %96)
  br label %97

97:                                               ; preds = %90
  %98 = load i64, ptr %4, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr %4, align 8
  br label %84, !llvm.loop !13

100:                                              ; preds = %84
  br label %101

101:                                              ; preds = %100, %78
  %102 = load i8, ptr @verbose_output, align 1
  %103 = trunc i8 %102 to i1
  br i1 %103, label %104, label %129

104:                                              ; preds = %101
  %105 = load ptr, ptr %3, align 8
  %106 = getelementptr inbounds %struct.node, ptr %105, i32 0, i32 3
  %107 = load i8, ptr %106, align 8
  %108 = trunc i8 %107 to i1
  br i1 %108, label %109, label %118

109:                                              ; preds = %104
  %110 = load ptr, ptr %3, align 8
  %111 = getelementptr inbounds %struct.node, ptr %110, i32 0, i32 0
  %112 = load ptr, ptr %111, align 8
  %113 = load i64, ptr @order, align 8
  %114 = sub i64 %113, 1
  %115 = getelementptr inbounds ptr, ptr %112, i64 %114
  %116 = load ptr, ptr %115, align 8
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %116)
  br label %128

118:                                              ; preds = %104
  %119 = load ptr, ptr %3, align 8
  %120 = getelementptr inbounds %struct.node, ptr %119, i32 0, i32 0
  %121 = load ptr, ptr %120, align 8
  %122 = load ptr, ptr %3, align 8
  %123 = getelementptr inbounds %struct.node, ptr %122, i32 0, i32 4
  %124 = load i64, ptr %123, align 8
  %125 = getelementptr inbounds ptr, ptr %121, i64 %124
  %126 = load ptr, ptr %125, align 8
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %126)
  br label %128

128:                                              ; preds = %118, %109
  br label %129

129:                                              ; preds = %128, %101
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %13, !llvm.loop !14

131:                                              ; preds = %13
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %133

133:                                              ; preds = %131, %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 !sec !{!"void", !"public", !{!"private", !"public", !"public"}} {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = zext i1 %2 to i8
  store i8 %8, ptr %6, align 1
  %9 = load ptr, ptr %4, align 8
  %10 = load i64, ptr %5, align 8
  %11 = load i8, ptr %6, align 1
  %12 = trunc i8 %11 to i1
  %13 = call ptr @find(ptr noundef %9, i64 noundef %10, i1 noundef zeroext %12, ptr noundef null)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %19

16:                                               ; preds = %3
  %17 = load i64, ptr %5, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i64 noundef %17)
  br label %26

19:                                               ; preds = %3
  %20 = load ptr, ptr %7, align 8
  %21 = load i64, ptr %5, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.record, ptr %22, i32 0, i32 0
  %24 = load i64, ptr %23, align 8
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %20, i64 noundef %21, i64 noundef %24)
  br label %26

26:                                               ; preds = %19, %16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2, ptr noundef %3) #0 !sec !{!"nosec", !"nosec", !{!"nosec", !"nosec", !"nosec", !"nosec"}} {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  %12 = zext i1 %2 to i8
  store i8 %12, ptr %8, align 1
  store ptr %3, ptr %9, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %21

15:                                               ; preds = %4
  %16 = load ptr, ptr %9, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load ptr, ptr %9, align 8
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %18, %15
  store ptr null, ptr %5, align 8
  br label %67

21:                                               ; preds = %4
  store i64 0, ptr %10, align 8
  store ptr null, ptr %11, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = load i64, ptr %7, align 8
  %24 = load i8, ptr %8, align 1
  %25 = trunc i8 %24 to i1
  %26 = call ptr @find_leaf(ptr noundef %22, i64 noundef %23, i1 noundef zeroext %25)
  store ptr %26, ptr %11, align 8
  store i64 0, ptr %10, align 8
  br label %27

27:                                               ; preds = %44, %21
  %28 = load i64, ptr %10, align 8
  %29 = load ptr, ptr %11, align 8
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4
  %31 = load i64, ptr %30, align 8
  %32 = icmp ult i64 %28, %31
  br i1 %32, label %33, label %47

33:                                               ; preds = %27
  %34 = load ptr, ptr %11, align 8
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load i64, ptr %10, align 8
  %38 = getelementptr inbounds i64, ptr %36, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = load i64, ptr %7, align 8
  %41 = icmp eq i64 %39, %40
  br i1 %41, label %42, label %43

42:                                               ; preds = %33
  br label %47

43:                                               ; preds = %33
  br label %44

44:                                               ; preds = %43
  %45 = load i64, ptr %10, align 8
  %46 = add i64 %45, 1
  store i64 %46, ptr %10, align 8
  br label %27, !llvm.loop !15

47:                                               ; preds = %42, %27
  %48 = load ptr, ptr %9, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load ptr, ptr %11, align 8
  %52 = load ptr, ptr %9, align 8
  store ptr %51, ptr %52, align 8
  br label %53

53:                                               ; preds = %50, %47
  %54 = load i64, ptr %10, align 8
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr inbounds %struct.node, ptr %55, i32 0, i32 4
  %57 = load i64, ptr %56, align 8
  %58 = icmp eq i64 %54, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %53
  store ptr null, ptr %5, align 8
  br label %67

60:                                               ; preds = %53
  %61 = load ptr, ptr %11, align 8
  %62 = getelementptr inbounds %struct.node, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load i64, ptr %10, align 8
  %65 = getelementptr inbounds ptr, ptr %63, i64 %64
  %66 = load ptr, ptr %65, align 8
  store ptr %66, ptr %5, align 8
  br label %67

67:                                               ; preds = %60, %59, %20
  %68 = load ptr, ptr %5, align 8
  ret ptr %68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3) #0 !sec !{!"void", !"public", !{!"private", !"private", !"private", !"public"}} {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %15 = zext i1 %3 to i8
  store i8 %15, ptr %8, align 1
  %16 = load i64, ptr %7, align 8
  %17 = load i64, ptr %6, align 8
  %18 = sub i64 %16, %17
  %19 = add i64 %18, 1
  store i64 %19, ptr %10, align 8
  %20 = load i64, ptr %10, align 8
  %21 = call ptr @llvm.stacksave.p0()
  store ptr %21, ptr %11, align 8
  %22 = alloca i64, i64 %20, align 16
  store i64 %20, ptr %12, align 8
  %23 = load i64, ptr %10, align 8
  %24 = alloca ptr, i64 %23, align 16
  store i64 %23, ptr %13, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = load i64, ptr %6, align 8
  %27 = load i64, ptr %7, align 8
  %28 = load i8, ptr %8, align 1
  %29 = trunc i8 %28 to i1
  %30 = call i64 @find_range(ptr noundef %25, i64 noundef %26, i64 noundef %27, i1 noundef zeroext %29, ptr noundef %22, ptr noundef %24)
  store i64 %30, ptr %14, align 8
  %31 = load i64, ptr %14, align 8
  %32 = icmp ne i64 %31, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %57

35:                                               ; preds = %4
  store i64 0, ptr %9, align 8
  br label %36

36:                                               ; preds = %53, %35
  %37 = load i64, ptr %9, align 8
  %38 = load i64, ptr %14, align 8
  %39 = icmp ult i64 %37, %38
  br i1 %39, label %40, label %56

40:                                               ; preds = %36
  %41 = load i64, ptr %9, align 8
  %42 = getelementptr inbounds i64, ptr %22, i64 %41
  %43 = load i64, ptr %42, align 8
  %44 = load i64, ptr %9, align 8
  %45 = getelementptr inbounds ptr, ptr %24, i64 %44
  %46 = load ptr, ptr %45, align 8
  %47 = load i64, ptr %9, align 8
  %48 = getelementptr inbounds ptr, ptr %24, i64 %47
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.record, ptr %49, i32 0, i32 0
  %51 = load i64, ptr %50, align 8
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i64 noundef %43, ptr noundef %46, i64 noundef %51)
  br label %53

53:                                               ; preds = %40
  %54 = load i64, ptr %9, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr %9, align 8
  br label %36, !llvm.loop !16

56:                                               ; preds = %36
  br label %57

57:                                               ; preds = %56, %33
  %58 = load ptr, ptr %11, align 8
  call void @llvm.stackrestore.p0(ptr %58)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"public", !"public", !{}} ptr @llvm.stacksave.p0() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @find_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3, ptr noundef %4, ptr noundef %5) #0 !sec !{!"private", !"private", !{!"private", !"private", !"private", !"private", !"nosec", !"private"}} {
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8, align 1
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  store i64 %1, ptr %9, align 8
  store i64 %2, ptr %10, align 8
  %17 = zext i1 %3 to i8
  store i8 %17, ptr %11, align 1
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store i64 0, ptr %15, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = load i64, ptr %9, align 8
  %20 = load i8, ptr %11, align 1
  %21 = trunc i8 %20 to i1
  %22 = call ptr @find_leaf(ptr noundef %18, i64 noundef %19, i1 noundef zeroext %21)
  store ptr %22, ptr %16, align 8
  %23 = load ptr, ptr %16, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %6
  store i64 0, ptr %7, align 8
  br label %111

26:                                               ; preds = %6
  store i64 0, ptr %14, align 8
  br label %27

27:                                               ; preds = %45, %26
  %28 = load i64, ptr %14, align 8
  %29 = load ptr, ptr %16, align 8
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4
  %31 = load i64, ptr %30, align 8
  %32 = icmp ult i64 %28, %31
  br i1 %32, label %33, label %42

33:                                               ; preds = %27
  %34 = load ptr, ptr %16, align 8
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load i64, ptr %14, align 8
  %38 = getelementptr inbounds i64, ptr %36, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = load i64, ptr %9, align 8
  %41 = icmp ult i64 %39, %40
  br label %42

42:                                               ; preds = %33, %27
  %43 = phi i1 [ false, %27 ], [ %41, %33 ]
  br i1 %43, label %44, label %48

44:                                               ; preds = %42
  br label %45

45:                                               ; preds = %44
  %46 = load i64, ptr %14, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr %14, align 8
  br label %27, !llvm.loop !17

48:                                               ; preds = %42
  %49 = load i64, ptr %14, align 8
  %50 = load ptr, ptr %16, align 8
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 4
  %52 = load i64, ptr %51, align 8
  %53 = icmp eq i64 %49, %52
  br i1 %53, label %54, label %55

54:                                               ; preds = %48
  store i64 0, ptr %7, align 8
  br label %111

55:                                               ; preds = %48
  br label %56

56:                                               ; preds = %101, %55
  %57 = load ptr, ptr %16, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %109

59:                                               ; preds = %56
  br label %60

60:                                               ; preds = %98, %59
  %61 = load i64, ptr %14, align 8
  %62 = load ptr, ptr %16, align 8
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 4
  %64 = load i64, ptr %63, align 8
  %65 = icmp ult i64 %61, %64
  br i1 %65, label %66, label %75

66:                                               ; preds = %60
  %67 = load ptr, ptr %16, align 8
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = load i64, ptr %14, align 8
  %71 = getelementptr inbounds i64, ptr %69, i64 %70
  %72 = load i64, ptr %71, align 8
  %73 = load i64, ptr %10, align 8
  %74 = icmp ule i64 %72, %73
  br label %75

75:                                               ; preds = %66, %60
  %76 = phi i1 [ false, %60 ], [ %74, %66 ]
  br i1 %76, label %77, label %101

77:                                               ; preds = %75
  %78 = load ptr, ptr %16, align 8
  %79 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = load i64, ptr %14, align 8
  %82 = getelementptr inbounds i64, ptr %80, i64 %81
  %83 = load i64, ptr %82, align 8
  %84 = load ptr, ptr %12, align 8
  %85 = load i64, ptr %15, align 8
  %86 = getelementptr inbounds i64, ptr %84, i64 %85
  store i64 %83, ptr %86, align 8
  %87 = load ptr, ptr %16, align 8
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0
  %89 = load ptr, ptr %88, align 8
  %90 = load i64, ptr %14, align 8
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90
  %92 = load ptr, ptr %91, align 8
  %93 = load ptr, ptr %13, align 8
  %94 = load i64, ptr %15, align 8
  %95 = getelementptr inbounds ptr, ptr %93, i64 %94
  store ptr %92, ptr %95, align 8
  %96 = load i64, ptr %15, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr %15, align 8
  br label %98

98:                                               ; preds = %77
  %99 = load i64, ptr %14, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr %14, align 8
  br label %60, !llvm.loop !18

101:                                              ; preds = %75
  %102 = load ptr, ptr %16, align 8
  %103 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 0
  %104 = load ptr, ptr %103, align 8
  %105 = load i64, ptr @order, align 8
  %106 = sub i64 %105, 1
  %107 = getelementptr inbounds ptr, ptr %104, i64 %106
  %108 = load ptr, ptr %107, align 8
  store ptr %108, ptr %16, align 8
  store i64 0, ptr %14, align 8
  br label %56, !llvm.loop !19

109:                                              ; preds = %56
  %110 = load i64, ptr %15, align 8
  store i64 %110, ptr %7, align 8
  br label %111

111:                                              ; preds = %109, %54, %25
  %112 = load i64, ptr %7, align 8
  ret i64 %112
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"void", !"public", !{!"public"}} void @llvm.stackrestore.p0(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find_leaf(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 !sec !{!"nosec", !"nosec", !{!"nosec", !"nosec", !"nosec"}} {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8, align 1
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  %10 = zext i1 %2 to i8
  store i8 %10, ptr %7, align 1
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %20

13:                                               ; preds = %3
  %14 = load i8, ptr %7, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %18

18:                                               ; preds = %16, %13
  %19 = load ptr, ptr %5, align 8
  store ptr %19, ptr %4, align 8
  br label %126

20:                                               ; preds = %3
  store i64 0, ptr %8, align 8
  %21 = load ptr, ptr %5, align 8
  store ptr %21, ptr %9, align 8
  br label %22

22:                                               ; preds = %86, %20
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 3
  %25 = load i8, ptr %24, align 8
  %26 = trunc i8 %25 to i1
  %27 = xor i1 %26, true
  br i1 %27, label %28, label %93

28:                                               ; preds = %22
  %29 = load i8, ptr %7, align 1
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %59

31:                                               ; preds = %28
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  store i64 0, ptr %8, align 8
  br label %33

33:                                               ; preds = %48, %31
  %34 = load i64, ptr %8, align 8
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 4
  %37 = load i64, ptr %36, align 8
  %38 = sub i64 %37, 1
  %39 = icmp ult i64 %34, %38
  br i1 %39, label %40, label %51

40:                                               ; preds = %33
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = load i64, ptr %8, align 8
  %45 = getelementptr inbounds i64, ptr %43, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %46)
  br label %48

48:                                               ; preds = %40
  %49 = load i64, ptr %8, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr %8, align 8
  br label %33, !llvm.loop !20

51:                                               ; preds = %33
  %52 = load ptr, ptr %9, align 8
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  %55 = load i64, ptr %8, align 8
  %56 = getelementptr inbounds i64, ptr %54, i64 %55
  %57 = load i64, ptr %56, align 8
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i64 noundef %57)
  br label %59

59:                                               ; preds = %51, %28
  store i64 0, ptr %8, align 8
  br label %60

60:                                               ; preds = %79, %59
  %61 = load i64, ptr %8, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 4
  %64 = load i64, ptr %63, align 8
  %65 = icmp ult i64 %61, %64
  br i1 %65, label %66, label %80

66:                                               ; preds = %60
  %67 = load i64, ptr %6, align 8
  %68 = load ptr, ptr %9, align 8
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  %71 = load i64, ptr %8, align 8
  %72 = getelementptr inbounds i64, ptr %70, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = icmp uge i64 %67, %73
  br i1 %74, label %75, label %78

75:                                               ; preds = %66
  %76 = load i64, ptr %8, align 8
  %77 = add i64 %76, 1
  store i64 %77, ptr %8, align 8
  br label %79

78:                                               ; preds = %66
  br label %80

79:                                               ; preds = %75
  br label %60, !llvm.loop !21

80:                                               ; preds = %78, %60
  %81 = load i8, ptr %7, align 1
  %82 = trunc i8 %81 to i1
  br i1 %82, label %83, label %86

83:                                               ; preds = %80
  %84 = load i64, ptr %8, align 8
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i64 noundef %84)
  br label %86

86:                                               ; preds = %83, %80
  %87 = load ptr, ptr %9, align 8
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0
  %89 = load ptr, ptr %88, align 8
  %90 = load i64, ptr %8, align 8
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90
  %92 = load ptr, ptr %91, align 8
  store ptr %92, ptr %9, align 8
  br label %22, !llvm.loop !22

93:                                               ; preds = %22
  %94 = load i8, ptr %7, align 1
  %95 = trunc i8 %94 to i1
  br i1 %95, label %96, label %124

96:                                               ; preds = %93
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  store i64 0, ptr %8, align 8
  br label %98

98:                                               ; preds = %113, %96
  %99 = load i64, ptr %8, align 8
  %100 = load ptr, ptr %9, align 8
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4
  %102 = load i64, ptr %101, align 8
  %103 = sub i64 %102, 1
  %104 = icmp ult i64 %99, %103
  br i1 %104, label %105, label %116

105:                                              ; preds = %98
  %106 = load ptr, ptr %9, align 8
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 1
  %108 = load ptr, ptr %107, align 8
  %109 = load i64, ptr %8, align 8
  %110 = getelementptr inbounds i64, ptr %108, i64 %109
  %111 = load i64, ptr %110, align 8
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %111)
  br label %113

113:                                              ; preds = %105
  %114 = load i64, ptr %8, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr %8, align 8
  br label %98, !llvm.loop !23

116:                                              ; preds = %98
  %117 = load ptr, ptr %9, align 8
  %118 = getelementptr inbounds %struct.node, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = load i64, ptr %8, align 8
  %121 = getelementptr inbounds i64, ptr %119, i64 %120
  %122 = load i64, ptr %121, align 8
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i64 noundef %122)
  br label %124

124:                                              ; preds = %116, %93
  %125 = load ptr, ptr %9, align 8
  store ptr %125, ptr %4, align 8
  br label %126

126:                                              ; preds = %124, %18
  %127 = load ptr, ptr %4, align 8
  ret ptr %127
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @cut(i64 noundef %0) #0 !sec !{!"public", !"public", !{!"public"}} {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  %4 = load i64, ptr %3, align 8
  %5 = urem i64 %4, 2
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i64, ptr %3, align 8
  %9 = udiv i64 %8, 2
  store i64 %9, ptr %2, align 8
  br label %14

10:                                               ; preds = %1
  %11 = load i64, ptr %3, align 8
  %12 = udiv i64 %11, 2
  %13 = add i64 %12, 1
  store i64 %13, ptr %2, align 8
  br label %14

14:                                               ; preds = %10, %7
  %15 = load i64, ptr %2, align 8
  ret i64 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_node() #0 !sec !{!"public", !"public", !{}} {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = load ptr, ptr @free_nodes, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %30, label %6

6:                                                ; preds = %0
  %7 = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152)
  store ptr %7, ptr %1, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load ptr, ptr @stderr, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.26)
  call void @exit(i32 noundef 1) #7
  unreachable

13:                                               ; preds = %6
  store i64 0, ptr %2, align 8
  br label %14

14:                                               ; preds = %26, %13
  %15 = load i64, ptr %2, align 8
  %16 = icmp ult i64 %15, 18724
  br i1 %16, label %17, label %29

17:                                               ; preds = %14
  %18 = load ptr, ptr @free_nodes, align 8
  %19 = load ptr, ptr %1, align 8
  %20 = load i64, ptr %2, align 8
  %21 = getelementptr inbounds %struct.node, ptr %19, i64 %20
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 6
  store ptr %18, ptr %22, align 8
  %23 = load ptr, ptr %1, align 8
  %24 = load i64, ptr %2, align 8
  %25 = getelementptr inbounds %struct.node, ptr %23, i64 %24
  store ptr %25, ptr @free_nodes, align 8
  br label %26

26:                                               ; preds = %17
  %27 = load i64, ptr %2, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr %2, align 8
  br label %14, !llvm.loop !24

29:                                               ; preds = %14
  br label %30

30:                                               ; preds = %29, %0
  %31 = load ptr, ptr @free_nodes, align 8
  store ptr %31, ptr %3, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 6
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr @free_nodes, align 8
  %35 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %35, i8 0, i64 8, i1 false)
  %36 = load ptr, ptr %3, align 8
  ret ptr %36
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate(i64 noundef %0, i64 noundef %1) #0 !sec !{!"void", !"public", !{!"public", !"public"}} {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load i64, ptr %4, align 8
  %7 = load i64, ptr %3, align 8
  %8 = call i32 @posix_memalign(ptr noundef %5, i64 noundef %6, i64 noundef %7) #8
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  call void @exit(i32 noundef 1) #7
  unreachable

12:                                               ; preds = %2
  %13 = load i64, ptr %3, align 8
  %14 = load i64, ptr @allocator_stat, align 8
  %15 = add i64 %14, %13
  store i64 %15, ptr @allocator_stat, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %16, i8 0, i64 %17, i1 false)
  %18 = load ptr, ptr %5, align 8
  ret ptr %18
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
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @free_nodes, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 6
  store ptr %3, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  store ptr %6, ptr @free_nodes, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_record() #0 !sec !{!"private", !"public", !{}} {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = load ptr, ptr @free_recs, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %30, label %6

6:                                                ; preds = %0
  %7 = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152)
  store ptr %7, ptr %1, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load ptr, ptr @stderr, align 8
  %12 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.26)
  call void @exit(i32 noundef 1) #7
  unreachable

13:                                               ; preds = %6
  store i64 0, ptr %2, align 8
  br label %14

14:                                               ; preds = %26, %13
  %15 = load i64, ptr %2, align 8
  %16 = icmp ult i64 %15, 32768
  br i1 %16, label %17, label %29

17:                                               ; preds = %14
  %18 = load ptr, ptr @free_recs, align 8
  %19 = load ptr, ptr %1, align 8
  %20 = load i64, ptr %2, align 8
  %21 = getelementptr inbounds %struct.record, ptr %19, i64 %20
  %22 = getelementptr inbounds %struct.record, ptr %21, i32 0, i32 1
  store ptr %18, ptr %22, align 8
  %23 = load ptr, ptr %1, align 8
  %24 = load i64, ptr %2, align 8
  %25 = getelementptr inbounds %struct.record, ptr %23, i64 %24
  store ptr %25, ptr @free_recs, align 8
  br label %26

26:                                               ; preds = %17
  %27 = load i64, ptr %2, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr %2, align 8
  br label %14, !llvm.loop !25

29:                                               ; preds = %14
  br label %30

30:                                               ; preds = %29, %0
  %31 = load ptr, ptr @free_recs, align 8
  store ptr %31, ptr %3, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.record, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr @free_recs, align 8
  %35 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %35, i8 0, i64 32, i1 false)
  %36 = load ptr, ptr %3, align 8
  ret ptr %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_record(ptr noundef %0) #0 !sec !{!"void", !"private", !{!"private"}} {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @free_recs, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 1
  store ptr %3, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  store ptr %6, ptr @free_recs, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_record(i64 noundef %0) #0 !sec !{!"private", !"private", !{!"private"}} {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %4 = call ptr (i64, ...) @alloc_record(i64 noundef 32)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @perror(ptr noundef @.str.27) #9
  call void @exit(i32 noundef 1) #7
  unreachable

8:                                                ; preds = %1
  %9 = load i64, ptr %2, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.record, ptr %10, i32 0, i32 0
  store i64 %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8
  ret ptr %13
}