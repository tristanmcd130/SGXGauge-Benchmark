source_filename = "btree1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { ptr, ptr, ptr, i8, i64, i64, ptr }
%struct.record = type { i64, ptr, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.element = type { i64, i64, i64, [40 x i8] }

@allocator_stat = dso_local global i64 0, align 8
@order = dso_local global i64 6, align 8
@queue = dso_local global ptr null, align 8
@verbose_output = dso_local global i8 0, align 1
@.str = private unnamed_addr constant [77 x i8] c"bpt version %s -- Copyright (c) 2018  Amittai Aviram http://www.amittai.com\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"1.16.1\00", align 1
@.str.2 = private unnamed_addr constant [193 x i8] c"This program comes with ABSOLUTELY NO WARRANTY.\0AThis is free software, and you are welcome to redistribute it\0Aunder certain conditions.\0APlease see the headnote in the source code for details.\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"B+ Tree of Order %ld.\0A\00", align 1
@.str.4 = private unnamed_addr constant [182 x i8] c"Following Silberschatz, Korth, Sidarshan, Database Concepts, 5th ed.\0A\0ATo build a B+ tree of a different order, start again and enter the order\0Aas an integer argument:  bpt <order>  \00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"(%d <= order <= %d).\0A\00", align 1
@.str.6 = private unnamed_addr constant [149 x i8] c"To start with input from a file of newline-delimited integers, \0Astart again and enter the order followed by the filename:\0Abpt <order> <inputfile> .\0A\00", align 1
@.str.7 = private unnamed_addr constant [776 x i8] c"Enter any of the following commands after the prompt > :\0A\09i <k>  -- Insert <k> (an integer) as both key and value).\0A\09i <k> <v> -- Insert the value <v> (an integer) as the value of key <k> (an integer).\0A\09f <k>  -- Find the value under key <k>.\0A\09p <k> -- Pruint64_t the path from the root to key k and its associated value.\0A\09r <k1> <k2> -- Pruint64_t the keys and values found in the range [<k1>, <k2>\0A\09d <k>  -- Delete key <k> and its associated value.\0A\09x -- Destroy the whole tree.  Start again with an empty tree of the same order.\0A\09t -- Pruint64_t the B+ tree.\0A\09l -- Pruint64_t the keys of the leaves (bottom row of the tree).\0A\09v -- Toggle output of pointer addresses (\22verbose\22) in tree and leaves.\0A\09q -- Quit. (Or use Ctl-D or Ctl-C.)\0A\09? -- Pruint64_t this help message.\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Usage: ./bpt [<order>]\0A\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"\09where %d <= order <= %d .\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"Empty tree.\0A\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"%p \00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"(%p)\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"| \00", align 1
@.str.17 = private unnamed_addr constant [33 x i8] c"Record not found under key %ld.\0A\00", align 1
@.str.18 = private unnamed_addr constant [37 x i8] c"Record at %p -- key %ld, value %ld.\0A\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"None found.\0A\00", align 1
@.str.20 = private unnamed_addr constant [37 x i8] c"Key: %ld   Location: %p  Value: %ld\0A\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"%ld] \00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"%ld ->\0A\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"Leaf [\00", align 1
@.str.25 = private unnamed_addr constant [9 x i8] c"%ld] ->\0A\00", align 1
@free_nodes = dso_local global ptr null, align 8
@stderr = external global ptr, align 8
@.str.26 = private unnamed_addr constant [30 x i8] c"Failed to allocate memory...\0A\00", align 1
@free_recs = dso_local global ptr null, align 8
@.str.27 = private unnamed_addr constant [17 x i8] c"Record creation.\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"Node creation.\00", align 1
@.str.29 = private unnamed_addr constant [21 x i8] c"New node keys array.\00", align 1
@.str.30 = private unnamed_addr constant [25 x i8] c"New node pointers array.\00", align 1
@.str.31 = private unnamed_addr constant [22 x i8] c"Temporary keys array.\00", align 1
@.str.32 = private unnamed_addr constant [26 x i8] c"Temporary pointers array.\00", align 1
@.str.33 = private unnamed_addr constant [46 x i8] c"Temporary pointers array for splitting nodes.\00", align 1
@.str.34 = private unnamed_addr constant [42 x i8] c"Temporary keys array for splitting nodes.\00", align 1
@.str.35 = private unnamed_addr constant [51 x i8] c"Search for nonexistent pointer to node in parent.\0A\00", align 1
@.str.36 = private unnamed_addr constant [13 x i8] c"Node:  %#lx\0A\00", align 1
@x = internal global [3 x i64] [i64 13070, i64 43981, i64 4660], align 16
@a = internal global [3 x i64] [i64 58989, i64 57068, i64 5], align 16
@c = internal global i64 11, align 8
@.str.37 = private unnamed_addr constant [28 x i8] c"Failed to allocate memory.\0A\00", align 1
@.str.38 = private unnamed_addr constant [15 x i8] c"Allocated %ld\0A\00", align 1
@.str.39 = private unnamed_addr constant [21 x i8] c"BTree Elements: %zu\0A\00", align 1
@.str.40 = private unnamed_addr constant [19 x i8] c"Btree Fanout: %zu\0A\00", align 1
@.str.41 = private unnamed_addr constant [19 x i8] c"Allocator: %zu MB\0A\00", align 1
@.str.42 = private unnamed_addr constant [32 x i8] c"got %zu matches in %zu seconds\0A\00", align 1
@.str.43 = private unnamed_addr constant [17 x i8] c"Experiment DONE\0A\00", align 1
@.str.44 = private unnamed_addr constant [8 x i8] c"ENOMEM\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @license_notice() #0 !sec !{!"void", !"public", !{}} {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef @.str.1)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_1() #0 {
  %1 = load i64, ptr @order, align 8
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 3, i32 noundef 20)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_2() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_3() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 3, i32 noundef 20)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enqueue(ptr noundef %0) #0 {
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
define dso_local ptr @dequeue() #0 {
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
define dso_local void @print_leaves(ptr noundef %0) #0 {
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @height(ptr noundef %0) #0 {
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @path_to_root(ptr noundef %0, ptr noundef %1) #0 {
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
define dso_local void @print_tree(ptr noundef %0) #0 {
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
define dso_local void @find_and_print(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 {
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
define dso_local ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2, ptr noundef %3) #0 {
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
define dso_local void @find_and_print_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3) #0 {
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
declare ptr @llvm.stacksave.p0() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @find_range(ptr noundef %0, i64 noundef %1, i64 noundef %2, i1 noundef zeroext %3, ptr noundef %4, ptr noundef %5) #0 {
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
declare void @llvm.stackrestore.p0(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find_leaf(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %2) #0 {
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
define dso_local i64 @cut(i64 noundef %0) #0 {
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
define dso_local ptr @alloc_node() #0 {
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
define internal ptr @allocate(i64 noundef %0, i64 noundef %1) #0 {
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

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_node(ptr noundef %0) #0 {
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
define dso_local ptr @alloc_record() #0 {
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
define dso_local void @free_record(ptr noundef %0) #0 {
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
define dso_local ptr @make_record(i64 noundef %0) #0 {
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

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_node() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr (i64, ...) @alloc_node(i64 noundef 56)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  call void @perror(ptr noundef @.str.28) #9
  call void @exit(i32 noundef 1) #7
  unreachable

6:                                                ; preds = %0
  %7 = load i64, ptr @order, align 8
  %8 = sub i64 %7, 1
  %9 = mul i64 %8, 8
  %10 = call ptr @allocate_align64(i64 noundef %9)
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %6
  call void @perror(ptr noundef @.str.29) #9
  call void @exit(i32 noundef 1) #7
  unreachable

18:                                               ; preds = %6
  %19 = load i64, ptr @order, align 8
  %20 = mul i64 %19, 8
  %21 = call ptr @allocate_align64(i64 noundef %20)
  %22 = load ptr, ptr %1, align 8
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 0
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %1, align 8
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %18
  call void @perror(ptr noundef @.str.30) #9
  call void @exit(i32 noundef 1) #7
  unreachable

29:                                               ; preds = %18
  %30 = load ptr, ptr %1, align 8
  %31 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 3
  store i8 0, ptr %31, align 8
  %32 = load ptr, ptr %1, align 8
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 4
  store i64 0, ptr %33, align 8
  %34 = load ptr, ptr %1, align 8
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 2
  store ptr null, ptr %35, align 8
  %36 = load ptr, ptr %1, align 8
  %37 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 6
  store ptr null, ptr %37, align 8
  %38 = load ptr, ptr %1, align 8
  ret ptr %38
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate_align64(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %4 = load i64, ptr %2, align 8
  %5 = call i32 @posix_memalign(ptr noundef %3, i64 noundef 64, i64 noundef %4) #8
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  call void @exit(i32 noundef 1) #7
  unreachable

9:                                                ; preds = %1
  %10 = load i64, ptr %2, align 8
  %11 = load i64, ptr @allocator_stat, align 8
  %12 = add i64 %11, %10
  store i64 %12, ptr @allocator_stat, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = load i64, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %13, i8 0, i64 %14, i1 false)
  %15 = load ptr, ptr %3, align 8
  ret ptr %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_leaf() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @make_node()
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 3
  store i8 1, ptr %4, align 8
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_left_index(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  br label %6

6:                                                ; preds = %23, %2
  %7 = load i64, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4
  %10 = load i64, ptr %9, align 8
  %11 = icmp ule i64 %7, %10
  br i1 %11, label %12, label %21

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = load i64, ptr %5, align 8
  %17 = getelementptr inbounds ptr, ptr %15, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = icmp ne ptr %18, %19
  br label %21

21:                                               ; preds = %12, %6
  %22 = phi i1 [ false, %6 ], [ %20, %12 ]
  br i1 %22, label %23, label %26

23:                                               ; preds = %21
  %24 = load i64, ptr %5, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr %5, align 8
  br label %6, !llvm.loop !26

26:                                               ; preds = %21
  %27 = load i64, ptr %5, align 8
  ret i64 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 0, ptr %8, align 8
  br label %9

9:                                                ; preds = %26, %3
  %10 = load i64, ptr %8, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 4
  %13 = load i64, ptr %12, align 8
  %14 = icmp ult i64 %10, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %9
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load i64, ptr %8, align 8
  %20 = getelementptr inbounds i64, ptr %18, i64 %19
  %21 = load i64, ptr %20, align 8
  %22 = load i64, ptr %5, align 8
  %23 = icmp ult i64 %21, %22
  br label %24

24:                                               ; preds = %15, %9
  %25 = phi i1 [ false, %9 ], [ %23, %15 ]
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  %27 = load i64, ptr %8, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr %8, align 8
  br label %9, !llvm.loop !27

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 4
  %32 = load i64, ptr %31, align 8
  store i64 %32, ptr %7, align 8
  br label %33

33:                                               ; preds = %62, %29
  %34 = load i64, ptr %7, align 8
  %35 = load i64, ptr %8, align 8
  %36 = icmp ugt i64 %34, %35
  br i1 %36, label %37, label %65

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = load i64, ptr %7, align 8
  %42 = sub i64 %41, 1
  %43 = getelementptr inbounds i64, ptr %40, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = load i64, ptr %7, align 8
  %49 = getelementptr inbounds i64, ptr %47, i64 %48
  store i64 %44, ptr %49, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = load i64, ptr %7, align 8
  %54 = sub i64 %53, 1
  %55 = getelementptr inbounds ptr, ptr %52, i64 %54
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = load i64, ptr %7, align 8
  %61 = getelementptr inbounds ptr, ptr %59, i64 %60
  store ptr %56, ptr %61, align 8
  br label %62

62:                                               ; preds = %37
  %63 = load i64, ptr %7, align 8
  %64 = add i64 %63, -1
  store i64 %64, ptr %7, align 8
  br label %33, !llvm.loop !28

65:                                               ; preds = %33
  %66 = load i64, ptr %5, align 8
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = load i64, ptr %8, align 8
  %71 = getelementptr inbounds i64, ptr %69, i64 %70
  store i64 %66, ptr %71, align 8
  %72 = load ptr, ptr %6, align 8
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 0
  %75 = load ptr, ptr %74, align 8
  %76 = load i64, ptr %8, align 8
  %77 = getelementptr inbounds ptr, ptr %75, i64 %76
  store ptr %72, ptr %77, align 8
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 4
  %80 = load i64, ptr %79, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr %79, align 8
  %82 = load ptr, ptr %4, align 8
  ret ptr %82
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf_after_splitting(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %17 = call ptr @make_leaf()
  store ptr %17, ptr %9, align 8
  %18 = load i64, ptr @order, align 8
  %19 = add i64 %18, 1
  %20 = mul i64 %19, 8
  %21 = call ptr @allocate_align64(i64 noundef %20)
  store ptr %21, ptr %10, align 8
  %22 = load ptr, ptr %10, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %4
  call void @perror(ptr noundef @.str.31) #9
  call void @exit(i32 noundef 1) #7
  unreachable

25:                                               ; preds = %4
  %26 = load i64, ptr @order, align 8
  %27 = add i64 %26, 1
  %28 = mul i64 %27, 8
  %29 = call ptr @allocate_align64(i64 noundef %28)
  store ptr %29, ptr %11, align 8
  %30 = load ptr, ptr %11, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %33

32:                                               ; preds = %25
  call void @perror(ptr noundef @.str.32) #9
  call void @exit(i32 noundef 1) #7
  unreachable

33:                                               ; preds = %25
  store i64 0, ptr %12, align 8
  br label %34

34:                                               ; preds = %50, %33
  %35 = load i64, ptr %12, align 8
  %36 = load i64, ptr @order, align 8
  %37 = sub i64 %36, 1
  %38 = icmp ult i64 %35, %37
  br i1 %38, label %39, label %48

39:                                               ; preds = %34
  %40 = load ptr, ptr %6, align 8
  %41 = getelementptr inbounds %struct.node, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = load i64, ptr %12, align 8
  %44 = getelementptr inbounds i64, ptr %42, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = load i64, ptr %7, align 8
  %47 = icmp ult i64 %45, %46
  br label %48

48:                                               ; preds = %39, %34
  %49 = phi i1 [ false, %34 ], [ %47, %39 ]
  br i1 %49, label %50, label %53

50:                                               ; preds = %48
  %51 = load i64, ptr %12, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr %12, align 8
  br label %34, !llvm.loop !29

53:                                               ; preds = %48
  store i64 0, ptr %15, align 8
  store i64 0, ptr %16, align 8
  br label %54

54:                                               ; preds = %86, %53
  %55 = load i64, ptr %15, align 8
  %56 = load ptr, ptr %6, align 8
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 4
  %58 = load i64, ptr %57, align 8
  %59 = icmp ult i64 %55, %58
  br i1 %59, label %60, label %91

60:                                               ; preds = %54
  %61 = load i64, ptr %16, align 8
  %62 = load i64, ptr %12, align 8
  %63 = icmp eq i64 %61, %62
  br i1 %63, label %64, label %67

64:                                               ; preds = %60
  %65 = load i64, ptr %16, align 8
  %66 = add i64 %65, 1
  store i64 %66, ptr %16, align 8
  br label %67

67:                                               ; preds = %64, %60
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  %71 = load i64, ptr %15, align 8
  %72 = getelementptr inbounds i64, ptr %70, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = load ptr, ptr %10, align 8
  %75 = load i64, ptr %16, align 8
  %76 = getelementptr inbounds i64, ptr %74, i64 %75
  store i64 %73, ptr %76, align 8
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 0
  %79 = load ptr, ptr %78, align 8
  %80 = load i64, ptr %15, align 8
  %81 = getelementptr inbounds ptr, ptr %79, i64 %80
  %82 = load ptr, ptr %81, align 8
  %83 = load ptr, ptr %11, align 8
  %84 = load i64, ptr %16, align 8
  %85 = getelementptr inbounds ptr, ptr %83, i64 %84
  store ptr %82, ptr %85, align 8
  br label %86

86:                                               ; preds = %67
  %87 = load i64, ptr %15, align 8
  %88 = add i64 %87, 1
  store i64 %88, ptr %15, align 8
  %89 = load i64, ptr %16, align 8
  %90 = add i64 %89, 1
  store i64 %90, ptr %16, align 8
  br label %54, !llvm.loop !30

91:                                               ; preds = %54
  %92 = load i64, ptr %7, align 8
  %93 = load ptr, ptr %10, align 8
  %94 = load i64, ptr %12, align 8
  %95 = getelementptr inbounds i64, ptr %93, i64 %94
  store i64 %92, ptr %95, align 8
  %96 = load ptr, ptr %8, align 8
  %97 = load ptr, ptr %11, align 8
  %98 = load i64, ptr %12, align 8
  %99 = getelementptr inbounds ptr, ptr %97, i64 %98
  store ptr %96, ptr %99, align 8
  %100 = load ptr, ptr %6, align 8
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4
  store i64 0, ptr %101, align 8
  %102 = load i64, ptr @order, align 8
  %103 = sub i64 %102, 1
  %104 = call i64 @cut(i64 noundef %103)
  store i64 %104, ptr %13, align 8
  store i64 0, ptr %15, align 8
  br label %105

105:                                              ; preds = %132, %91
  %106 = load i64, ptr %15, align 8
  %107 = load i64, ptr %13, align 8
  %108 = icmp ult i64 %106, %107
  br i1 %108, label %109, label %135

109:                                              ; preds = %105
  %110 = load ptr, ptr %11, align 8
  %111 = load i64, ptr %15, align 8
  %112 = getelementptr inbounds ptr, ptr %110, i64 %111
  %113 = load ptr, ptr %112, align 8
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.node, ptr %114, i32 0, i32 0
  %116 = load ptr, ptr %115, align 8
  %117 = load i64, ptr %15, align 8
  %118 = getelementptr inbounds ptr, ptr %116, i64 %117
  store ptr %113, ptr %118, align 8
  %119 = load ptr, ptr %10, align 8
  %120 = load i64, ptr %15, align 8
  %121 = getelementptr inbounds i64, ptr %119, i64 %120
  %122 = load i64, ptr %121, align 8
  %123 = load ptr, ptr %6, align 8
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  %126 = load i64, ptr %15, align 8
  %127 = getelementptr inbounds i64, ptr %125, i64 %126
  store i64 %122, ptr %127, align 8
  %128 = load ptr, ptr %6, align 8
  %129 = getelementptr inbounds %struct.node, ptr %128, i32 0, i32 4
  %130 = load i64, ptr %129, align 8
  %131 = add i64 %130, 1
  store i64 %131, ptr %129, align 8
  br label %132

132:                                              ; preds = %109
  %133 = load i64, ptr %15, align 8
  %134 = add i64 %133, 1
  store i64 %134, ptr %15, align 8
  br label %105, !llvm.loop !31

135:                                              ; preds = %105
  %136 = load i64, ptr %13, align 8
  store i64 %136, ptr %15, align 8
  store i64 0, ptr %16, align 8
  br label %137

137:                                              ; preds = %164, %135
  %138 = load i64, ptr %15, align 8
  %139 = load i64, ptr @order, align 8
  %140 = icmp ult i64 %138, %139
  br i1 %140, label %141, label %169

141:                                              ; preds = %137
  %142 = load ptr, ptr %11, align 8
  %143 = load i64, ptr %15, align 8
  %144 = getelementptr inbounds ptr, ptr %142, i64 %143
  %145 = load ptr, ptr %144, align 8
  %146 = load ptr, ptr %9, align 8
  %147 = getelementptr inbounds %struct.node, ptr %146, i32 0, i32 0
  %148 = load ptr, ptr %147, align 8
  %149 = load i64, ptr %16, align 8
  %150 = getelementptr inbounds ptr, ptr %148, i64 %149
  store ptr %145, ptr %150, align 8
  %151 = load ptr, ptr %10, align 8
  %152 = load i64, ptr %15, align 8
  %153 = getelementptr inbounds i64, ptr %151, i64 %152
  %154 = load i64, ptr %153, align 8
  %155 = load ptr, ptr %9, align 8
  %156 = getelementptr inbounds %struct.node, ptr %155, i32 0, i32 1
  %157 = load ptr, ptr %156, align 8
  %158 = load i64, ptr %16, align 8
  %159 = getelementptr inbounds i64, ptr %157, i64 %158
  store i64 %154, ptr %159, align 8
  %160 = load ptr, ptr %9, align 8
  %161 = getelementptr inbounds %struct.node, ptr %160, i32 0, i32 4
  %162 = load i64, ptr %161, align 8
  %163 = add i64 %162, 1
  store i64 %163, ptr %161, align 8
  br label %164

164:                                              ; preds = %141
  %165 = load i64, ptr %15, align 8
  %166 = add i64 %165, 1
  store i64 %166, ptr %15, align 8
  %167 = load i64, ptr %16, align 8
  %168 = add i64 %167, 1
  store i64 %168, ptr %16, align 8
  br label %137, !llvm.loop !32

169:                                              ; preds = %137
  %170 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %170) #8
  %171 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %171) #8
  %172 = load ptr, ptr %6, align 8
  %173 = getelementptr inbounds %struct.node, ptr %172, i32 0, i32 0
  %174 = load ptr, ptr %173, align 8
  %175 = load i64, ptr @order, align 8
  %176 = sub i64 %175, 1
  %177 = getelementptr inbounds ptr, ptr %174, i64 %176
  %178 = load ptr, ptr %177, align 8
  %179 = load ptr, ptr %9, align 8
  %180 = getelementptr inbounds %struct.node, ptr %179, i32 0, i32 0
  %181 = load ptr, ptr %180, align 8
  %182 = load i64, ptr @order, align 8
  %183 = sub i64 %182, 1
  %184 = getelementptr inbounds ptr, ptr %181, i64 %183
  store ptr %178, ptr %184, align 8
  %185 = load ptr, ptr %9, align 8
  %186 = load ptr, ptr %6, align 8
  %187 = getelementptr inbounds %struct.node, ptr %186, i32 0, i32 0
  %188 = load ptr, ptr %187, align 8
  %189 = load i64, ptr @order, align 8
  %190 = sub i64 %189, 1
  %191 = getelementptr inbounds ptr, ptr %188, i64 %190
  store ptr %185, ptr %191, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.node, ptr %192, i32 0, i32 4
  %194 = load i64, ptr %193, align 8
  store i64 %194, ptr %15, align 8
  br label %195

195:                                              ; preds = %206, %169
  %196 = load i64, ptr %15, align 8
  %197 = load i64, ptr @order, align 8
  %198 = sub i64 %197, 1
  %199 = icmp ult i64 %196, %198
  br i1 %199, label %200, label %209

200:                                              ; preds = %195
  %201 = load ptr, ptr %6, align 8
  %202 = getelementptr inbounds %struct.node, ptr %201, i32 0, i32 0
  %203 = load ptr, ptr %202, align 8
  %204 = load i64, ptr %15, align 8
  %205 = getelementptr inbounds ptr, ptr %203, i64 %204
  store ptr null, ptr %205, align 8
  br label %206

206:                                              ; preds = %200
  %207 = load i64, ptr %15, align 8
  %208 = add i64 %207, 1
  store i64 %208, ptr %15, align 8
  br label %195, !llvm.loop !33

209:                                              ; preds = %195
  %210 = load ptr, ptr %9, align 8
  %211 = getelementptr inbounds %struct.node, ptr %210, i32 0, i32 4
  %212 = load i64, ptr %211, align 8
  store i64 %212, ptr %15, align 8
  br label %213

213:                                              ; preds = %224, %209
  %214 = load i64, ptr %15, align 8
  %215 = load i64, ptr @order, align 8
  %216 = sub i64 %215, 1
  %217 = icmp ult i64 %214, %216
  br i1 %217, label %218, label %227

218:                                              ; preds = %213
  %219 = load ptr, ptr %9, align 8
  %220 = getelementptr inbounds %struct.node, ptr %219, i32 0, i32 0
  %221 = load ptr, ptr %220, align 8
  %222 = load i64, ptr %15, align 8
  %223 = getelementptr inbounds ptr, ptr %221, i64 %222
  store ptr null, ptr %223, align 8
  br label %224

224:                                              ; preds = %218
  %225 = load i64, ptr %15, align 8
  %226 = add i64 %225, 1
  store i64 %226, ptr %15, align 8
  br label %213, !llvm.loop !34

227:                                              ; preds = %213
  %228 = load ptr, ptr %6, align 8
  %229 = getelementptr inbounds %struct.node, ptr %228, i32 0, i32 2
  %230 = load ptr, ptr %229, align 8
  %231 = load ptr, ptr %9, align 8
  %232 = getelementptr inbounds %struct.node, ptr %231, i32 0, i32 2
  store ptr %230, ptr %232, align 8
  %233 = load ptr, ptr %9, align 8
  %234 = getelementptr inbounds %struct.node, ptr %233, i32 0, i32 1
  %235 = load ptr, ptr %234, align 8
  %236 = getelementptr inbounds i64, ptr %235, i64 0
  %237 = load i64, ptr %236, align 8
  store i64 %237, ptr %14, align 8
  %238 = load ptr, ptr %5, align 8
  %239 = load ptr, ptr %6, align 8
  %240 = load i64, ptr %14, align 8
  %241 = load ptr, ptr %9, align 8
  %242 = call ptr @insert_into_parent(ptr noundef %238, ptr noundef %239, i64 noundef %240, ptr noundef %241)
  ret ptr %242
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_parent(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %11, align 8
  %15 = load ptr, ptr %11, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %4
  %18 = load ptr, ptr %7, align 8
  %19 = load i64, ptr %8, align 8
  %20 = load ptr, ptr %9, align 8
  %21 = call ptr @insert_into_new_root(ptr noundef %18, i64 noundef %19, ptr noundef %20)
  store ptr %21, ptr %5, align 8
  br label %46

22:                                               ; preds = %4
  %23 = load ptr, ptr %11, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = call i64 @get_left_index(ptr noundef %23, ptr noundef %24)
  store i64 %25, ptr %10, align 8
  %26 = load ptr, ptr %11, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4
  %28 = load i64, ptr %27, align 8
  %29 = load i64, ptr @order, align 8
  %30 = sub i64 %29, 1
  %31 = icmp ult i64 %28, %30
  br i1 %31, label %32, label %39

32:                                               ; preds = %22
  %33 = load ptr, ptr %6, align 8
  %34 = load ptr, ptr %11, align 8
  %35 = load i64, ptr %10, align 8
  %36 = load i64, ptr %8, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = call ptr @insert_into_node(ptr noundef %33, ptr noundef %34, i64 noundef %35, i64 noundef %36, ptr noundef %37)
  store ptr %38, ptr %5, align 8
  br label %46

39:                                               ; preds = %22
  %40 = load ptr, ptr %6, align 8
  %41 = load ptr, ptr %11, align 8
  %42 = load i64, ptr %10, align 8
  %43 = load i64, ptr %8, align 8
  %44 = load ptr, ptr %9, align 8
  %45 = call ptr @insert_into_node_after_splitting(ptr noundef %40, ptr noundef %41, i64 noundef %42, i64 noundef %43, ptr noundef %44)
  store ptr %45, ptr %5, align 8
  br label %46

46:                                               ; preds = %39, %32, %17
  %47 = load ptr, ptr %5, align 8
  ret ptr %47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 4
  %14 = load i64, ptr %13, align 8
  store i64 %14, ptr %11, align 8
  br label %15

15:                                               ; preds = %44, %5
  %16 = load i64, ptr %11, align 8
  %17 = load i64, ptr %8, align 8
  %18 = icmp ugt i64 %16, %17
  br i1 %18, label %19, label %47

19:                                               ; preds = %15
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %11, align 8
  %24 = getelementptr inbounds ptr, ptr %22, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load i64, ptr %11, align 8
  %30 = add i64 %29, 1
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30
  store ptr %25, ptr %31, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load i64, ptr %11, align 8
  %36 = sub i64 %35, 1
  %37 = getelementptr inbounds i64, ptr %34, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = load i64, ptr %11, align 8
  %43 = getelementptr inbounds i64, ptr %41, i64 %42
  store i64 %38, ptr %43, align 8
  br label %44

44:                                               ; preds = %19
  %45 = load i64, ptr %11, align 8
  %46 = add i64 %45, -1
  store i64 %46, ptr %11, align 8
  br label %15, !llvm.loop !35

47:                                               ; preds = %15
  %48 = load ptr, ptr %10, align 8
  %49 = load ptr, ptr %7, align 8
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  %52 = load i64, ptr %8, align 8
  %53 = add i64 %52, 1
  %54 = getelementptr inbounds ptr, ptr %51, i64 %53
  store ptr %48, ptr %54, align 8
  %55 = load i64, ptr %9, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = load i64, ptr %8, align 8
  %60 = getelementptr inbounds i64, ptr %58, i64 %59
  store i64 %55, ptr %60, align 8
  %61 = load ptr, ptr %7, align 8
  %62 = getelementptr inbounds %struct.node, ptr %61, i32 0, i32 4
  %63 = load i64, ptr %62, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr %62, align 8
  %65 = load ptr, ptr %6, align 8
  ret ptr %65
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node_after_splitting(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %19 = load i64, ptr @order, align 8
  %20 = add i64 %19, 1
  %21 = mul i64 %20, 8
  %22 = call ptr @allocate_align64(i64 noundef %21)
  store ptr %22, ptr %18, align 8
  %23 = load ptr, ptr %18, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %5
  call void @perror(ptr noundef @.str.33) #9
  call void @exit(i32 noundef 1) #7
  unreachable

26:                                               ; preds = %5
  %27 = load i64, ptr @order, align 8
  %28 = mul i64 %27, 8
  %29 = call ptr @allocate_align64(i64 noundef %28)
  store ptr %29, ptr %17, align 8
  %30 = load ptr, ptr %17, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %33

32:                                               ; preds = %26
  call void @perror(ptr noundef @.str.34) #9
  call void @exit(i32 noundef 1) #7
  unreachable

33:                                               ; preds = %26
  store i64 0, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %34

34:                                               ; preds = %59, %33
  %35 = load i64, ptr %11, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 4
  %38 = load i64, ptr %37, align 8
  %39 = add i64 %38, 1
  %40 = icmp ult i64 %35, %39
  br i1 %40, label %41, label %64

41:                                               ; preds = %34
  %42 = load i64, ptr %12, align 8
  %43 = load i64, ptr %8, align 8
  %44 = add i64 %43, 1
  %45 = icmp eq i64 %42, %44
  br i1 %45, label %46, label %49

46:                                               ; preds = %41
  %47 = load i64, ptr %12, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %12, align 8
  br label %49

49:                                               ; preds = %46, %41
  %50 = load ptr, ptr %7, align 8
  %51 = getelementptr inbounds %struct.node, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = load i64, ptr %11, align 8
  %54 = getelementptr inbounds ptr, ptr %52, i64 %53
  %55 = load ptr, ptr %54, align 8
  %56 = load ptr, ptr %18, align 8
  %57 = load i64, ptr %12, align 8
  %58 = getelementptr inbounds ptr, ptr %56, i64 %57
  store ptr %55, ptr %58, align 8
  br label %59

59:                                               ; preds = %49
  %60 = load i64, ptr %11, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr %11, align 8
  %62 = load i64, ptr %12, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr %12, align 8
  br label %34, !llvm.loop !36

64:                                               ; preds = %34
  store i64 0, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %65

65:                                               ; preds = %88, %64
  %66 = load i64, ptr %11, align 8
  %67 = load ptr, ptr %7, align 8
  %68 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 4
  %69 = load i64, ptr %68, align 8
  %70 = icmp ult i64 %66, %69
  br i1 %70, label %71, label %93

71:                                               ; preds = %65
  %72 = load i64, ptr %12, align 8
  %73 = load i64, ptr %8, align 8
  %74 = icmp eq i64 %72, %73
  br i1 %74, label %75, label %78

75:                                               ; preds = %71
  %76 = load i64, ptr %12, align 8
  %77 = add i64 %76, 1
  store i64 %77, ptr %12, align 8
  br label %78

78:                                               ; preds = %75, %71
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  %82 = load i64, ptr %11, align 8
  %83 = getelementptr inbounds i64, ptr %81, i64 %82
  %84 = load i64, ptr %83, align 8
  %85 = load ptr, ptr %17, align 8
  %86 = load i64, ptr %12, align 8
  %87 = getelementptr inbounds i64, ptr %85, i64 %86
  store i64 %84, ptr %87, align 8
  br label %88

88:                                               ; preds = %78
  %89 = load i64, ptr %11, align 8
  %90 = add i64 %89, 1
  store i64 %90, ptr %11, align 8
  %91 = load i64, ptr %12, align 8
  %92 = add i64 %91, 1
  store i64 %92, ptr %12, align 8
  br label %65, !llvm.loop !37

93:                                               ; preds = %65
  %94 = load ptr, ptr %10, align 8
  %95 = load ptr, ptr %18, align 8
  %96 = load i64, ptr %8, align 8
  %97 = add i64 %96, 1
  %98 = getelementptr inbounds ptr, ptr %95, i64 %97
  store ptr %94, ptr %98, align 8
  %99 = load i64, ptr %9, align 8
  %100 = load ptr, ptr %17, align 8
  %101 = load i64, ptr %8, align 8
  %102 = getelementptr inbounds i64, ptr %100, i64 %101
  store i64 %99, ptr %102, align 8
  %103 = load i64, ptr @order, align 8
  %104 = call i64 @cut(i64 noundef %103)
  store i64 %104, ptr %13, align 8
  %105 = call ptr @make_node()
  store ptr %105, ptr %15, align 8
  %106 = load ptr, ptr %7, align 8
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 4
  store i64 0, ptr %107, align 8
  store i64 0, ptr %11, align 8
  br label %108

108:                                              ; preds = %136, %93
  %109 = load i64, ptr %11, align 8
  %110 = load i64, ptr %13, align 8
  %111 = sub i64 %110, 1
  %112 = icmp ult i64 %109, %111
  br i1 %112, label %113, label %139

113:                                              ; preds = %108
  %114 = load ptr, ptr %18, align 8
  %115 = load i64, ptr %11, align 8
  %116 = getelementptr inbounds ptr, ptr %114, i64 %115
  %117 = load ptr, ptr %116, align 8
  %118 = load ptr, ptr %7, align 8
  %119 = getelementptr inbounds %struct.node, ptr %118, i32 0, i32 0
  %120 = load ptr, ptr %119, align 8
  %121 = load i64, ptr %11, align 8
  %122 = getelementptr inbounds ptr, ptr %120, i64 %121
  store ptr %117, ptr %122, align 8
  %123 = load ptr, ptr %17, align 8
  %124 = load i64, ptr %11, align 8
  %125 = getelementptr inbounds i64, ptr %123, i64 %124
  %126 = load i64, ptr %125, align 8
  %127 = load ptr, ptr %7, align 8
  %128 = getelementptr inbounds %struct.node, ptr %127, i32 0, i32 1
  %129 = load ptr, ptr %128, align 8
  %130 = load i64, ptr %11, align 8
  %131 = getelementptr inbounds i64, ptr %129, i64 %130
  store i64 %126, ptr %131, align 8
  %132 = load ptr, ptr %7, align 8
  %133 = getelementptr inbounds %struct.node, ptr %132, i32 0, i32 4
  %134 = load i64, ptr %133, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr %133, align 8
  br label %136

136:                                              ; preds = %113
  %137 = load i64, ptr %11, align 8
  %138 = add i64 %137, 1
  store i64 %138, ptr %11, align 8
  br label %108, !llvm.loop !38

139:                                              ; preds = %108
  %140 = load ptr, ptr %18, align 8
  %141 = load i64, ptr %11, align 8
  %142 = getelementptr inbounds ptr, ptr %140, i64 %141
  %143 = load ptr, ptr %142, align 8
  %144 = load ptr, ptr %7, align 8
  %145 = getelementptr inbounds %struct.node, ptr %144, i32 0, i32 0
  %146 = load ptr, ptr %145, align 8
  %147 = load i64, ptr %11, align 8
  %148 = getelementptr inbounds ptr, ptr %146, i64 %147
  store ptr %143, ptr %148, align 8
  %149 = load ptr, ptr %17, align 8
  %150 = load i64, ptr %13, align 8
  %151 = sub i64 %150, 1
  %152 = getelementptr inbounds i64, ptr %149, i64 %151
  %153 = load i64, ptr %152, align 8
  store i64 %153, ptr %14, align 8
  %154 = load i64, ptr %11, align 8
  %155 = add i64 %154, 1
  store i64 %155, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %156

156:                                              ; preds = %183, %139
  %157 = load i64, ptr %11, align 8
  %158 = load i64, ptr @order, align 8
  %159 = icmp ult i64 %157, %158
  br i1 %159, label %160, label %188

160:                                              ; preds = %156
  %161 = load ptr, ptr %18, align 8
  %162 = load i64, ptr %11, align 8
  %163 = getelementptr inbounds ptr, ptr %161, i64 %162
  %164 = load ptr, ptr %163, align 8
  %165 = load ptr, ptr %15, align 8
  %166 = getelementptr inbounds %struct.node, ptr %165, i32 0, i32 0
  %167 = load ptr, ptr %166, align 8
  %168 = load i64, ptr %12, align 8
  %169 = getelementptr inbounds ptr, ptr %167, i64 %168
  store ptr %164, ptr %169, align 8
  %170 = load ptr, ptr %17, align 8
  %171 = load i64, ptr %11, align 8
  %172 = getelementptr inbounds i64, ptr %170, i64 %171
  %173 = load i64, ptr %172, align 8
  %174 = load ptr, ptr %15, align 8
  %175 = getelementptr inbounds %struct.node, ptr %174, i32 0, i32 1
  %176 = load ptr, ptr %175, align 8
  %177 = load i64, ptr %12, align 8
  %178 = getelementptr inbounds i64, ptr %176, i64 %177
  store i64 %173, ptr %178, align 8
  %179 = load ptr, ptr %15, align 8
  %180 = getelementptr inbounds %struct.node, ptr %179, i32 0, i32 4
  %181 = load i64, ptr %180, align 8
  %182 = add i64 %181, 1
  store i64 %182, ptr %180, align 8
  br label %183

183:                                              ; preds = %160
  %184 = load i64, ptr %11, align 8
  %185 = add i64 %184, 1
  store i64 %185, ptr %11, align 8
  %186 = load i64, ptr %12, align 8
  %187 = add i64 %186, 1
  store i64 %187, ptr %12, align 8
  br label %156, !llvm.loop !39

188:                                              ; preds = %156
  %189 = load ptr, ptr %18, align 8
  %190 = load i64, ptr %11, align 8
  %191 = getelementptr inbounds ptr, ptr %189, i64 %190
  %192 = load ptr, ptr %191, align 8
  %193 = load ptr, ptr %15, align 8
  %194 = getelementptr inbounds %struct.node, ptr %193, i32 0, i32 0
  %195 = load ptr, ptr %194, align 8
  %196 = load i64, ptr %12, align 8
  %197 = getelementptr inbounds ptr, ptr %195, i64 %196
  store ptr %192, ptr %197, align 8
  %198 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %198) #8
  %199 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %199) #8
  %200 = load ptr, ptr %7, align 8
  %201 = getelementptr inbounds %struct.node, ptr %200, i32 0, i32 2
  %202 = load ptr, ptr %201, align 8
  %203 = load ptr, ptr %15, align 8
  %204 = getelementptr inbounds %struct.node, ptr %203, i32 0, i32 2
  store ptr %202, ptr %204, align 8
  store i64 0, ptr %11, align 8
  br label %205

205:                                              ; preds = %221, %188
  %206 = load i64, ptr %11, align 8
  %207 = load ptr, ptr %15, align 8
  %208 = getelementptr inbounds %struct.node, ptr %207, i32 0, i32 4
  %209 = load i64, ptr %208, align 8
  %210 = icmp ule i64 %206, %209
  br i1 %210, label %211, label %224

211:                                              ; preds = %205
  %212 = load ptr, ptr %15, align 8
  %213 = getelementptr inbounds %struct.node, ptr %212, i32 0, i32 0
  %214 = load ptr, ptr %213, align 8
  %215 = load i64, ptr %11, align 8
  %216 = getelementptr inbounds ptr, ptr %214, i64 %215
  %217 = load ptr, ptr %216, align 8
  store ptr %217, ptr %16, align 8
  %218 = load ptr, ptr %15, align 8
  %219 = load ptr, ptr %16, align 8
  %220 = getelementptr inbounds %struct.node, ptr %219, i32 0, i32 2
  store ptr %218, ptr %220, align 8
  br label %221

221:                                              ; preds = %211
  %222 = load i64, ptr %11, align 8
  %223 = add i64 %222, 1
  store i64 %223, ptr %11, align 8
  br label %205, !llvm.loop !40

224:                                              ; preds = %205
  %225 = load ptr, ptr %6, align 8
  %226 = load ptr, ptr %7, align 8
  %227 = load i64, ptr %14, align 8
  %228 = load ptr, ptr %15, align 8
  %229 = call ptr @insert_into_parent(ptr noundef %225, ptr noundef %226, i64 noundef %227, ptr noundef %228)
  ret ptr %229
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_new_root(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
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
define dso_local ptr @start_new_tree(i64 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call ptr @make_leaf()
  store ptr %6, ptr %5, align 8
  %7 = load i64, ptr %3, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds i64, ptr %10, i64 0
  store i64 %7, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  store ptr %12, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load i64, ptr @order, align 8
  %21 = sub i64 %20, 1
  %22 = getelementptr inbounds ptr, ptr %19, i64 %21
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 4
  %27 = load i64, ptr %26, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr %26, align 8
  %29 = load ptr, ptr %5, align 8
  ret ptr %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call ptr @find(ptr noundef %10, i64 noundef %11, i1 noundef zeroext false, ptr noundef null)
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %20

15:                                               ; preds = %3
  %16 = load i64, ptr %7, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.record, ptr %17, i32 0, i32 0
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %5, align 8
  store ptr %19, ptr %4, align 8
  br label %51

20:                                               ; preds = %3
  %21 = load i64, ptr %7, align 8
  %22 = call ptr @make_record(i64 noundef %21)
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %29

25:                                               ; preds = %20
  %26 = load i64, ptr %6, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = call ptr @start_new_tree(i64 noundef %26, ptr noundef %27)
  store ptr %28, ptr %4, align 8
  br label %51

29:                                               ; preds = %20
  %30 = load ptr, ptr %5, align 8
  %31 = load i64, ptr %6, align 8
  %32 = call ptr @find_leaf(ptr noundef %30, i64 noundef %31, i1 noundef zeroext false)
  store ptr %32, ptr %9, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 4
  %35 = load i64, ptr %34, align 8
  %36 = load i64, ptr @order, align 8
  %37 = sub i64 %36, 1
  %38 = icmp ult i64 %35, %37
  br i1 %38, label %39, label %45

39:                                               ; preds = %29
  %40 = load ptr, ptr %9, align 8
  %41 = load i64, ptr %6, align 8
  %42 = load ptr, ptr %8, align 8
  %43 = call ptr @insert_into_leaf(ptr noundef %40, i64 noundef %41, ptr noundef %42)
  store ptr %43, ptr %9, align 8
  %44 = load ptr, ptr %5, align 8
  store ptr %44, ptr %4, align 8
  br label %51

45:                                               ; preds = %29
  %46 = load ptr, ptr %5, align 8
  %47 = load ptr, ptr %9, align 8
  %48 = load i64, ptr %6, align 8
  %49 = load ptr, ptr %8, align 8
  %50 = call ptr @insert_into_leaf_after_splitting(ptr noundef %46, ptr noundef %47, i64 noundef %48, ptr noundef %49)
  store ptr %50, ptr %4, align 8
  br label %51

51:                                               ; preds = %45, %39, %25, %15
  %52 = load ptr, ptr %4, align 8
  ret ptr %52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_neighbor_index(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %4

4:                                                ; preds = %27, %1
  %5 = load i64, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4
  %10 = load i64, ptr %9, align 8
  %11 = icmp ule i64 %5, %10
  br i1 %11, label %12, label %30

12:                                               ; preds = %4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %3, align 8
  %19 = getelementptr inbounds ptr, ptr %17, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = icmp eq ptr %20, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %12
  %24 = load i64, ptr %3, align 8
  %25 = sub i64 %24, 1
  ret i64 %25

26:                                               ; preds = %12
  br label %27

27:                                               ; preds = %26
  %28 = load i64, ptr %3, align 8
  %29 = add i64 %28, 1
  store i64 %29, ptr %3, align 8
  br label %4, !llvm.loop !41

30:                                               ; preds = %4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  %32 = load ptr, ptr %2, align 8
  %33 = ptrtoint ptr %32 to i64
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.36, i64 noundef %33)
  call void @exit(i32 noundef 1) #7
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @remove_entry_from_node(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 0, ptr %7, align 8
  br label %9

9:                                                ; preds = %18, %3
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load i64, ptr %7, align 8
  %14 = getelementptr inbounds i64, ptr %12, i64 %13
  %15 = load i64, ptr %14, align 8
  %16 = load i64, ptr %5, align 8
  %17 = icmp ne i64 %15, %16
  br i1 %17, label %18, label %21

18:                                               ; preds = %9
  %19 = load i64, ptr %7, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr %7, align 8
  br label %9, !llvm.loop !42

21:                                               ; preds = %9
  %22 = load i64, ptr %7, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %7, align 8
  br label %24

24:                                               ; preds = %43, %21
  %25 = load i64, ptr %7, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4
  %28 = load i64, ptr %27, align 8
  %29 = icmp ult i64 %25, %28
  br i1 %29, label %30, label %46

30:                                               ; preds = %24
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  %34 = load i64, ptr %7, align 8
  %35 = getelementptr inbounds i64, ptr %33, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load i64, ptr %7, align 8
  %41 = sub i64 %40, 1
  %42 = getelementptr inbounds i64, ptr %39, i64 %41
  store i64 %36, ptr %42, align 8
  br label %43

43:                                               ; preds = %30
  %44 = load i64, ptr %7, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %7, align 8
  br label %24, !llvm.loop !43

46:                                               ; preds = %24
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 3
  %49 = load i8, ptr %48, align 8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %51, label %55

51:                                               ; preds = %46
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 4
  %54 = load i64, ptr %53, align 8
  br label %60

55:                                               ; preds = %46
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 4
  %58 = load i64, ptr %57, align 8
  %59 = add i64 %58, 1
  br label %60

60:                                               ; preds = %55, %51
  %61 = phi i64 [ %54, %51 ], [ %59, %55 ]
  store i64 %61, ptr %8, align 8
  store i64 0, ptr %7, align 8
  br label %62

62:                                               ; preds = %71, %60
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.node, ptr %63, i32 0, i32 0
  %65 = load ptr, ptr %64, align 8
  %66 = load i64, ptr %7, align 8
  %67 = getelementptr inbounds ptr, ptr %65, i64 %66
  %68 = load ptr, ptr %67, align 8
  %69 = load ptr, ptr %6, align 8
  %70 = icmp ne ptr %68, %69
  br i1 %70, label %71, label %74

71:                                               ; preds = %62
  %72 = load i64, ptr %7, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr %7, align 8
  br label %62, !llvm.loop !44

74:                                               ; preds = %62
  %75 = load i64, ptr %7, align 8
  %76 = add i64 %75, 1
  store i64 %76, ptr %7, align 8
  br label %77

77:                                               ; preds = %94, %74
  %78 = load i64, ptr %7, align 8
  %79 = load i64, ptr %8, align 8
  %80 = icmp ult i64 %78, %79
  br i1 %80, label %81, label %97

81:                                               ; preds = %77
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.node, ptr %82, i32 0, i32 0
  %84 = load ptr, ptr %83, align 8
  %85 = load i64, ptr %7, align 8
  %86 = getelementptr inbounds ptr, ptr %84, i64 %85
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %4, align 8
  %89 = getelementptr inbounds %struct.node, ptr %88, i32 0, i32 0
  %90 = load ptr, ptr %89, align 8
  %91 = load i64, ptr %7, align 8
  %92 = sub i64 %91, 1
  %93 = getelementptr inbounds ptr, ptr %90, i64 %92
  store ptr %87, ptr %93, align 8
  br label %94

94:                                               ; preds = %81
  %95 = load i64, ptr %7, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr %7, align 8
  br label %77, !llvm.loop !45

97:                                               ; preds = %77
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 4
  %100 = load i64, ptr %99, align 8
  %101 = add i64 %100, -1
  store i64 %101, ptr %99, align 8
  %102 = load ptr, ptr %4, align 8
  %103 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 3
  %104 = load i8, ptr %103, align 8
  %105 = trunc i8 %104 to i1
  br i1 %105, label %106, label %125

106:                                              ; preds = %97
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds %struct.node, ptr %107, i32 0, i32 4
  %109 = load i64, ptr %108, align 8
  store i64 %109, ptr %7, align 8
  br label %110

110:                                              ; preds = %121, %106
  %111 = load i64, ptr %7, align 8
  %112 = load i64, ptr @order, align 8
  %113 = sub i64 %112, 1
  %114 = icmp ult i64 %111, %113
  br i1 %114, label %115, label %124

115:                                              ; preds = %110
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds %struct.node, ptr %116, i32 0, i32 0
  %118 = load ptr, ptr %117, align 8
  %119 = load i64, ptr %7, align 8
  %120 = getelementptr inbounds ptr, ptr %118, i64 %119
  store ptr null, ptr %120, align 8
  br label %121

121:                                              ; preds = %115
  %122 = load i64, ptr %7, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr %7, align 8
  br label %110, !llvm.loop !46

124:                                              ; preds = %110
  br label %144

125:                                              ; preds = %97
  %126 = load ptr, ptr %4, align 8
  %127 = getelementptr inbounds %struct.node, ptr %126, i32 0, i32 4
  %128 = load i64, ptr %127, align 8
  %129 = add i64 %128, 1
  store i64 %129, ptr %7, align 8
  br label %130

130:                                              ; preds = %140, %125
  %131 = load i64, ptr %7, align 8
  %132 = load i64, ptr @order, align 8
  %133 = icmp ult i64 %131, %132
  br i1 %133, label %134, label %143

134:                                              ; preds = %130
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.node, ptr %135, i32 0, i32 0
  %137 = load ptr, ptr %136, align 8
  %138 = load i64, ptr %7, align 8
  %139 = getelementptr inbounds ptr, ptr %137, i64 %138
  store ptr null, ptr %139, align 8
  br label %140

140:                                              ; preds = %134
  %141 = load i64, ptr %7, align 8
  %142 = add i64 %141, 1
  store i64 %142, ptr %7, align 8
  br label %130, !llvm.loop !47

143:                                              ; preds = %130
  br label %144

144:                                              ; preds = %143, %124
  %145 = load ptr, ptr %4, align 8
  ret ptr %145
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @adjust_root(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 4
  %7 = load i64, ptr %6, align 8
  %8 = icmp ugt i64 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  store ptr %10, ptr %2, align 8
  br label %34

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 3
  %14 = load i8, ptr %13, align 8
  %15 = trunc i8 %14 to i1
  br i1 %15, label %24, label %16

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 0
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %4, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 2
  store ptr null, ptr %23, align 8
  br label %25

24:                                               ; preds = %11
  store ptr null, ptr %4, align 8
  br label %25

25:                                               ; preds = %24, %16
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28) #8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  call void @free(ptr noundef %31) #8
  %32 = load ptr, ptr %3, align 8
  call void @free_node(ptr noundef %32)
  %33 = load ptr, ptr %4, align 8
  store ptr %33, ptr %2, align 8
  br label %34

34:                                               ; preds = %25, %9
  %35 = load ptr, ptr %2, align 8
  ret ptr %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @coalesce_nodes(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3, i64 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  store i64 %4, ptr %10, align 8
  %16 = load i64, ptr %9, align 8
  %17 = icmp eq i64 %16, -1
  br i1 %17, label %18, label %22

18:                                               ; preds = %5
  %19 = load ptr, ptr %7, align 8
  store ptr %19, ptr %15, align 8
  %20 = load ptr, ptr %8, align 8
  store ptr %20, ptr %7, align 8
  %21 = load ptr, ptr %15, align 8
  store ptr %21, ptr %8, align 8
  br label %22

22:                                               ; preds = %18, %5
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 4
  %25 = load i64, ptr %24, align 8
  store i64 %25, ptr %13, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 3
  %28 = load i8, ptr %27, align 8
  %29 = trunc i8 %28 to i1
  br i1 %29, label %119, label %30

30:                                               ; preds = %22
  %31 = load i64, ptr %10, align 8
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load i64, ptr %13, align 8
  %36 = getelementptr inbounds i64, ptr %34, i64 %35
  store i64 %31, ptr %36, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 4
  %39 = load i64, ptr %38, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr %38, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 4
  %43 = load i64, ptr %42, align 8
  store i64 %43, ptr %14, align 8
  %44 = load i64, ptr %13, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %46

46:                                               ; preds = %81, %30
  %47 = load i64, ptr %12, align 8
  %48 = load i64, ptr %14, align 8
  %49 = icmp ult i64 %47, %48
  br i1 %49, label %50, label %86

50:                                               ; preds = %46
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds %struct.node, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = load i64, ptr %12, align 8
  %55 = getelementptr inbounds i64, ptr %53, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = load i64, ptr %11, align 8
  %61 = getelementptr inbounds i64, ptr %59, i64 %60
  store i64 %56, ptr %61, align 8
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i64, ptr %12, align 8
  %66 = getelementptr inbounds ptr, ptr %64, i64 %65
  %67 = load ptr, ptr %66, align 8
  %68 = load ptr, ptr %8, align 8
  %69 = getelementptr inbounds %struct.node, ptr %68, i32 0, i32 0
  %70 = load ptr, ptr %69, align 8
  %71 = load i64, ptr %11, align 8
  %72 = getelementptr inbounds ptr, ptr %70, i64 %71
  store ptr %67, ptr %72, align 8
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 4
  %75 = load i64, ptr %74, align 8
  %76 = add i64 %75, 1
  store i64 %76, ptr %74, align 8
  %77 = load ptr, ptr %7, align 8
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 4
  %79 = load i64, ptr %78, align 8
  %80 = add i64 %79, -1
  store i64 %80, ptr %78, align 8
  br label %81

81:                                               ; preds = %50
  %82 = load i64, ptr %11, align 8
  %83 = add i64 %82, 1
  store i64 %83, ptr %11, align 8
  %84 = load i64, ptr %12, align 8
  %85 = add i64 %84, 1
  store i64 %85, ptr %12, align 8
  br label %46, !llvm.loop !48

86:                                               ; preds = %46
  %87 = load ptr, ptr %7, align 8
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0
  %89 = load ptr, ptr %88, align 8
  %90 = load i64, ptr %12, align 8
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90
  %92 = load ptr, ptr %91, align 8
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds %struct.node, ptr %93, i32 0, i32 0
  %95 = load ptr, ptr %94, align 8
  %96 = load i64, ptr %11, align 8
  %97 = getelementptr inbounds ptr, ptr %95, i64 %96
  store ptr %92, ptr %97, align 8
  store i64 0, ptr %11, align 8
  br label %98

98:                                               ; preds = %115, %86
  %99 = load i64, ptr %11, align 8
  %100 = load ptr, ptr %8, align 8
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 4
  %102 = load i64, ptr %101, align 8
  %103 = add i64 %102, 1
  %104 = icmp ult i64 %99, %103
  br i1 %104, label %105, label %118

105:                                              ; preds = %98
  %106 = load ptr, ptr %8, align 8
  %107 = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 0
  %108 = load ptr, ptr %107, align 8
  %109 = load i64, ptr %11, align 8
  %110 = getelementptr inbounds ptr, ptr %108, i64 %109
  %111 = load ptr, ptr %110, align 8
  store ptr %111, ptr %15, align 8
  %112 = load ptr, ptr %8, align 8
  %113 = load ptr, ptr %15, align 8
  %114 = getelementptr inbounds %struct.node, ptr %113, i32 0, i32 2
  store ptr %112, ptr %114, align 8
  br label %115

115:                                              ; preds = %105
  %116 = load i64, ptr %11, align 8
  %117 = add i64 %116, 1
  store i64 %117, ptr %11, align 8
  br label %98, !llvm.loop !49

118:                                              ; preds = %98
  br label %173

119:                                              ; preds = %22
  %120 = load i64, ptr %13, align 8
  store i64 %120, ptr %11, align 8
  store i64 0, ptr %12, align 8
  br label %121

121:                                              ; preds = %154, %119
  %122 = load i64, ptr %12, align 8
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 4
  %125 = load i64, ptr %124, align 8
  %126 = icmp ult i64 %122, %125
  br i1 %126, label %127, label %159

127:                                              ; preds = %121
  %128 = load ptr, ptr %7, align 8
  %129 = getelementptr inbounds %struct.node, ptr %128, i32 0, i32 1
  %130 = load ptr, ptr %129, align 8
  %131 = load i64, ptr %12, align 8
  %132 = getelementptr inbounds i64, ptr %130, i64 %131
  %133 = load i64, ptr %132, align 8
  %134 = load ptr, ptr %8, align 8
  %135 = getelementptr inbounds %struct.node, ptr %134, i32 0, i32 1
  %136 = load ptr, ptr %135, align 8
  %137 = load i64, ptr %11, align 8
  %138 = getelementptr inbounds i64, ptr %136, i64 %137
  store i64 %133, ptr %138, align 8
  %139 = load ptr, ptr %7, align 8
  %140 = getelementptr inbounds %struct.node, ptr %139, i32 0, i32 0
  %141 = load ptr, ptr %140, align 8
  %142 = load i64, ptr %12, align 8
  %143 = getelementptr inbounds ptr, ptr %141, i64 %142
  %144 = load ptr, ptr %143, align 8
  %145 = load ptr, ptr %8, align 8
  %146 = getelementptr inbounds %struct.node, ptr %145, i32 0, i32 0
  %147 = load ptr, ptr %146, align 8
  %148 = load i64, ptr %11, align 8
  %149 = getelementptr inbounds ptr, ptr %147, i64 %148
  store ptr %144, ptr %149, align 8
  %150 = load ptr, ptr %8, align 8
  %151 = getelementptr inbounds %struct.node, ptr %150, i32 0, i32 4
  %152 = load i64, ptr %151, align 8
  %153 = add i64 %152, 1
  store i64 %153, ptr %151, align 8
  br label %154

154:                                              ; preds = %127
  %155 = load i64, ptr %11, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr %11, align 8
  %157 = load i64, ptr %12, align 8
  %158 = add i64 %157, 1
  store i64 %158, ptr %12, align 8
  br label %121, !llvm.loop !50

159:                                              ; preds = %121
  %160 = load ptr, ptr %7, align 8
  %161 = getelementptr inbounds %struct.node, ptr %160, i32 0, i32 0
  %162 = load ptr, ptr %161, align 8
  %163 = load i64, ptr @order, align 8
  %164 = sub i64 %163, 1
  %165 = getelementptr inbounds ptr, ptr %162, i64 %164
  %166 = load ptr, ptr %165, align 8
  %167 = load ptr, ptr %8, align 8
  %168 = getelementptr inbounds %struct.node, ptr %167, i32 0, i32 0
  %169 = load ptr, ptr %168, align 8
  %170 = load i64, ptr @order, align 8
  %171 = sub i64 %170, 1
  %172 = getelementptr inbounds ptr, ptr %169, i64 %171
  store ptr %166, ptr %172, align 8
  br label %173

173:                                              ; preds = %159, %118
  %174 = load ptr, ptr %6, align 8
  %175 = load ptr, ptr %7, align 8
  %176 = getelementptr inbounds %struct.node, ptr %175, i32 0, i32 2
  %177 = load ptr, ptr %176, align 8
  %178 = load i64, ptr %10, align 8
  %179 = load ptr, ptr %7, align 8
  %180 = call ptr @delete_entry(ptr noundef %174, ptr noundef %177, i64 noundef %178, ptr noundef %179)
  store ptr %180, ptr %6, align 8
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr inbounds %struct.node, ptr %181, i32 0, i32 1
  %183 = load ptr, ptr %182, align 8
  call void @free(ptr noundef %183) #8
  %184 = load ptr, ptr %7, align 8
  %185 = getelementptr inbounds %struct.node, ptr %184, i32 0, i32 0
  %186 = load ptr, ptr %185, align 8
  call void @free(ptr noundef %186) #8
  %187 = load ptr, ptr %7, align 8
  call void @free_node(ptr noundef %187)
  %188 = load ptr, ptr %6, align 8
  ret ptr %188
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete_entry(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = load i64, ptr %8, align 8
  %18 = load ptr, ptr %9, align 8
  %19 = call ptr @remove_entry_from_node(ptr noundef %16, i64 noundef %17, ptr noundef %18)
  store ptr %19, ptr %7, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = icmp eq ptr %20, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %4
  %24 = load ptr, ptr %6, align 8
  %25 = call ptr @adjust_root(ptr noundef %24)
  store ptr %25, ptr %5, align 8
  br label %122

26:                                               ; preds = %4
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 3
  %29 = load i8, ptr %28, align 8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %35

31:                                               ; preds = %26
  %32 = load i64, ptr @order, align 8
  %33 = sub i64 %32, 1
  %34 = call i64 @cut(i64 noundef %33)
  br label %39

35:                                               ; preds = %26
  %36 = load i64, ptr @order, align 8
  %37 = call i64 @cut(i64 noundef %36)
  %38 = sub i64 %37, 1
  br label %39

39:                                               ; preds = %35, %31
  %40 = phi i64 [ %34, %31 ], [ %38, %35 ]
  store i64 %40, ptr %10, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 4
  %43 = load i64, ptr %42, align 8
  %44 = load i64, ptr %10, align 8
  %45 = icmp uge i64 %43, %44
  br i1 %45, label %46, label %48

46:                                               ; preds = %39
  %47 = load ptr, ptr %6, align 8
  store ptr %47, ptr %5, align 8
  br label %122

48:                                               ; preds = %39
  %49 = load ptr, ptr %7, align 8
  %50 = call i64 @get_neighbor_index(ptr noundef %49)
  store i64 %50, ptr %12, align 8
  %51 = load i64, ptr %12, align 8
  %52 = icmp eq i64 %51, -1
  br i1 %52, label %53, label %54

53:                                               ; preds = %48
  br label %56

54:                                               ; preds = %48
  %55 = load i64, ptr %12, align 8
  br label %56

56:                                               ; preds = %54, %53
  %57 = phi i64 [ 0, %53 ], [ %55, %54 ]
  store i64 %57, ptr %13, align 8
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds %struct.node, ptr %58, i32 0, i32 2
  %60 = load ptr, ptr %59, align 8
  %61 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  %63 = load i64, ptr %13, align 8
  %64 = getelementptr inbounds i64, ptr %62, i64 %63
  %65 = load i64, ptr %64, align 8
  store i64 %65, ptr %14, align 8
  %66 = load i64, ptr %12, align 8
  %67 = icmp eq i64 %66, -1
  br i1 %67, label %68, label %76

68:                                               ; preds = %56
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr inbounds %struct.node, ptr %69, i32 0, i32 2
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds %struct.node, ptr %71, i32 0, i32 0
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds ptr, ptr %73, i64 1
  %75 = load ptr, ptr %74, align 8
  br label %85

76:                                               ; preds = %56
  %77 = load ptr, ptr %7, align 8
  %78 = getelementptr inbounds %struct.node, ptr %77, i32 0, i32 2
  %79 = load ptr, ptr %78, align 8
  %80 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = load i64, ptr %12, align 8
  %83 = getelementptr inbounds ptr, ptr %81, i64 %82
  %84 = load ptr, ptr %83, align 8
  br label %85

85:                                               ; preds = %76, %68
  %86 = phi ptr [ %75, %68 ], [ %84, %76 ]
  store ptr %86, ptr %11, align 8
  %87 = load ptr, ptr %7, align 8
  %88 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 3
  %89 = load i8, ptr %88, align 8
  %90 = trunc i8 %89 to i1
  br i1 %90, label %91, label %93

91:                                               ; preds = %85
  %92 = load i64, ptr @order, align 8
  br label %96

93:                                               ; preds = %85
  %94 = load i64, ptr @order, align 8
  %95 = sub i64 %94, 1
  br label %96

96:                                               ; preds = %93, %91
  %97 = phi i64 [ %92, %91 ], [ %95, %93 ]
  store i64 %97, ptr %15, align 8
  %98 = load ptr, ptr %11, align 8
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 4
  %100 = load i64, ptr %99, align 8
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.node, ptr %101, i32 0, i32 4
  %103 = load i64, ptr %102, align 8
  %104 = add i64 %100, %103
  %105 = load i64, ptr %15, align 8
  %106 = icmp ult i64 %104, %105
  br i1 %106, label %107, label %114

107:                                              ; preds = %96
  %108 = load ptr, ptr %6, align 8
  %109 = load ptr, ptr %7, align 8
  %110 = load ptr, ptr %11, align 8
  %111 = load i64, ptr %12, align 8
  %112 = load i64, ptr %14, align 8
  %113 = call ptr @coalesce_nodes(ptr noundef %108, ptr noundef %109, ptr noundef %110, i64 noundef %111, i64 noundef %112)
  store ptr %113, ptr %5, align 8
  br label %122

114:                                              ; preds = %96
  %115 = load ptr, ptr %6, align 8
  %116 = load ptr, ptr %7, align 8
  %117 = load ptr, ptr %11, align 8
  %118 = load i64, ptr %12, align 8
  %119 = load i64, ptr %13, align 8
  %120 = load i64, ptr %14, align 8
  %121 = call ptr @redistribute_nodes(ptr noundef %115, ptr noundef %116, ptr noundef %117, i64 noundef %118, i64 noundef %119, i64 noundef %120)
  store ptr %121, ptr %5, align 8
  br label %122

122:                                              ; preds = %114, %107, %46, %23
  %123 = load ptr, ptr %5, align 8
  ret ptr %123
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @redistribute_nodes(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store i64 %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  store i64 %5, ptr %12, align 8
  %15 = load i64, ptr %10, align 8
  %16 = icmp ne i64 %15, -1
  br i1 %16, label %17, label %176

17:                                               ; preds = %6
  %18 = load ptr, ptr %8, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 3
  %20 = load i8, ptr %19, align 8
  %21 = trunc i8 %20 to i1
  br i1 %21, label %39, label %22

22:                                               ; preds = %17
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 4
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr inbounds ptr, ptr %25, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.node, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 4
  %36 = load i64, ptr %35, align 8
  %37 = add i64 %36, 1
  %38 = getelementptr inbounds ptr, ptr %33, i64 %37
  store ptr %30, ptr %38, align 8
  br label %39

39:                                               ; preds = %22, %17
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr inbounds %struct.node, ptr %40, i32 0, i32 4
  %42 = load i64, ptr %41, align 8
  store i64 %42, ptr %13, align 8
  br label %43

43:                                               ; preds = %71, %39
  %44 = load i64, ptr %13, align 8
  %45 = icmp ugt i64 %44, 0
  br i1 %45, label %46, label %74

46:                                               ; preds = %43
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = load i64, ptr %13, align 8
  %51 = sub i64 %50, 1
  %52 = getelementptr inbounds i64, ptr %49, i64 %51
  %53 = load i64, ptr %52, align 8
  %54 = load ptr, ptr %8, align 8
  %55 = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  %57 = load i64, ptr %13, align 8
  %58 = getelementptr inbounds i64, ptr %56, i64 %57
  store i64 %53, ptr %58, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = getelementptr inbounds %struct.node, ptr %59, i32 0, i32 0
  %61 = load ptr, ptr %60, align 8
  %62 = load i64, ptr %13, align 8
  %63 = sub i64 %62, 1
  %64 = getelementptr inbounds ptr, ptr %61, i64 %63
  %65 = load ptr, ptr %64, align 8
  %66 = load ptr, ptr %8, align 8
  %67 = getelementptr inbounds %struct.node, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = load i64, ptr %13, align 8
  %70 = getelementptr inbounds ptr, ptr %68, i64 %69
  store ptr %65, ptr %70, align 8
  br label %71

71:                                               ; preds = %46
  %72 = load i64, ptr %13, align 8
  %73 = add i64 %72, -1
  store i64 %73, ptr %13, align 8
  br label %43, !llvm.loop !51

74:                                               ; preds = %43
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.node, ptr %75, i32 0, i32 3
  %77 = load i8, ptr %76, align 8
  %78 = trunc i8 %77 to i1
  br i1 %78, label %128, label %79

79:                                               ; preds = %74
  %80 = load ptr, ptr %9, align 8
  %81 = getelementptr inbounds %struct.node, ptr %80, i32 0, i32 0
  %82 = load ptr, ptr %81, align 8
  %83 = load ptr, ptr %9, align 8
  %84 = getelementptr inbounds %struct.node, ptr %83, i32 0, i32 4
  %85 = load i64, ptr %84, align 8
  %86 = getelementptr inbounds ptr, ptr %82, i64 %85
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %8, align 8
  %89 = getelementptr inbounds %struct.node, ptr %88, i32 0, i32 0
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds ptr, ptr %90, i64 0
  store ptr %87, ptr %91, align 8
  %92 = load ptr, ptr %8, align 8
  %93 = getelementptr inbounds %struct.node, ptr %92, i32 0, i32 0
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds ptr, ptr %94, i64 0
  %96 = load ptr, ptr %95, align 8
  store ptr %96, ptr %14, align 8
  %97 = load ptr, ptr %8, align 8
  %98 = load ptr, ptr %14, align 8
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 2
  store ptr %97, ptr %99, align 8
  %100 = load ptr, ptr %9, align 8
  %101 = getelementptr inbounds %struct.node, ptr %100, i32 0, i32 0
  %102 = load ptr, ptr %101, align 8
  %103 = load ptr, ptr %9, align 8
  %104 = getelementptr inbounds %struct.node, ptr %103, i32 0, i32 4
  %105 = load i64, ptr %104, align 8
  %106 = getelementptr inbounds ptr, ptr %102, i64 %105
  store ptr null, ptr %106, align 8
  %107 = load i64, ptr %12, align 8
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr inbounds %struct.node, ptr %108, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  %111 = getelementptr inbounds i64, ptr %110, i64 0
  store i64 %107, ptr %111, align 8
  %112 = load ptr, ptr %9, align 8
  %113 = getelementptr inbounds %struct.node, ptr %112, i32 0, i32 1
  %114 = load ptr, ptr %113, align 8
  %115 = load ptr, ptr %9, align 8
  %116 = getelementptr inbounds %struct.node, ptr %115, i32 0, i32 4
  %117 = load i64, ptr %116, align 8
  %118 = sub i64 %117, 1
  %119 = getelementptr inbounds i64, ptr %114, i64 %118
  %120 = load i64, ptr %119, align 8
  %121 = load ptr, ptr %8, align 8
  %122 = getelementptr inbounds %struct.node, ptr %121, i32 0, i32 2
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds %struct.node, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  %126 = load i64, ptr %11, align 8
  %127 = getelementptr inbounds i64, ptr %125, i64 %126
  store i64 %120, ptr %127, align 8
  br label %175

128:                                              ; preds = %74
  %129 = load ptr, ptr %9, align 8
  %130 = getelementptr inbounds %struct.node, ptr %129, i32 0, i32 0
  %131 = load ptr, ptr %130, align 8
  %132 = load ptr, ptr %9, align 8
  %133 = getelementptr inbounds %struct.node, ptr %132, i32 0, i32 4
  %134 = load i64, ptr %133, align 8
  %135 = sub i64 %134, 1
  %136 = getelementptr inbounds ptr, ptr %131, i64 %135
  %137 = load ptr, ptr %136, align 8
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.node, ptr %138, i32 0, i32 0
  %140 = load ptr, ptr %139, align 8
  %141 = getelementptr inbounds ptr, ptr %140, i64 0
  store ptr %137, ptr %141, align 8
  %142 = load ptr, ptr %9, align 8
  %143 = getelementptr inbounds %struct.node, ptr %142, i32 0, i32 0
  %144 = load ptr, ptr %143, align 8
  %145 = load ptr, ptr %9, align 8
  %146 = getelementptr inbounds %struct.node, ptr %145, i32 0, i32 4
  %147 = load i64, ptr %146, align 8
  %148 = sub i64 %147, 1
  %149 = getelementptr inbounds ptr, ptr %144, i64 %148
  store ptr null, ptr %149, align 8
  %150 = load ptr, ptr %9, align 8
  %151 = getelementptr inbounds %struct.node, ptr %150, i32 0, i32 1
  %152 = load ptr, ptr %151, align 8
  %153 = load ptr, ptr %9, align 8
  %154 = getelementptr inbounds %struct.node, ptr %153, i32 0, i32 4
  %155 = load i64, ptr %154, align 8
  %156 = sub i64 %155, 1
  %157 = getelementptr inbounds i64, ptr %152, i64 %156
  %158 = load i64, ptr %157, align 8
  %159 = load ptr, ptr %8, align 8
  %160 = getelementptr inbounds %struct.node, ptr %159, i32 0, i32 1
  %161 = load ptr, ptr %160, align 8
  %162 = getelementptr inbounds i64, ptr %161, i64 0
  store i64 %158, ptr %162, align 8
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds %struct.node, ptr %163, i32 0, i32 1
  %165 = load ptr, ptr %164, align 8
  %166 = getelementptr inbounds i64, ptr %165, i64 0
  %167 = load i64, ptr %166, align 8
  %168 = load ptr, ptr %8, align 8
  %169 = getelementptr inbounds %struct.node, ptr %168, i32 0, i32 2
  %170 = load ptr, ptr %169, align 8
  %171 = getelementptr inbounds %struct.node, ptr %170, i32 0, i32 1
  %172 = load ptr, ptr %171, align 8
  %173 = load i64, ptr %11, align 8
  %174 = getelementptr inbounds i64, ptr %172, i64 %173
  store i64 %167, ptr %174, align 8
  br label %175

175:                                              ; preds = %128, %79
  br label %319

176:                                              ; preds = %6
  %177 = load ptr, ptr %8, align 8
  %178 = getelementptr inbounds %struct.node, ptr %177, i32 0, i32 3
  %179 = load i8, ptr %178, align 8
  %180 = trunc i8 %179 to i1
  br i1 %180, label %181, label %218

181:                                              ; preds = %176
  %182 = load ptr, ptr %9, align 8
  %183 = getelementptr inbounds %struct.node, ptr %182, i32 0, i32 1
  %184 = load ptr, ptr %183, align 8
  %185 = getelementptr inbounds i64, ptr %184, i64 0
  %186 = load i64, ptr %185, align 8
  %187 = load ptr, ptr %8, align 8
  %188 = getelementptr inbounds %struct.node, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = load ptr, ptr %8, align 8
  %191 = getelementptr inbounds %struct.node, ptr %190, i32 0, i32 4
  %192 = load i64, ptr %191, align 8
  %193 = getelementptr inbounds i64, ptr %189, i64 %192
  store i64 %186, ptr %193, align 8
  %194 = load ptr, ptr %9, align 8
  %195 = getelementptr inbounds %struct.node, ptr %194, i32 0, i32 0
  %196 = load ptr, ptr %195, align 8
  %197 = getelementptr inbounds ptr, ptr %196, i64 0
  %198 = load ptr, ptr %197, align 8
  %199 = load ptr, ptr %8, align 8
  %200 = getelementptr inbounds %struct.node, ptr %199, i32 0, i32 0
  %201 = load ptr, ptr %200, align 8
  %202 = load ptr, ptr %8, align 8
  %203 = getelementptr inbounds %struct.node, ptr %202, i32 0, i32 4
  %204 = load i64, ptr %203, align 8
  %205 = getelementptr inbounds ptr, ptr %201, i64 %204
  store ptr %198, ptr %205, align 8
  %206 = load ptr, ptr %9, align 8
  %207 = getelementptr inbounds %struct.node, ptr %206, i32 0, i32 1
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds i64, ptr %208, i64 1
  %210 = load i64, ptr %209, align 8
  %211 = load ptr, ptr %8, align 8
  %212 = getelementptr inbounds %struct.node, ptr %211, i32 0, i32 2
  %213 = load ptr, ptr %212, align 8
  %214 = getelementptr inbounds %struct.node, ptr %213, i32 0, i32 1
  %215 = load ptr, ptr %214, align 8
  %216 = load i64, ptr %11, align 8
  %217 = getelementptr inbounds i64, ptr %215, i64 %216
  store i64 %210, ptr %217, align 8
  br label %264

218:                                              ; preds = %176
  %219 = load i64, ptr %12, align 8
  %220 = load ptr, ptr %8, align 8
  %221 = getelementptr inbounds %struct.node, ptr %220, i32 0, i32 1
  %222 = load ptr, ptr %221, align 8
  %223 = load ptr, ptr %8, align 8
  %224 = getelementptr inbounds %struct.node, ptr %223, i32 0, i32 4
  %225 = load i64, ptr %224, align 8
  %226 = getelementptr inbounds i64, ptr %222, i64 %225
  store i64 %219, ptr %226, align 8
  %227 = load ptr, ptr %9, align 8
  %228 = getelementptr inbounds %struct.node, ptr %227, i32 0, i32 0
  %229 = load ptr, ptr %228, align 8
  %230 = getelementptr inbounds ptr, ptr %229, i64 0
  %231 = load ptr, ptr %230, align 8
  %232 = load ptr, ptr %8, align 8
  %233 = getelementptr inbounds %struct.node, ptr %232, i32 0, i32 0
  %234 = load ptr, ptr %233, align 8
  %235 = load ptr, ptr %8, align 8
  %236 = getelementptr inbounds %struct.node, ptr %235, i32 0, i32 4
  %237 = load i64, ptr %236, align 8
  %238 = add i64 %237, 1
  %239 = getelementptr inbounds ptr, ptr %234, i64 %238
  store ptr %231, ptr %239, align 8
  %240 = load ptr, ptr %8, align 8
  %241 = getelementptr inbounds %struct.node, ptr %240, i32 0, i32 0
  %242 = load ptr, ptr %241, align 8
  %243 = load ptr, ptr %8, align 8
  %244 = getelementptr inbounds %struct.node, ptr %243, i32 0, i32 4
  %245 = load i64, ptr %244, align 8
  %246 = add i64 %245, 1
  %247 = getelementptr inbounds ptr, ptr %242, i64 %246
  %248 = load ptr, ptr %247, align 8
  store ptr %248, ptr %14, align 8
  %249 = load ptr, ptr %8, align 8
  %250 = load ptr, ptr %14, align 8
  %251 = getelementptr inbounds %struct.node, ptr %250, i32 0, i32 2
  store ptr %249, ptr %251, align 8
  %252 = load ptr, ptr %9, align 8
  %253 = getelementptr inbounds %struct.node, ptr %252, i32 0, i32 1
  %254 = load ptr, ptr %253, align 8
  %255 = getelementptr inbounds i64, ptr %254, i64 0
  %256 = load i64, ptr %255, align 8
  %257 = load ptr, ptr %8, align 8
  %258 = getelementptr inbounds %struct.node, ptr %257, i32 0, i32 2
  %259 = load ptr, ptr %258, align 8
  %260 = getelementptr inbounds %struct.node, ptr %259, i32 0, i32 1
  %261 = load ptr, ptr %260, align 8
  %262 = load i64, ptr %11, align 8
  %263 = getelementptr inbounds i64, ptr %261, i64 %262
  store i64 %256, ptr %263, align 8
  br label %264

264:                                              ; preds = %218, %181
  store i64 0, ptr %13, align 8
  br label %265

265:                                              ; preds = %297, %264
  %266 = load i64, ptr %13, align 8
  %267 = load ptr, ptr %9, align 8
  %268 = getelementptr inbounds %struct.node, ptr %267, i32 0, i32 4
  %269 = load i64, ptr %268, align 8
  %270 = sub i64 %269, 1
  %271 = icmp ult i64 %266, %270
  br i1 %271, label %272, label %300

272:                                              ; preds = %265
  %273 = load ptr, ptr %9, align 8
  %274 = getelementptr inbounds %struct.node, ptr %273, i32 0, i32 1
  %275 = load ptr, ptr %274, align 8
  %276 = load i64, ptr %13, align 8
  %277 = add i64 %276, 1
  %278 = getelementptr inbounds i64, ptr %275, i64 %277
  %279 = load i64, ptr %278, align 8
  %280 = load ptr, ptr %9, align 8
  %281 = getelementptr inbounds %struct.node, ptr %280, i32 0, i32 1
  %282 = load ptr, ptr %281, align 8
  %283 = load i64, ptr %13, align 8
  %284 = getelementptr inbounds i64, ptr %282, i64 %283
  store i64 %279, ptr %284, align 8
  %285 = load ptr, ptr %9, align 8
  %286 = getelementptr inbounds %struct.node, ptr %285, i32 0, i32 0
  %287 = load ptr, ptr %286, align 8
  %288 = load i64, ptr %13, align 8
  %289 = add i64 %288, 1
  %290 = getelementptr inbounds ptr, ptr %287, i64 %289
  %291 = load ptr, ptr %290, align 8
  %292 = load ptr, ptr %9, align 8
  %293 = getelementptr inbounds %struct.node, ptr %292, i32 0, i32 0
  %294 = load ptr, ptr %293, align 8
  %295 = load i64, ptr %13, align 8
  %296 = getelementptr inbounds ptr, ptr %294, i64 %295
  store ptr %291, ptr %296, align 8
  br label %297

297:                                              ; preds = %272
  %298 = load i64, ptr %13, align 8
  %299 = add i64 %298, 1
  store i64 %299, ptr %13, align 8
  br label %265, !llvm.loop !52

300:                                              ; preds = %265
  %301 = load ptr, ptr %8, align 8
  %302 = getelementptr inbounds %struct.node, ptr %301, i32 0, i32 3
  %303 = load i8, ptr %302, align 8
  %304 = trunc i8 %303 to i1
  br i1 %304, label %318, label %305

305:                                              ; preds = %300
  %306 = load ptr, ptr %9, align 8
  %307 = getelementptr inbounds %struct.node, ptr %306, i32 0, i32 0
  %308 = load ptr, ptr %307, align 8
  %309 = load i64, ptr %13, align 8
  %310 = add i64 %309, 1
  %311 = getelementptr inbounds ptr, ptr %308, i64 %310
  %312 = load ptr, ptr %311, align 8
  %313 = load ptr, ptr %9, align 8
  %314 = getelementptr inbounds %struct.node, ptr %313, i32 0, i32 0
  %315 = load ptr, ptr %314, align 8
  %316 = load i64, ptr %13, align 8
  %317 = getelementptr inbounds ptr, ptr %315, i64 %316
  store ptr %312, ptr %317, align 8
  br label %318

318:                                              ; preds = %305, %300
  br label %319

319:                                              ; preds = %318, %175
  %320 = load ptr, ptr %8, align 8
  %321 = getelementptr inbounds %struct.node, ptr %320, i32 0, i32 4
  %322 = load i64, ptr %321, align 8
  %323 = add i64 %322, 1
  store i64 %323, ptr %321, align 8
  %324 = load ptr, ptr %9, align 8
  %325 = getelementptr inbounds %struct.node, ptr %324, i32 0, i32 4
  %326 = load i64, ptr %325, align 8
  %327 = add i64 %326, -1
  store i64 %327, ptr %325, align 8
  %328 = load ptr, ptr %7, align 8
  ret ptr %328
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store ptr null, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load i64, ptr %4, align 8
  %9 = call ptr @find(ptr noundef %7, i64 noundef %8, i1 noundef zeroext false, ptr noundef %5)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %22

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %22

15:                                               ; preds = %12
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = load i64, ptr %4, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = call ptr @delete_entry(ptr noundef %16, ptr noundef %17, i64 noundef %18, ptr noundef %19)
  store ptr %20, ptr %3, align 8
  %21 = load ptr, ptr %6, align 8
  call void @free_record(ptr noundef %21)
  br label %22

22:                                               ; preds = %15, %12, %2
  %23 = load ptr, ptr %3, align 8
  ret ptr %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @destroy_tree_nodes(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 3
  %6 = load i8, ptr %5, align 8
  %7 = trunc i8 %6 to i1
  br i1 %7, label %8, label %26

8:                                                ; preds = %1
  store i64 0, ptr %3, align 8
  br label %9

9:                                                ; preds = %22, %8
  %10 = load i64, ptr %3, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 4
  %13 = load i64, ptr %12, align 8
  %14 = icmp ult i64 %10, %13
  br i1 %14, label %15, label %25

15:                                               ; preds = %9
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load i64, ptr %3, align 8
  %20 = getelementptr inbounds ptr, ptr %18, i64 %19
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21) #8
  br label %22

22:                                               ; preds = %15
  %23 = load i64, ptr %3, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr %3, align 8
  br label %9, !llvm.loop !53

25:                                               ; preds = %9
  br label %45

26:                                               ; preds = %1
  store i64 0, ptr %3, align 8
  br label %27

27:                                               ; preds = %41, %26
  %28 = load i64, ptr %3, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 4
  %31 = load i64, ptr %30, align 8
  %32 = add i64 %31, 1
  %33 = icmp ult i64 %28, %32
  br i1 %33, label %34, label %44

34:                                               ; preds = %27
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %3, align 8
  %39 = getelementptr inbounds ptr, ptr %37, i64 %38
  %40 = load ptr, ptr %39, align 8
  call void @destroy_tree_nodes(ptr noundef %40)
  br label %41

41:                                               ; preds = %34
  %42 = load i64, ptr %3, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr %3, align 8
  br label %27, !llvm.loop !54

44:                                               ; preds = %27
  br label %45

45:                                               ; preds = %44, %25
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.node, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  call void @free(ptr noundef %48) #8
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  call void @free(ptr noundef %51) #8
  %52 = load ptr, ptr %2, align 8
  call void @free_node(ptr noundef %52)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @destroy_tree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @destroy_tree_nodes(ptr noundef %3)
  ret ptr null
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @myrand() #0 {
  call void @next()
  %1 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  %2 = shl i64 %1, 15
  %3 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %4 = lshr i64 %3, 1
  %5 = add i64 %2, %4
  ret i64 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @next() #0 {
  %1 = alloca [2 x i64], align 16
  %2 = alloca [2 x i64], align 16
  %3 = alloca [2 x i64], align 16
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = load i64, ptr @a, align 16
  %10 = load i64, ptr @x, align 16
  %11 = mul nsw i64 %9, %10
  %12 = trunc i64 %11 to i32
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = and i32 %13, 65535
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0
  store i64 %15, ptr %16, align 16
  %17 = load i32, ptr %6, align 4
  %18 = ashr i32 %17, 16
  %19 = and i32 %18, 65535
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  store i64 %20, ptr %21, align 8
  %22 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0
  %23 = load i64, ptr %22, align 16
  %24 = trunc i64 %23 to i32
  %25 = sext i32 %24 to i64
  %26 = load i64, ptr @c, align 8
  %27 = add nsw i64 %25, %26
  %28 = icmp sgt i64 %27, 65535
  %29 = zext i1 %28 to i32
  %30 = sext i32 %29 to i64
  store i64 %30, ptr %4, align 8
  %31 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0
  %32 = load i64, ptr %31, align 16
  %33 = load i64, ptr @c, align 8
  %34 = add i64 %32, %33
  %35 = trunc i64 %34 to i32
  %36 = and i32 %35, 65535
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0
  store i64 %37, ptr %38, align 16
  %39 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %40 = load i64, ptr %39, align 8
  %41 = trunc i64 %40 to i32
  %42 = sext i32 %41 to i64
  %43 = load i64, ptr %4, align 8
  %44 = add nsw i64 %42, %43
  %45 = icmp sgt i64 %44, 65535
  %46 = zext i1 %45 to i32
  %47 = sext i32 %46 to i64
  store i64 %47, ptr %5, align 8
  %48 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %49 = load i64, ptr %48, align 8
  %50 = load i64, ptr %4, align 8
  %51 = add i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = and i32 %52, 65535
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  store i64 %54, ptr %55, align 8
  %56 = load i64, ptr @a, align 16
  %57 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %58 = mul nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  store i32 %59, ptr %7, align 4
  %60 = load i32, ptr %7, align 4
  %61 = and i32 %60, 65535
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0
  store i64 %62, ptr %63, align 16
  %64 = load i32, ptr %7, align 4
  %65 = ashr i32 %64, 16
  %66 = and i32 %65, 65535
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  store i64 %67, ptr %68, align 8
  %69 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %70 = load i64, ptr %69, align 8
  %71 = trunc i64 %70 to i32
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0
  %74 = load i64, ptr %73, align 16
  %75 = add nsw i64 %72, %74
  %76 = icmp sgt i64 %75, 65535
  %77 = zext i1 %76 to i32
  %78 = sext i32 %77 to i64
  store i64 %78, ptr %4, align 8
  %79 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %80 = load i64, ptr %79, align 8
  %81 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 0
  %82 = load i64, ptr %81, align 16
  %83 = add i64 %80, %82
  %84 = trunc i64 %83 to i32
  %85 = and i32 %84, 65535
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  store i64 %86, ptr %87, align 8
  %88 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8
  %89 = load i64, ptr @x, align 16
  %90 = mul nsw i64 %88, %89
  %91 = trunc i64 %90 to i32
  store i32 %91, ptr %8, align 4
  %92 = load i32, ptr %8, align 4
  %93 = and i32 %92, 65535
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0
  store i64 %94, ptr %95, align 16
  %96 = load i32, ptr %8, align 4
  %97 = ashr i32 %96, 16
  %98 = and i32 %97, 65535
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  store i64 %99, ptr %100, align 8
  %101 = load i64, ptr %4, align 8
  %102 = load i64, ptr %5, align 8
  %103 = add i64 %101, %102
  %104 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %105 = load i64, ptr %104, align 8
  %106 = trunc i64 %105 to i32
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0
  %109 = load i64, ptr %108, align 16
  %110 = add nsw i64 %107, %109
  %111 = icmp sgt i64 %110, 65535
  %112 = zext i1 %111 to i32
  %113 = sext i32 %112 to i64
  %114 = add i64 %103, %113
  %115 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  %116 = load i64, ptr %115, align 8
  %117 = add i64 %114, %116
  %118 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  %119 = load i64, ptr %118, align 8
  %120 = add i64 %117, %119
  %121 = load i64, ptr @a, align 16
  %122 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  %123 = mul i64 %121, %122
  %124 = add i64 %120, %123
  %125 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8
  %126 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %127 = mul i64 %125, %126
  %128 = add i64 %124, %127
  %129 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16
  %130 = load i64, ptr @x, align 16
  %131 = mul i64 %129, %130
  %132 = add i64 %128, %131
  %133 = trunc i64 %132 to i32
  %134 = and i32 %133, 65535
  %135 = zext i32 %134 to i64
  store i64 %135, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  %136 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %137 = load i64, ptr %136, align 8
  %138 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 0
  %139 = load i64, ptr %138, align 16
  %140 = add i64 %137, %139
  %141 = trunc i64 %140 to i32
  %142 = and i32 %141, 65535
  %143 = zext i32 %142 to i64
  store i64 %143, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %144 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 0
  %145 = load i64, ptr %144, align 16
  %146 = trunc i64 %145 to i32
  %147 = and i32 %146, 65535
  %148 = zext i32 %147 to i64
  store i64 %148, ptr @x, align 16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myrandseed(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i64 13070, ptr @x, align 16
  %3 = load i32, ptr %2, align 4
  %4 = and i32 %3, 65535
  %5 = zext i32 %4 to i64
  store i64 %5, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %6 = load i32, ptr %2, align 4
  %7 = ashr i32 %6, 16
  %8 = and i32 %7, 65535
  %9 = zext i32 %8 to i64
  store i64 %9, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  store i64 58989, ptr @a, align 16
  store i64 57068, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8
  store i64 5, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16
  store i64 11, ptr @c, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @real_main() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca %struct.timeval, align 8
  %15 = alloca %struct.timeval, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  store ptr null, ptr %3, align 8
  store i8 0, ptr @verbose_output, align 1
  call void @myrandseed(i32 noundef -889275714)
  store i64 1548576, ptr %4, align 8
  store i64 1200000000, ptr %5, align 8
  %20 = load i64, ptr %4, align 8
  %21 = mul i64 %20, 64
  store i64 %21, ptr %6, align 8
  %22 = load i64, ptr %6, align 8
  %23 = call ptr @allocate(i64 noundef %22, i64 noundef 2097152)
  store ptr %23, ptr %7, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %0
  %27 = load ptr, ptr @stderr, align 8
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %27, ptr noundef @.str.37)
  call void @exit(i32 noundef 1) #7
  unreachable

29:                                               ; preds = %0
  %30 = load i64, ptr %6, align 8
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.38, i64 noundef %30)
  br label %32

32:                                               ; preds = %29
  store i64 0, ptr %8, align 8
  br label %33

33:                                               ; preds = %50, %32
  %34 = load i64, ptr %8, align 8
  %35 = load i64, ptr %4, align 8
  %36 = icmp ult i64 %34, %35
  br i1 %36, label %37, label %53

37:                                               ; preds = %33
  %38 = load ptr, ptr %7, align 8
  %39 = load i64, ptr %8, align 8
  %40 = getelementptr inbounds %struct.element, ptr %38, i64 %39
  %41 = getelementptr inbounds %struct.element, ptr %40, i32 0, i32 0
  store i64 4, ptr %41, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = load i64, ptr %8, align 8
  %44 = getelementptr inbounds %struct.element, ptr %42, i64 %43
  %45 = getelementptr inbounds %struct.element, ptr %44, i32 0, i32 1
  store i64 0, ptr %45, align 8
  %46 = load ptr, ptr %7, align 8
  %47 = load i64, ptr %8, align 8
  %48 = getelementptr inbounds %struct.element, ptr %46, i64 %47
  %49 = getelementptr inbounds %struct.element, ptr %48, i32 0, i32 2
  store i64 1, ptr %49, align 8
  br label %50

50:                                               ; preds = %37
  %51 = load i64, ptr %8, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr %8, align 8
  br label %33, !llvm.loop !55

53:                                               ; preds = %33
  %54 = load i64, ptr %4, align 8
  store i64 %54, ptr %9, align 8
  br label %55

55:                                               ; preds = %82, %53
  %56 = load i64, ptr %9, align 8
  %57 = icmp ugt i64 %56, 1
  br i1 %57, label %58, label %85

58:                                               ; preds = %55
  %59 = call i64 @myrand()
  %60 = load i64, ptr %9, align 8
  %61 = add i64 %60, 1
  %62 = urem i64 %59, %61
  store i64 %62, ptr %10, align 8
  %63 = load ptr, ptr %7, align 8
  %64 = load i64, ptr %9, align 8
  %65 = getelementptr inbounds %struct.element, ptr %63, i64 %64
  %66 = getelementptr inbounds %struct.element, ptr %65, i32 0, i32 0
  %67 = load i64, ptr %66, align 8
  store i64 %67, ptr %11, align 8
  %68 = load ptr, ptr %7, align 8
  %69 = load i64, ptr %10, align 8
  %70 = getelementptr inbounds %struct.element, ptr %68, i64 %69
  %71 = getelementptr inbounds %struct.element, ptr %70, i32 0, i32 0
  %72 = load i64, ptr %71, align 8
  %73 = load ptr, ptr %7, align 8
  %74 = load i64, ptr %9, align 8
  %75 = getelementptr inbounds %struct.element, ptr %73, i64 %74
  %76 = getelementptr inbounds %struct.element, ptr %75, i32 0, i32 0
  store i64 %72, ptr %76, align 8
  %77 = load i64, ptr %11, align 8
  %78 = load ptr, ptr %7, align 8
  %79 = load i64, ptr %10, align 8
  %80 = getelementptr inbounds %struct.element, ptr %78, i64 %79
  %81 = getelementptr inbounds %struct.element, ptr %80, i32 0, i32 0
  store i64 %77, ptr %81, align 8
  br label %82

82:                                               ; preds = %58
  %83 = load i64, ptr %9, align 8
  %84 = add i64 %83, -1
  store i64 %84, ptr %9, align 8
  br label %55, !llvm.loop !56

85:                                               ; preds = %55
  store i64 0, ptr %12, align 8
  br label %86

86:                                               ; preds = %102, %85
  %87 = load i64, ptr %12, align 8
  %88 = load i64, ptr %4, align 8
  %89 = icmp ult i64 %87, %88
  br i1 %89, label %90, label %105

90:                                               ; preds = %86
  %91 = load ptr, ptr %3, align 8
  %92 = load ptr, ptr %7, align 8
  %93 = load i64, ptr %12, align 8
  %94 = getelementptr inbounds %struct.element, ptr %92, i64 %93
  %95 = getelementptr inbounds %struct.element, ptr %94, i32 0, i32 0
  %96 = load i64, ptr %95, align 8
  %97 = load ptr, ptr %7, align 8
  %98 = load i64, ptr %12, align 8
  %99 = getelementptr inbounds %struct.element, ptr %97, i64 %98
  %100 = ptrtoint ptr %99 to i64
  %101 = call ptr @insert(ptr noundef %91, i64 noundef %96, i64 noundef %100)
  store ptr %101, ptr %3, align 8
  br label %102

102:                                              ; preds = %90
  %103 = load i64, ptr %12, align 8
  %104 = add i64 %103, 1
  store i64 %104, ptr %12, align 8
  br label %86, !llvm.loop !57

105:                                              ; preds = %86
  %106 = load i64, ptr %4, align 8
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.39, i64 noundef %106)
  %108 = load i64, ptr @order, align 8
  %109 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, i64 noundef %108)
  %110 = load i64, ptr @allocator_stat, align 8
  %111 = lshr i64 %110, 20
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.41, i64 noundef %111)
  %113 = call i32 @usleep(i32 noundef 250)
  store i64 0, ptr %13, align 8
  %114 = call i32 @gettimeofday(ptr noundef %14, ptr noundef null) #8
  store i64 0, ptr %16, align 8
  br label %115

115:                                              ; preds = %148, %105
  %116 = load i64, ptr %16, align 8
  %117 = load i64, ptr %5, align 8
  %118 = icmp ult i64 %116, %117
  br i1 %118, label %119, label %151

119:                                              ; preds = %115
  %120 = call i64 @myrand()
  %121 = load i64, ptr %4, align 8
  %122 = mul i64 %121, 2
  %123 = urem i64 %120, %122
  store i64 %123, ptr %17, align 8
  %124 = load ptr, ptr %3, align 8
  %125 = load i64, ptr %17, align 8
  %126 = call ptr @find(ptr noundef %124, i64 noundef %125, i1 noundef zeroext false, ptr noundef null)
  store ptr %126, ptr %18, align 8
  %127 = load ptr, ptr %18, align 8
  %128 = icmp ne ptr %127, null
  br i1 %128, label %129, label %147

129:                                              ; preds = %119
  %130 = load ptr, ptr %18, align 8
  %131 = getelementptr inbounds %struct.record, ptr %130, i32 0, i32 0
  %132 = load i64, ptr %131, align 8
  %133 = inttoptr i64 %132 to ptr
  store ptr %133, ptr %19, align 8
  %134 = load ptr, ptr %18, align 8
  %135 = getelementptr inbounds %struct.record, ptr %134, i32 0, i32 3
  %136 = load i64, ptr %135, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr %135, align 8
  %138 = load ptr, ptr %19, align 8
  %139 = icmp ne ptr %138, null
  br i1 %139, label %140, label %146

140:                                              ; preds = %129
  %141 = load ptr, ptr %19, align 8
  %142 = getelementptr inbounds %struct.element, ptr %141, i32 0, i32 2
  %143 = load i64, ptr %142, align 8
  %144 = load i64, ptr %13, align 8
  %145 = add i64 %144, %143
  store i64 %145, ptr %13, align 8
  br label %146

146:                                              ; preds = %140, %129
  br label %147

147:                                              ; preds = %146, %119
  br label %148

148:                                              ; preds = %147
  %149 = load i64, ptr %16, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr %16, align 8
  br label %115, !llvm.loop !58

151:                                              ; preds = %115
  %152 = call i32 @gettimeofday(ptr noundef %15, ptr noundef null) #8
  %153 = load i64, ptr %13, align 8
  %154 = getelementptr inbounds %struct.timeval, ptr %15, i32 0, i32 0
  %155 = load i64, ptr %154, align 8
  %156 = getelementptr inbounds %struct.timeval, ptr %14, i32 0, i32 0
  %157 = load i64, ptr %156, align 8
  %158 = sub nsw i64 %155, %157
  %159 = call i32 (ptr, ...) @printf(ptr noundef @.str.42, i64 noundef %153, i64 noundef %158)
  %160 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  ret i32 0
}

declare i32 @usleep(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #6

; Function Attrs: nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) #6

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
