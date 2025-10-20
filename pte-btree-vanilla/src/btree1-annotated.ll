; ModuleID = 'btree1.c'
source_filename = "btree1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { ptr, ptr, ptr, i8, i64, i64, ptr }
%struct.record = type { i64, ptr, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.element = type { i64, i64, i64, [40 x i8] }

@allocator_stat = dso_local global i64 0, align 8, !sec !{!"public"}
@order = dso_local global i64 6, align 8, !sec !{!"public"}
@queue = dso_local global ptr null, align 8, !sec !{!"public"}
@verbose_output = dso_local global i8 0, align 1, !sec !{!"public"}
@.str = private unnamed_addr constant [77 x i8] c"bpt version %s -- Copyright (c) 2018  Amittai Aviram http://www.amittai.com\0A\00", align 1, !sec !{!"public"}
@.str.1 = private unnamed_addr constant [7 x i8] c"1.16.1\00", align 1, !sec !{!"public"}
@.str.2 = private unnamed_addr constant [193 x i8] c"This program comes with ABSOLUTELY NO WARRANTY.\0AThis is free software, and you are welcome to redistribute it\0Aunder certain conditions.\0APlease see the headnote in the source code for details.\0A\00", align 1, !sec !{!"public"}
@.str.3 = private unnamed_addr constant [23 x i8] c"B+ Tree of Order %ld.\0A\00", align 1, !sec !{!"public"}
@.str.4 = private unnamed_addr constant [182 x i8] c"Following Silberschatz, Korth, Sidarshan, Database Concepts, 5th ed.\0A\0ATo build a B+ tree of a different order, start again and enter the order\0Aas an integer argument:  bpt <order>  \00", align 1, !sec !{!"public"}
@.str.5 = private unnamed_addr constant [22 x i8] c"(%d <= order <= %d).\0A\00", align 1, !sec !{!"public"}
@.str.6 = private unnamed_addr constant [149 x i8] c"To start with input from a file of newline-delimited integers, \0Astart again and enter the order followed by the filename:\0Abpt <order> <inputfile> .\0A\00", align 1, !sec !{!"public"}
@.str.7 = private unnamed_addr constant [776 x i8] c"Enter any of the following commands after the prompt > :\0A\09i <k>  -- Insert <k> (an integer) as both key and value).\0A\09i <k> <v> -- Insert the value <v> (an integer) as the value of key <k> (an integer).\0A\09f <k>  -- Find the value under key <k>.\0A\09p <k> -- Pruint64_t the path from the root to key k and its associated value.\0A\09r <k1> <k2> -- Pruint64_t the keys and values found in the range [<k1>, <k2>\0A\09d <k>  -- Delete key <k> and its associated value.\0A\09x -- Destroy the whole tree.  Start again with an empty tree of the same order.\0A\09t -- Pruint64_t the B+ tree.\0A\09l -- Pruint64_t the keys of the leaves (bottom row of the tree).\0A\09v -- Toggle output of pointer addresses (\22verbose\22) in tree and leaves.\0A\09q -- Quit. (Or use Ctl-D or Ctl-C.)\0A\09? -- Pruint64_t this help message.\0A\00", align 1, !sec !{!"public"}
@.str.8 = private unnamed_addr constant [24 x i8] c"Usage: ./bpt [<order>]\0A\00", align 1, !sec !{!"public"}
@.str.9 = private unnamed_addr constant [28 x i8] c"\09where %d <= order <= %d .\0A\00", align 1, !sec !{!"public"}
@.str.10 = private unnamed_addr constant [13 x i8] c"Empty tree.\0A\00", align 1, !sec !{!"public"}
@.str.11 = private unnamed_addr constant [4 x i8] c"%p \00", align 1, !sec !{!"public"}
@.str.12 = private unnamed_addr constant [5 x i8] c"%ld \00", align 1, !sec !{!"public"}
@.str.13 = private unnamed_addr constant [4 x i8] c" | \00", align 1, !sec !{!"public"}
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !sec !{!"public"}
@.str.15 = private unnamed_addr constant [5 x i8] c"(%p)\00", align 1, !sec !{!"public"}
@.str.16 = private unnamed_addr constant [3 x i8] c"| \00", align 1, !sec !{!"public"}
@.str.17 = private unnamed_addr constant [33 x i8] c"Record not found under key %ld.\0A\00", align 1, !sec !{!"public"}
@.str.18 = private unnamed_addr constant [37 x i8] c"Record at %p -- key %ld, value %ld.\0A\00", align 1, !sec !{!"public"}
@.str.19 = private unnamed_addr constant [13 x i8] c"None found.\0A\00", align 1, !sec !{!"public"}
@.str.20 = private unnamed_addr constant [37 x i8] c"Key: %ld   Location: %p  Value: %ld\0A\00", align 1, !sec !{!"public"}
@.str.21 = private unnamed_addr constant [2 x i8] c"[\00", align 1, !sec !{!"public"}
@.str.22 = private unnamed_addr constant [6 x i8] c"%ld] \00", align 1, !sec !{!"public"}
@.str.23 = private unnamed_addr constant [8 x i8] c"%ld ->\0A\00", align 1, !sec !{!"public"}
@.str.24 = private unnamed_addr constant [7 x i8] c"Leaf [\00", align 1, !sec !{!"public"}
@.str.25 = private unnamed_addr constant [9 x i8] c"%ld] ->\0A\00", align 1, !sec !{!"public"}
@free_nodes = dso_local global ptr null, align 8, !sec !{!"public"}
@stderr = external global ptr, align 8, !sec !{!"public"}
@.str.26 = private unnamed_addr constant [30 x i8] c"Failed to allocate memory...\0A\00", align 1, !sec !{!"public"}
@free_recs = dso_local global ptr null, align 8, !sec !{!"public"}
@.str.27 = private unnamed_addr constant [17 x i8] c"Record creation.\00", align 1, !sec !{!"public"}
@.str.28 = private unnamed_addr constant [15 x i8] c"Node creation.\00", align 1, !sec !{!"public"}
@.str.29 = private unnamed_addr constant [21 x i8] c"New node keys array.\00", align 1, !sec !{!"public"}
@.str.30 = private unnamed_addr constant [25 x i8] c"New node pointers array.\00", align 1, !sec !{!"public"}
@.str.31 = private unnamed_addr constant [22 x i8] c"Temporary keys array.\00", align 1, !sec !{!"public"}
@.str.32 = private unnamed_addr constant [26 x i8] c"Temporary pointers array.\00", align 1, !sec !{!"public"}
@.str.33 = private unnamed_addr constant [46 x i8] c"Temporary pointers array for splitting nodes.\00", align 1, !sec !{!"public"}
@.str.34 = private unnamed_addr constant [42 x i8] c"Temporary keys array for splitting nodes.\00", align 1, !sec !{!"public"}
@.str.35 = private unnamed_addr constant [51 x i8] c"Search for nonexistent pointer to node in parent.\0A\00", align 1, !sec !{!"public"}
@.str.36 = private unnamed_addr constant [13 x i8] c"Node:  %#lx\0A\00", align 1, !sec !{!"public"}
@x = internal global [3 x i64] [i64 13070, i64 43981, i64 4660], align 16, !sec !{!"public"}
@a = internal global [3 x i64] [i64 58989, i64 57068, i64 5], align 16, !sec !{!"public"}
@c = internal global i64 11, align 8, !sec !{!"public"}
@.str.37 = private unnamed_addr constant [28 x i8] c"Failed to allocate memory.\0A\00", align 1, !sec !{!"public"}
@.str.38 = private unnamed_addr constant [15 x i8] c"Allocated %ld\0A\00", align 1, !sec !{!"public"}
@.str.39 = private unnamed_addr constant [21 x i8] c"BTree Elements: %zu\0A\00", align 1, !sec !{!"public"}
@.str.40 = private unnamed_addr constant [19 x i8] c"Btree Fanout: %zu\0A\00", align 1, !sec !{!"public"}
@.str.41 = private unnamed_addr constant [19 x i8] c"Allocator: %zu MB\0A\00", align 1, !sec !{!"public"}
@.str.42 = private unnamed_addr constant [32 x i8] c"got %zu matches in %zu seconds\0A\00", align 1, !sec !{!"public"}
@.str.43 = private unnamed_addr constant [17 x i8] c"Experiment DONE\0A\00", align 1, !sec !{!"public"}
@.str.44 = private unnamed_addr constant [8 x i8] c"ENOMEM\0A\00", align 1, !sec !{!"public"}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @license_notice() #0 !sec !{!"void", !"public", !{}} {
entry:		; !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef @.str.1), !sec !{!"call", !"public", !{!"public", !"public"}}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_1() #0 !sec !{!"void", !"public", !{}} {
entry:		; !sec !{!"public"}
  %0 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %0), !sec !{!"call", !"public", !{!"public", !"public"}}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !sec !{!"call", !"public", !{!"public"}}
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 3, i32 noundef 20), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_2() #0 !sec !{!"void", !"public", !{}} {
entry:		; !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.7), !sec !{!"call", !"public", !{!"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @usage_3() #0 !sec !{!"void", !"public", !{}}  {
entry:		; !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !sec !{!"call", !"public", !{!"public"}}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef 3, i32 noundef 20), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enqueue(ptr noundef %new_node) #0 !sec !{!"void", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %new_node.addr = alloca ptr, align 8, !sec !{!"public"}
  %c = alloca ptr, align 8, !sec !{!"public"}
  store ptr %new_node, ptr %new_node.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load ptr, ptr %new_node.addr, align 8, !sec !{!"public", !"public"}
  store ptr %1, ptr @queue, align 8
  %2 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %next = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %next, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.else:                                          ; preds = %entry, !sec !{!"public"}
  %3 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  store ptr %3, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else, !sec !{!"public"}
  %4 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %next1 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load ptr, ptr %next1, align 8, !sec !{!"public", !"public"}
  %cmp2 = icmp ne ptr %5, null, !sec !{!"public"}
  br i1 %cmp2, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  %6 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %next3 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load ptr, ptr %next3, align 8, !sec !{!"public", !"public"}
  store ptr %7, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond, !sec !{!"public"}
  %8 = load ptr, ptr %new_node.addr, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %next4 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %8, ptr %next4, align 8, !sec !{!"public", !"public"}
  %10 = load ptr, ptr %new_node.addr, align 8, !sec !{!"public", !"public"}
  %next5 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %next5, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then, !sec !{!"public"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @dequeue() #0 !sec !{!"public", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %n = alloca ptr, align 8, !sec !{!"public"}
  %0 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  store ptr %0, ptr %n, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %next = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load ptr, ptr %next, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr @queue, align 8
  %3 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %next1 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %next1, align 8, !sec !{!"public", !"public"}
  %4 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  ret ptr %4, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_leaves(ptr noundef %root) #0 !sec !{!"void", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %c = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %1 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %1, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end, !sec !{!"public"}
  %2 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %3 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %3 to i1, !sec !{!"public"}
  %lnot = xor i1 %tobool, true, !sec !{!"public"}
  br i1 %lnot, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  %4 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %5, i64 0, !sec !{!"public", !"public", !"public"}
  %6 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  store ptr %6, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond, !sec !{!"public"}
  br label %while.body2

while.body2:                                      ; preds = %while.end, %if.end27, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body2, !sec !{!"public"}
  %7 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %9 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ult i64 %7, %9, !sec !{!"public"}
  br i1 %cmp3, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %10 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %tobool4 = trunc i8 %10 to i1, !sec !{!"public"}
  br i1 %tobool4, label %if.then5, label %if.end9, !sec !{!"public"}

if.then5:                                         ; preds = %for.body, !sec !{!"public"}
  %11 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers6 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %12 = load ptr, ptr %pointers6, align 8, !sec !{!"public", !"public"}
  %13 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx7 = getelementptr inbounds ptr, ptr %12, i64 %13, !sec !{!"public", !"public", !"public"}
  %14 = load ptr, ptr %arrayidx7, align 8, !sec !{!"public", !"public"}
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %14), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end9

if.end9:                                          ; preds = %if.then5, %for.body, !sec !{!"public"}
  %15 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %16 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx10 = getelementptr inbounds i64, ptr %16, i64 %17, !sec !{!"public", !"public", !"public"}
  %18 = load i64, ptr %arrayidx10, align 8, !sec !{!"public", !"public"}
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %18), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %for.inc

for.inc:                                          ; preds = %if.end9, !sec !{!"public"}
  %19 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %19, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %20 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %tobool12 = trunc i8 %20 to i1, !sec !{!"public"}
  br i1 %tobool12, label %if.then13, label %if.end17, !sec !{!"public"}

if.then13:                                        ; preds = %for.end, !sec !{!"public"}
  %21 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers14 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load ptr, ptr %pointers14, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %23, 1, !sec !{!"public"}
  %arrayidx15 = getelementptr inbounds ptr, ptr %22, i64 %sub, !sec !{!"public", !"public", !"public"}
  %24 = load ptr, ptr %arrayidx15, align 8, !sec !{!"public", !"public"}
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %24), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %for.end, !sec !{!"public"}
  %25 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers18 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %26 = load ptr, ptr %pointers18, align 8, !sec !{!"public", !"public"}
  %27 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub19 = sub i64 %27, 1, !sec !{!"public"}
  %arrayidx20 = getelementptr inbounds ptr, ptr %26, i64 %sub19, !sec !{!"public", !"public", !"public"}
  %28 = load ptr, ptr %arrayidx20, align 8, !sec !{!"public", !"public"}
  %cmp21 = icmp ne ptr %28, null, !sec !{!"public"}
  br i1 %cmp21, label %if.then22, label %if.else, !sec !{!"public"}

if.then22:                                        ; preds = %if.end17, !sec !{!"public"}
  %call23 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !sec !{!"call", !"public", !{!"public"}}
  %29 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers24 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %30 = load ptr, ptr %pointers24, align 8, !sec !{!"public", !"public"}
  %31 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub25 = sub i64 %31, 1, !sec !{!"public"}
  %arrayidx26 = getelementptr inbounds ptr, ptr %30, i64 %sub25, !sec !{!"public", !"public", !"public"}
  %32 = load ptr, ptr %arrayidx26, align 8, !sec !{!"public", !"public"}
  store ptr %32, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %if.end27

if.else:                                          ; preds = %if.end17, !sec !{!"public"}
  br label %while.end28

if.end27:                                         ; preds = %if.then22, !sec !{!"public"}
  br label %while.body2

while.end28:                                      ; preds = %if.else, !sec !{!"public"}
  %call29 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %return

return:                                           ; preds = %while.end28, %if.then, !sec !{!"public"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @height(ptr noundef %root) #0 !sec !{!"private", !"private", !{!"private"}} {
entry:		; !sec !{!"private"}
  %root.addr = alloca ptr, align 8, !sec !{!"private"}
  %h = alloca i64, align 8, !sec !{!"private"}
  %c = alloca ptr, align 8, !sec !{!"private"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %h, align 8, !sec !{!"private", !"private"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  store ptr %0, ptr %c, align 8, !sec !{!"private", !"private"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry, !sec !{!"private"}
  %1 = load ptr, ptr %c, align 8, !sec !{!"private", !"private"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 3, !sec !{!"private", !"private", !"public", !"public"}
  %2 = load i8, ptr %is_leaf, align 8, !sec !{!"private", !"private"}
  %tobool = trunc i8 %2 to i1, !sec !{!"private"}
  %lnot = xor i1 %tobool, true, !sec !{!"private"}
  br i1 %lnot, label %while.body, label %while.end, !sec !{!"private"}

while.body:                                       ; preds = %while.cond, !sec !{!"private"}
  %3 = load ptr, ptr %c, align 8, !sec !{!"private", !"private"}
  %pointers = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %4 = load ptr, ptr %pointers, align 8, !sec !{!"private", !"private"}
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 0, !sec !{!"private", !"private", !"public"}
  %5 = load ptr, ptr %arrayidx, align 8, !sec !{!"private", !"private"}
  store ptr %5, ptr %c, align 8, !sec !{!"private", !"private"}
  %6 = load i64, ptr %h, align 8, !sec !{!"private", !"private"}
  %inc = add i64 %6, 1, !sec !{!"private"}
  store i64 %inc, ptr %h, align 8, !sec !{!"private", !"private"}
  br label %while.cond, !llvm.loop !10

while.end:                                        ; preds = %while.cond, !sec !{!"private"}
  %7 = load i64, ptr %h, align 8, !sec !{!"private", !"private"}
  ret i64 %7, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @path_to_root(ptr noundef %root, ptr noundef %child) #0 !sec !{!"public", !"public", !{!"public", !"public", !"private", !"private", !"private", !"private", !"private"}} {
entry:		; !sec !{!"private"}
  %root.addr = alloca ptr, align 8, !sec !{!"private"}
  %child.addr = alloca ptr, align 8, !sec !{!"private"}
  %length = alloca i64, align 8, !sec !{!"private"}
  %c = alloca ptr, align 8, !sec !{!"private"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  store ptr %child, ptr %child.addr, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %length, align 8, !sec !{!"private", !"private"}
  %0 = load ptr, ptr %child.addr, align 8, !sec !{!"private", !"private"}
  store ptr %0, ptr %c, align 8, !sec !{!"private", !"private"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry, !sec !{!"private"}
  %1 = load ptr, ptr %c, align 8, !sec !{!"private", !"private"}
  %2 = load ptr, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  %cmp = icmp ne ptr %1, %2, !sec !{!"private"}
  br i1 %cmp, label %while.body, label %while.end, !sec !{!"private"}

while.body:                                       ; preds = %while.cond, !sec !{!"private"}
  %3 = load ptr, ptr %c, align 8, !sec !{!"private", !"private"}
  %parent = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %4 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  store ptr %4, ptr %c, align 8, !sec !{!"private", !"private"}
  %5 = load i64, ptr %length, align 8, !sec !{!"private", !"private"}
  %inc = add i64 %5, 1, !sec !{!"private"}
  store i64 %inc, ptr %length, align 8, !sec !{!"private", !"private"}
  br label %while.cond, !llvm.loop !11

while.end:                                        ; preds = %while.cond, !sec !{!"private"}
  %6 = load i64, ptr %length, align 8, !sec !{!"private", !"private"}
  ret i64 %6, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_tree(ptr noundef %root) #0 #0 !sec !{!"void", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %n = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %rank = alloca i64, align 8, !sec !{!"public"}
  %new_rank = alloca i64, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %n, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %rank, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %new_rank, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  store ptr null, ptr @queue, align 8
  %1 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  call void @enqueue(ptr noundef %1), !sec !{!"call", !"void", !{!"public"}}
  br label %while.cond

while.cond:                                       ; preds = %if.end50, %if.end, !sec !{!"public"}
  %2 = load ptr, ptr @queue, align 8, !sec !{!"public", !"public"}
  %cmp1 = icmp ne ptr %2, null, !sec !{!"public"}
  br i1 %cmp1, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  %call2 = call ptr @dequeue(), !sec !{!"call", !"public", !{}}
  store ptr %call2, ptr %n, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load ptr, ptr %parent, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ne ptr %4, null, !sec !{!"public"}
  br i1 %cmp3, label %land.lhs.true, label %if.end12, !sec !{!"public"}

land.lhs.true:                                    ; preds = %while.body, !sec !{!"public"}
  %5 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %6 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %parent4 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load ptr, ptr %parent4, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %8, i64 0, !sec !{!"public", !"public", !"public"}
  %9 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %cmp5 = icmp eq ptr %5, %9, !sec !{!"public"}
  br i1 %cmp5, label %if.then6, label %if.end12, !sec !{!"public"}

if.then6:                                         ; preds = %land.lhs.true, !sec !{!"public"}
  %10 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %call7 = call i64 @path_to_root(ptr noundef %10, ptr noundef %11), !sec !{!"call", !"public", !{!"public", !"public"}}
  store i64 %call7, ptr %new_rank, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %new_rank, align 8, !sec !{!"public", !"public"}
  %13 = load i64, ptr %rank, align 8, !sec !{!"public", !"public"}
  %cmp8 = icmp ne i64 %12, %13, !sec !{!"public"}
  br i1 %cmp8, label %if.then9, label %if.end11, !sec !{!"public"}

if.then9:                                         ; preds = %if.then6, !sec !{!"public"}
  %14 = load i64, ptr %new_rank, align 8, !sec !{!"public", !"public"}
  store i64 %14, ptr %rank, align 8, !sec !{!"public", !"public"}
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.then6, !sec !{!"public"}
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %land.lhs.true, %while.body, !sec !{!"public"}
  %15 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %tobool = trunc i8 %15 to i1, !sec !{!"public"}
  br i1 %tobool, label %if.then13, label %if.end15, !sec !{!"public"}

if.then13:                                        ; preds = %if.end12, !sec !{!"public"}
  %16 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %16), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end12, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end15, !sec !{!"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %18 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp16 = icmp ult i64 %17, %19, !sec !{!"public"}
  br i1 %cmp16, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %20 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %tobool17 = trunc i8 %20 to i1, !sec !{!"public"}
  br i1 %tobool17, label %if.then18, label %if.end22, !sec !{!"public"}

if.then18:                                        ; preds = %for.body, !sec !{!"public"}
  %21 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers19 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load ptr, ptr %pointers19, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx20 = getelementptr inbounds ptr, ptr %22, i64 %23, !sec !{!"public", !"public", !"public"}
  %24 = load ptr, ptr %arrayidx20, align 8, !sec !{!"public", !"public"}
  %call21 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %24), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end22

if.end22:                                         ; preds = %if.then18, %for.body, !sec !{!"public"}
  %25 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %26 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %27 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx23 = getelementptr inbounds i64, ptr %26, i64 %27, !sec !{!"public", !"public", !"public"}
  %28 = load i64, ptr %arrayidx23, align 8, !sec !{!"public", !"public"}
  %call24 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %28), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %for.inc

for.inc:                                          ; preds = %if.end22, !sec !{!"public"}
  %29 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %29, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %30 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool25 = trunc i8 %31 to i1, !sec !{!"public"}
  br i1 %tobool25, label %if.end36, label %if.then26, !sec !{!"public"}

if.then26:                                        ; preds = %for.end, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc33, %if.then26, !sec !{!"public"}
  %32 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %33 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys28 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load i64, ptr %num_keys28, align 8, !sec !{!"public", !"public"}
  %cmp29 = icmp ule i64 %32, %34, !sec !{!"public"}
  br i1 %cmp29, label %for.body30, label %for.end35, !sec !{!"public"}

for.body30:                                       ; preds = %for.cond27, !sec !{!"public"}
  %35 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers31 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %36 = load ptr, ptr %pointers31, align 8, !sec !{!"public", !"public"}
  %37 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx32 = getelementptr inbounds ptr, ptr %36, i64 %37, !sec !{!"public", !"public", !"public"}
  %38 = load ptr, ptr %arrayidx32, align 8, !sec !{!"public", !"public"}
  call void @enqueue(ptr noundef %38), !sec !{!"call", !"void", !{!"public"}}
  br label %for.inc33

for.inc33:                                        ; preds = %for.body30, !sec !{!"public"}
  %39 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc34 = add i64 %39, 1, !sec !{!"public"}
  store i64 %inc34, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond27, !llvm.loop !13

for.end35:                                        ; preds = %for.cond27, !sec !{!"public"}
  br label %if.end36

if.end36:                                         ; preds = %for.end35, %for.end, !sec !{!"public"}
  %40 = load i8, ptr @verbose_output, align 1, !sec !{!"public", !"public"}
  %tobool37 = trunc i8 %40 to i1, !sec !{!"public"}
  br i1 %tobool37, label %if.then38, label %if.end50, !sec !{!"public"}

if.then38:                                        ; preds = %if.end36, !sec !{!"public"}
  %41 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %is_leaf39 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %42 = load i8, ptr %is_leaf39, align 8, !sec !{!"public", !"public"}
  %tobool40 = trunc i8 %42 to i1, !sec !{!"public"}
  br i1 %tobool40, label %if.then41, label %if.else, !sec !{!"public"}

if.then41:                                        ; preds = %if.then38, !sec !{!"public"}
  %43 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers42 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %44 = load ptr, ptr %pointers42, align 8, !sec !{!"public", !"public"}
  %45 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %45, 1, !sec !{!"public"}
  %arrayidx43 = getelementptr inbounds ptr, ptr %44, i64 %sub, !sec !{!"public", !"public", !"public"}
  %46 = load ptr, ptr %arrayidx43, align 8, !sec !{!"public", !"public"}
  %call44 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %46), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end49

if.else:                                          ; preds = %if.then38, !sec !{!"public"}
  %47 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers45 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %48 = load ptr, ptr %pointers45, align 8, !sec !{!"public", !"public"}
  %49 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys46 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %50 = load i64, ptr %num_keys46, align 8, !sec !{!"public", !"public"}
  %arrayidx47 = getelementptr inbounds ptr, ptr %48, i64 %50, !sec !{!"public", !"public", !"public"}
  %51 = load ptr, ptr %arrayidx47, align 8, !sec !{!"public", !"public"}
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %51), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end49

if.end49:                                         ; preds = %if.else, %if.then41, !sec !{!"public"}
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.end36, !sec !{!"public"}
  %call51 = call i32 (ptr, ...) @printf(ptr noundef @.str.16), !sec !{!"call", !"public", !{!"public"}}
  br label %while.cond, !llvm.loop !14

while.end:                                        ; preds = %while.cond, !sec !{!"public"}
  %call52 = call i32 (ptr, ...) @printf(ptr noundef @.str.14), !sec !{!"call", !"public", !{!"public"}}
  br label %return

return:                                           ; preds = %while.end, %if.then, !sec !{!"public"}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print(ptr noundef %root, i64 noundef %key, i1 noundef zeroext %verbose) #0 !sec !{!"void", !"public", !{!"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %verbose.addr = alloca i8, align 1, !sec !{!"public"}
  %r = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %frombool = zext i1 %verbose to i8, !sec !{!"public"}
  store i8 %frombool, ptr %verbose.addr, align 1, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"public"}
  %2 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"public"}
  %tobool = trunc i8 %2 to i1, !sec !{!"private"}
  %call = call ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %tobool, ptr noundef null), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"public"}}
  store ptr %call, ptr %r, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %3, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %4 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i64 noundef %4), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end

if.else:                                          ; preds = %entry, !sec !{!"public"}
  %5 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %value = getelementptr inbounds %struct.record, ptr %7, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load i64, ptr %value, align 8, !sec !{!"private", !"public"}
  %d8 = call i64 @declassify.i64(i64 noundef %8), !sec !{!"declassify", !"private", !"public"}
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %5, i64 noundef %6, i64 noundef %d8), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then, !sec !{!"public"}
  ret void
}

define dso_local ptr @declassify.ptr(ptr noundef %0) #0 !sec !{!"public", !"public", !{!"private"}} {
  ret ptr %0, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find(ptr noundef %root, i64 noundef %key, i1 noundef zeroext %verbose, ptr noundef %leaf_out) #0 !sec !{!"public", !"public", !{!"public", !"private", !"private", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"private"}
  %verbose.addr = alloca i8, align 1, !sec !{!"private"}
  %leaf_out.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %leaf = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %frombool = zext i1 %verbose to i8, !sec !{!"private"}
  store i8 %frombool, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  store ptr %leaf_out, ptr %leaf_out.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end3, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load ptr, ptr %leaf_out.addr, align 8, !sec !{!"public", !"public"}
  %cmp1 = icmp ne ptr %1, null, !sec !{!"public"}
  br i1 %cmp1, label %if.then2, label %if.end, !sec !{!"public"}

if.then2:                                         ; preds = %if.then, !sec !{!"public"}
  %2 = load ptr, ptr %leaf_out.addr, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %2, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then, !sec !{!"public"}
  store ptr null, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end3:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %4 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %5 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %tobool = trunc i8 %5 to i1, !sec !{!"private"}
  %call = call ptr @find_leaf(ptr noundef %3, i64 noundef %4, i1 noundef zeroext %tobool), !sec !{!"call", !"public", !{!"public", !"private", !"private"}}
  store ptr %call, ptr %leaf, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3, !sec !{!"public"}
  %6 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp4 = icmp ult i64 %6, %8, !sec !{!"public"}
  br i1 %cmp4, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %9 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %10 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %10, i64 %11, !sec !{!"public", !"public", !"public"}
  %12 = load i64, ptr %arrayidx, align 8, !sec !{!"private", !"public"}
  %13 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %cmp5 = icmp eq i64 %12, %13, !sec !{!"private"}
  br i1 %cmp5, label %if.then6, label %if.end7, !sec !{!"private"}

if.then6:                                         ; preds = %for.body, !sec !{!"public"}
  br label %for.end

if.end7:                                          ; preds = %for.body, !sec !{!"public"}
  br label %for.inc

for.inc:                                          ; preds = %if.end7, !sec !{!"public"}
  %14 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %14, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !15

for.end:                                          ; preds = %if.then6, %for.cond, !sec !{!"public"}
  %15 = load ptr, ptr %leaf_out.addr, align 8, !sec !{!"public", !"public"}
  %cmp8 = icmp ne ptr %15, null, !sec !{!"public"}
  br i1 %cmp8, label %if.then9, label %if.end10, !sec !{!"public"}

if.then9:                                         ; preds = %for.end, !sec !{!"public"}
  %16 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %17 = load ptr, ptr %leaf_out.addr, align 8, !sec !{!"public", !"public"}
  store ptr %16, ptr %17, align 8, !sec !{!"public", !"public"}
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %for.end, !sec !{!"public"}
  %18 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %num_keys11 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load i64, ptr %num_keys11, align 8, !sec !{!"public", !"public"}
  %cmp12 = icmp eq i64 %18, %20, !sec !{!"public"}
  br i1 %cmp12, label %if.then13, label %if.else, !sec !{!"public"}

if.then13:                                        ; preds = %if.end10, !sec !{!"public"}
  store ptr null, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.else:                                          ; preds = %if.end10, !sec !{!"public"}
  %21 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx14 = getelementptr inbounds ptr, ptr %22, i64 %23, !sec !{!"public", !"public", !"public"}
  %24 = load ptr, ptr %arrayidx14, align 8, !sec !{!"public", !"public"}
  store ptr %24, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.else, %if.then13, %if.end, !sec !{!"public"}
  %25 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %25, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @find_and_print_range(ptr noundef %root, i64 noundef %key_start, i64 noundef %key_end, i1 noundef zeroext %verbose) #0 !sec !{!"void", !"public", !{!"private", !"private", !"private", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"private"}
  %key_start.addr = alloca i64, align 8, !sec !{!"private"}
  %key_end.addr = alloca i64, align 8, !sec !{!"private"}
  %verbose.addr = alloca i8, align 1, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %array_size = alloca i64, align 8, !sec !{!"private"}
  %saved_stack = alloca ptr, align 8, !sec !{!"public"}
  %__vla_expr0 = alloca i64, align 8, !sec !{!"private"}
  %__vla_expr1 = alloca i64, align 8, !sec !{!"private"}
  %num_found = alloca i64, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  store i64 %key_start, ptr %key_start.addr, align 8, !sec !{!"private", !"private"}
  store i64 %key_end, ptr %key_end.addr, align 8, !sec !{!"private", !"private"}
  %frombool = zext i1 %verbose to i8, !sec !{!"public"}
  store i8 %frombool, ptr %verbose.addr, align 1, !sec !{!"public", !"public"}
  %0 = load i64, ptr %key_end.addr, align 8, !sec !{!"private", !"private"}
  %1 = load i64, ptr %key_start.addr, align 8, !sec !{!"private", !"private"}
  %sub = sub i64 %0, %1, !sec !{!"private"}
  %add = add i64 %sub, 1, !sec !{!"private"}
  store i64 %add, ptr %array_size, align 8, !sec !{!"private", !"private"}
  %2 = load i64, ptr %array_size, align 8, !sec !{!"private", !"private"}
  %3 = call ptr @llvm.stacksave.p0(), !sec !{!"call", !"public", !{}}
  store ptr %3, ptr %saved_stack, align 8, !sec !{!"public", !"public"}
  %vla = alloca i64, i64 %2, align 16, !sec !{!"public"}
  store i64 %2, ptr %__vla_expr0, align 8, !sec !{!"private", !"private"}
  %4 = load i64, ptr %array_size, align 8, !sec !{!"private", !"private"}
  %vla1 = alloca ptr, i64 %4, align 16, !sec !{!"private"}
  store i64 %4, ptr %__vla_expr1, align 8, !sec !{!"private", !"private"}
  %5 = load ptr, ptr %root.addr, align 8, !sec !{!"private", !"private"}
  %6 = load i64, ptr %key_start.addr, align 8, !sec !{!"private", !"private"}
  %7 = load i64, ptr %key_end.addr, align 8, !sec !{!"private", !"private"}
  %8 = load i8, ptr %verbose.addr, align 1, !sec !{!"public", !"public"}
  %tobool = trunc i8 %8 to i1, !sec !{!"public"}
  %call = call i64 @find_range(ptr noundef %5, i64 noundef %6, i64 noundef %7, i1 noundef zeroext %tobool, ptr noundef %vla, ptr noundef %vla1), !sec !{!"call", !"public", !{!"private", !"private", !"private", !"public", !"public", !"private"}}
  store i64 %call, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %9 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %tobool2 = icmp ne i64 %9, 0, !sec !{!"public"}
  br i1 %tobool2, label %if.else, label %if.then, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.19), !sec !{!"call", !"public", !{!"public"}}
  br label %if.end

if.else:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else, !sec !{!"public"}
  %10 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ult i64 %10, %11, !sec !{!"public"}
  br i1 %cmp, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %vla, i64 %12, !sec !{!"public", !"public", !"public"}
  %13 = load i64, ptr %arrayidx, align 8, !sec !{!"private", !"public"}
  %d13 = call i64 @declassify.i64(i64 noundef %13), !sec !{!"declassify", !"private", !"public"}
  %14 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx4 = getelementptr inbounds ptr, ptr %vla1, i64 %14, !sec !{!"private", !"private", !"public"}
  %15 = load ptr, ptr %arrayidx4, align 8, !sec !{!"private", !"private"}
  %d15 = call ptr @declassify.ptr(ptr noundef %15), !sec !{!"declassify", !"private", !"public"}
  %16 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx5 = getelementptr inbounds ptr, ptr %vla1, i64 %16, !sec !{!"private", !"private", !"public"}
  %17 = load ptr, ptr %arrayidx5, align 8, !sec !{!"private", !"private"}
  %value = getelementptr inbounds %struct.record, ptr %17, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %18 = load i64, ptr %value, align 8, !sec !{!"private", !"private"}
  %d18 = call i64 @declassify.i64(i64 noundef %18), !sec !{!"declassify", !"private", !"public"}
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i64 noundef %d13, ptr noundef %d15, i64 noundef %d18), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %19 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %19, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !16

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then, !sec !{!"public"}
  %20 = load ptr, ptr %saved_stack, align 8, !sec !{!"public", !"public"}
  call void @llvm.stackrestore.p0(ptr %20), !sec !{!"call", !"void", !{!"public"}}
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"public", !"public", !{}} ptr @llvm.stacksave.p0() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @find_range(ptr noundef %root, i64 noundef %key_start, i64 noundef %key_end, i1 noundef zeroext %verbose, ptr noundef %returned_keys, ptr noundef %returned_pointers) #0 !sec !{!"public", !"public", !{!"private", !"private", !"private", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca i64, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key_start.addr = alloca i64, align 8, !sec !{!"public"}
  %key_end.addr = alloca i64, align 8, !sec !{!"public"}
  %verbose.addr = alloca i8, align 1, !sec !{!"public"}
  %returned_keys.addr = alloca ptr, align 8, !sec !{!"public"}
  %returned_pointers.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %num_found = alloca i64, align 8, !sec !{!"public"}
  %n = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key_start, ptr %key_start.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key_end, ptr %key_end.addr, align 8, !sec !{!"public", !"public"}
  %frombool = zext i1 %verbose to i8, !sec !{!"public"}
  store i8 %frombool, ptr %verbose.addr, align 1, !sec !{!"public", !"public"}
  store ptr %returned_keys, ptr %returned_keys.addr, align 8, !sec !{!"public", !"public"}
  store ptr %returned_pointers, ptr %returned_pointers.addr, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %key_start.addr, align 8, !sec !{!"private", !"public"}
  %2 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"public"}
  %tobool = trunc i8 %2 to i1, !sec !{!"private"}
  %call = call ptr @find_leaf(ptr noundef %0, i64 noundef %1, i1 noundef zeroext %tobool), !sec !{!"call", !"public", !{!"public", !"private", !"private"}}
  store ptr %call, ptr %n, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %3, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end, !sec !{!"public"}
  %4 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp1 = icmp ult i64 %4, %6, !sec !{!"public"}
  br i1 %cmp1, label %land.rhs, label %land.end, !sec !{!"public"}

land.rhs:                                         ; preds = %for.cond, !sec !{!"public"}
  %7 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %9 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %8, i64 %9, !sec !{!"public", !"public", !"public"}
  %10 = load i64, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr %key_start.addr, align 8, !sec !{!"public", !"public"}
  %cmp2 = icmp ult i64 %10, %11, !sec !{!"public"}
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond, !sec !{!"public"}
  %12 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !sec !{!"public", !"public", !"public"}
  br i1 %12, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %land.end, !sec !{!"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %13 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %13, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !17

for.end:                                          ; preds = %land.end, !sec !{!"public"}
  %14 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %15 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys3 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %16 = load i64, ptr %num_keys3, align 8, !sec !{!"public", !"public"}
  %cmp4 = icmp eq i64 %14, %16, !sec !{!"public"}
  br i1 %cmp4, label %if.then5, label %if.end6, !sec !{!"public"}

if.then5:                                         ; preds = %for.end, !sec !{!"public"}
  store i64 0, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end6:                                          ; preds = %for.end, !sec !{!"public"}
  br label %while.cond

while.cond:                                       ; preds = %for.end25, %if.end6, !sec !{!"public"}
  %17 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %cmp7 = icmp ne ptr %17, null, !sec !{!"public"}
  br i1 %cmp7, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc23, %while.body, !sec !{!"public"}
  %18 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %num_keys9 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load i64, ptr %num_keys9, align 8, !sec !{!"public", !"public"}
  %cmp10 = icmp ult i64 %18, %20, !sec !{!"public"}
  br i1 %cmp10, label %land.rhs11, label %land.end15, !sec !{!"public"}

land.rhs11:                                       ; preds = %for.cond8, !sec !{!"public"}
  %21 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %keys12 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load ptr, ptr %keys12, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx13 = getelementptr inbounds i64, ptr %22, i64 %23, !sec !{!"public", !"public", !"public"}
  %24 = load i64, ptr %arrayidx13, align 8, !sec !{!"public", !"public"}
  %25 = load i64, ptr %key_end.addr, align 8, !sec !{!"public", !"public"}
  %cmp14 = icmp ule i64 %24, %25, !sec !{!"public"}
  br label %land.end15

land.end15:                                       ; preds = %land.rhs11, %for.cond8, !sec !{!"public"}
  %26 = phi i1 [ false, %for.cond8 ], [ %cmp14, %land.rhs11 ], !sec !{!"public", !"public", !"public"}
  br i1 %26, label %for.body16, label %for.end25, !sec !{!"public"}

for.body16:                                       ; preds = %land.end15, !sec !{!"public"}
  %27 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %keys17 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %28 = load ptr, ptr %keys17, align 8, !sec !{!"public", !"public"}
  %29 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx18 = getelementptr inbounds i64, ptr %28, i64 %29, !sec !{!"public", !"public", !"public"}
  %30 = load i64, ptr %arrayidx18, align 8, !sec !{!"public", !"public"}
  %31 = load ptr, ptr %returned_keys.addr, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %arrayidx19 = getelementptr inbounds i64, ptr %31, i64 %32, !sec !{!"public", !"public", !"public"}
  store i64 %30, ptr %arrayidx19, align 8, !sec !{!"public", !"public"}
  %33 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %35 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx20 = getelementptr inbounds ptr, ptr %34, i64 %35, !sec !{!"public", !"public", !"public"}
  %36 = load ptr, ptr %arrayidx20, align 8, !sec !{!"public", !"public"}
  %37 = load ptr, ptr %returned_pointers.addr, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %arrayidx21 = getelementptr inbounds ptr, ptr %37, i64 %38, !sec !{!"public", !"public", !"public"}
  store ptr %36, ptr %arrayidx21, align 8, !sec !{!"public", !"public"}
  %39 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  %inc22 = add i64 %39, 1, !sec !{!"public"}
  store i64 %inc22, ptr %num_found, align 8, !sec !{!"public", !"public"}
  br label %for.inc23

for.inc23:                                        ; preds = %for.body16, !sec !{!"public"}
  %40 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc24 = add i64 %40, 1, !sec !{!"public"}
  store i64 %inc24, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond8, !llvm.loop !18

for.end25:                                        ; preds = %land.end15, !sec !{!"public"}
  %41 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %pointers26 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %42 = load ptr, ptr %pointers26, align 8, !sec !{!"public", !"public"}
  %43 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %43, 1, !sec !{!"public"}
  %arrayidx27 = getelementptr inbounds ptr, ptr %42, i64 %sub, !sec !{!"public", !"public", !"public"}
  %44 = load ptr, ptr %arrayidx27, align 8, !sec !{!"public", !"public"}
  store ptr %44, ptr %n, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !19

while.end:                                        ; preds = %while.cond, !sec !{!"public"}
  %45 = load i64, ptr %num_found, align 8, !sec !{!"public", !"public"}
  store i64 %45, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %while.end, %if.then5, %if.then, !sec !{!"public"}
  %46 = load i64, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret i64 %46, !sec !{!"public"}
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare !sec !{!"void", !"public", !{!"public"}} void @llvm.stackrestore.p0(ptr) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @find_leaf(ptr noundef %root, i64 noundef %key, i1 noundef zeroext %verbose) #0 !sec !{!"public", !"public", !{!"public", !"private", !"private"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"private"}
  %verbose.addr = alloca i8, align 1, !sec !{!"private"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %c = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %frombool = zext i1 %verbose to i8, !sec !{!"private"}
  store i8 %frombool, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end2, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %tobool = trunc i8 %1 to i1, !sec !{!"private"}
  br i1 %tobool, label %if.then1, label %if.end, !sec !{!"private"}

if.then1:                                         ; preds = %if.then, !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !sec !{!"call", !"public", !{!"public"}}
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then, !sec !{!"public"}
  %2 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end2:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %3, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %if.end26, %if.end2, !sec !{!"public"}
  %4 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool3 = trunc i8 %5 to i1, !sec !{!"public"}
  %lnot = xor i1 %tobool3, true, !sec !{!"public"}
  br i1 %lnot, label %while.body, label %while.end28, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  %6 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %tobool4 = trunc i8 %6 to i1, !sec !{!"private"}
  br i1 %tobool4, label %if.then5, label %if.end12, !sec !{!"private"}

if.then5:                                         ; preds = %while.body, !sec !{!"public"}
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.21), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5, !sec !{!"public"}
  %7 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %9 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %9, 1, !sec !{!"public"}
  %cmp7 = icmp ult i64 %7, %sub, !sec !{!"public"}
  br i1 %cmp7, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %10 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %11, i64 %12, !sec !{!"public", !"public", !"public"}
  %13 = load i64, ptr %arrayidx, align 8, !sec !{!"private", !"public"}
  %d13 = call i64 @declassify.i64(i64 noundef %13), !sec !{!"declassify", !"private", !"public"}
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %d13), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %14 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %14, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %15 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys9 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %16 = load ptr, ptr %keys9, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx10 = getelementptr inbounds i64, ptr %16, i64 %17, !sec !{!"public", !"public", !"public"}
  %18 = load i64, ptr %arrayidx10, align 8, !sec !{!"private", !"public"}
  %d18 = call i64 @declassify.i64(i64 noundef %18), !sec !{!"declassify", !"private", !"public"}
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i64 noundef %d18), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end12

if.end12:                                         ; preds = %for.end, %while.body, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond13

while.cond13:                                     ; preds = %if.end22, %if.end12, !sec !{!"public"}
  %19 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %20 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %num_keys14 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %21 = load i64, ptr %num_keys14, align 8, !sec !{!"public", !"public"}
  %cmp15 = icmp ult i64 %19, %21, !sec !{!"public"}
  br i1 %cmp15, label %while.body16, label %while.end, !sec !{!"public"}

while.body16:                                     ; preds = %while.cond13, !sec !{!"public"}
  %22 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %23 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys17 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %24 = load ptr, ptr %keys17, align 8, !sec !{!"public", !"public"}
  %25 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx18 = getelementptr inbounds i64, ptr %24, i64 %25, !sec !{!"public", !"public", !"public"}
  %26 = load i64, ptr %arrayidx18, align 8, !sec !{!"private", !"public"}
  %cmp19 = icmp uge i64 %22, %26, !sec !{!"private"}
  br i1 %cmp19, label %if.then20, label %if.else, !sec !{!"private"}

if.then20:                                        ; preds = %while.body16, !sec !{!"public"}
  %27 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc21 = add i64 %27, 1, !sec !{!"public"}
  store i64 %inc21, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %if.end22

if.else:                                          ; preds = %while.body16, !sec !{!"public"}
  br label %while.end

if.end22:                                         ; preds = %if.then20, !sec !{!"public"}
  br label %while.cond13, !llvm.loop !21

while.end:                                        ; preds = %if.else, %while.cond13, !sec !{!"public"}
  %28 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %tobool23 = trunc i8 %28 to i1, !sec !{!"private"}
  br i1 %tobool23, label %if.then24, label %if.end26, !sec !{!"private"}

if.then24:                                        ; preds = %while.end, !sec !{!"public"}
  %29 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %call25 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i64 noundef %29), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %while.end, !sec !{!"public"}
  %30 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx27 = getelementptr inbounds ptr, ptr %31, i64 %32, !sec !{!"public", !"public", !"public"}
  %33 = load ptr, ptr %arrayidx27, align 8, !sec !{!"public", !"public"}
  store ptr %33, ptr %c, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !22

while.end28:                                      ; preds = %while.cond, !sec !{!"public"}
  %34 = load i8, ptr %verbose.addr, align 1, !sec !{!"private", !"private"}
  %tobool29 = trunc i8 %34 to i1, !sec !{!"private"}
  br i1 %tobool29, label %if.then30, label %if.end46, !sec !{!"private"}

if.then30:                                        ; preds = %while.end28, !sec !{!"public"}
  %call31 = call i32 (ptr, ...) @printf(ptr noundef @.str.24), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc40, %if.then30, !sec !{!"public"}
  %35 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %36 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %num_keys33 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %37 = load i64, ptr %num_keys33, align 8, !sec !{!"public", !"public"}
  %sub34 = sub i64 %37, 1, !sec !{!"public"}
  %cmp35 = icmp ult i64 %35, %sub34, !sec !{!"public"}
  br i1 %cmp35, label %for.body36, label %for.end42, !sec !{!"public"}

for.body36:                                       ; preds = %for.cond32, !sec !{!"public"}
  %38 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys37 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %39 = load ptr, ptr %keys37, align 8, !sec !{!"public", !"public"}
  %40 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx38 = getelementptr inbounds i64, ptr %39, i64 %40, !sec !{!"public", !"public", !"public"}
  %41 = load i64, ptr %arrayidx38, align 8, !sec !{!"private", !"public"}
  %d41 = call i64 @declassify.i64(i64 noundef %41), !sec !{!"declassify", !"private", !"public"}
  %call39 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i64 noundef %d41), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %for.inc40

for.inc40:                                        ; preds = %for.body36, !sec !{!"public"}
  %42 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc41 = add i64 %42, 1, !sec !{!"public"}
  store i64 %inc41, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond32, !llvm.loop !23

for.end42:                                        ; preds = %for.cond32, !sec !{!"public"}
  %43 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  %keys43 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %44 = load ptr, ptr %keys43, align 8, !sec !{!"public", !"public"}
  %45 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx44 = getelementptr inbounds i64, ptr %44, i64 %45, !sec !{!"public", !"public", !"public"}
  %46 = load i64, ptr %arrayidx44, align 8, !sec !{!"private", !"public"}
  %d46 = call i64 @declassify.i64(i64 noundef %46), !sec !{!"declassify", !"private", !"public"}
  %call45 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i64 noundef %d46), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end46

if.end46:                                         ; preds = %for.end42, %while.end28, !sec !{!"public"}
  %47 = load ptr, ptr %c, align 8, !sec !{!"public", !"public"}
  store ptr %47, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.end46, %if.end, !sec !{!"public"}
  %48 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %48, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @cut(i64 noundef %length) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca i64, align 8, !sec !{!"private"}
  %length.addr = alloca i64, align 8, !sec !{!"private"}
  store i64 %length, ptr %length.addr, align 8, !sec !{!"private", !"private"}
  %0 = load i64, ptr %length.addr, align 8, !sec !{!"private", !"private"}
  %rem = urem i64 %0, 2, !sec !{!"private"}
  %cmp = icmp eq i64 %rem, 0, !sec !{!"private"}
  br i1 %cmp, label %if.then, label %if.else, !sec !{!"private"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load i64, ptr %length.addr, align 8, !sec !{!"private", !"private"}
  %div = udiv i64 %1, 2, !sec !{!"private"}
  store i64 %div, ptr %retval, align 8, !sec !{!"private", !"private"}
  br label %return

if.else:                                          ; preds = %entry, !sec !{!"public"}
  %2 = load i64, ptr %length.addr, align 8, !sec !{!"private", !"private"}
  %div1 = udiv i64 %2, 2, !sec !{!"private"}
  %add = add i64 %div1, 1, !sec !{!"private"}
  store i64 %add, ptr %retval, align 8, !sec !{!"private", !"private"}
  br label %return

return:                                           ; preds = %if.else, %if.then, !sec !{!"public"}
  %3 = load i64, ptr %retval, align 8, !sec !{!"private", !"private"}
  ret i64 %3, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_node() #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %n = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %nd = alloca ptr, align 8, !sec !{!"public"}
  %0 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  %tobool = icmp ne ptr %0, null, !sec !{!"public"}
  br i1 %tobool, label %if.end5, label %if.then, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %call, ptr %n, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %1, null, !sec !{!"public"}
  br i1 %cmp, label %if.then1, label %if.end, !sec !{!"public"}

if.then1:                                         ; preds = %if.then, !sec !{!"public"}
  %2 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %call2 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.26), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %if.then, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end, !sec !{!"public"}
  %3 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ult i64 %3, 18724, !sec !{!"public"}
  br i1 %cmp3, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %4 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds %struct.node, ptr %5, i64 %6, !sec !{!"public", !"public", !"public"}
  %next = getelementptr inbounds %struct.node, ptr %arrayidx, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %4, ptr %next, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %n, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx4 = getelementptr inbounds %struct.node, ptr %7, i64 %8, !sec !{!"public", !"public", !"public"}
  store ptr %arrayidx4, ptr @free_nodes, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %9 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %9, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !24

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  br label %if.end5

if.end5:                                          ; preds = %for.end, %entry, !sec !{!"public"}
  %10 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  store ptr %10, ptr %nd, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %nd, align 8, !sec !{!"public", !"public"}
  %next6 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  %12 = load ptr, ptr %next6, align 8, !sec !{!"public", !"public"}
  store ptr %12, ptr @free_nodes, align 8
  %13 = load ptr, ptr %nd, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 8 %13, i8 0, i64 8, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %14 = load ptr, ptr %nd, align 8, !sec !{!"public", !"public"}
  ret ptr %14, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate(i64 noundef %size, i64 noundef %alignment) #0 !sec !{!"void", !"public", !{!"public", !"public"}} {
entry:		; !sec !{!"public"}
  %size.addr = alloca i64, align 8, !sec !{!"public"}
  %alignment.addr = alloca i64, align 8, !sec !{!"public"}
  %memptr = alloca ptr, align 8, !sec !{!"public"}
  store i64 %size, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  store i64 %alignment, ptr %alignment.addr, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %alignment.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  %call = call i32 @posix_memalign(ptr noundef %memptr, i64 noundef %0, i64 noundef %1) #8, !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %tobool = icmp ne i32 %call, 0, !sec !{!"public"}
  br i1 %tobool, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.44), !sec !{!"call", !"public", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %2 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  %3 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %add = add i64 %3, %2, !sec !{!"public"}
  store i64 %add, ptr @allocator_stat, align 8
  %4 = load ptr, ptr %memptr, align 8, !sec !{!"public", !"public"}
  %5 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 1 %4, i8 0, i64 %5, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %6 = load ptr, ptr %memptr, align 8, !sec !{!"public", !"public"}
  ret ptr %6, !sec !{!"public"}
}

declare !sec !{!"public", !"public", !{!"public", !"..."}} i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare !sec !{!"void", !"public", !{!"public"}} void @exit(i32 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare !sec !{!"void", !"public", !{!"public", !"public", !"public", !"public"}} void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_node(ptr noundef %n) #0 !sec !{!"void", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr @free_nodes, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %next = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %0, ptr %next, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr @free_nodes, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @alloc_record() #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %r = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %rec = alloca ptr, align 8, !sec !{!"public"}
  %0 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  %tobool = icmp ne ptr %0, null, !sec !{!"public"}
  br i1 %tobool, label %if.end5, label %if.then, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call = call ptr @allocate(i64 noundef 1048576, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %call, ptr %r, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %1, null, !sec !{!"public"}
  br i1 %cmp, label %if.then1, label %if.end, !sec !{!"public"}

if.then1:                                         ; preds = %if.then, !sec !{!"public"}
  %2 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %call2 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.26), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %if.then, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end, !sec !{!"public"}
  %3 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ult i64 %3, 32768, !sec !{!"public"}
  br i1 %cmp3, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %4 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds %struct.record, ptr %5, i64 %6, !sec !{!"public", !"public", !"public"}
  %next = getelementptr inbounds %struct.record, ptr %arrayidx, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %4, ptr %next, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx4 = getelementptr inbounds %struct.record, ptr %7, i64 %8, !sec !{!"public", !"public", !"public"}
  store ptr %arrayidx4, ptr @free_recs, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %9 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %9, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  br label %if.end5

if.end5:                                          ; preds = %for.end, %entry, !sec !{!"public"}
  %10 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  store ptr %10, ptr %rec, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %rec, align 8, !sec !{!"public", !"public"}
  %next6 = getelementptr inbounds %struct.record, ptr %11, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %12 = load ptr, ptr %next6, align 8, !sec !{!"public", !"public"}
  store ptr %12, ptr @free_recs, align 8
  %13 = load ptr, ptr %rec, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 8 %13, i8 0, i64 32, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %14 = load ptr, ptr %rec, align 8, !sec !{!"public", !"public"}
  ret ptr %14, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_record(ptr noundef %r) #0 !sec !{!"void", !"public", !{!"public", !"public"}} {
entry:		; !sec !{!"public"}
  %r.addr = alloca ptr, align 8, !sec !{!"public"}
  store ptr %r, ptr %r.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr @free_recs, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %r.addr, align 8, !sec !{!"public", !"public"}
  %next = getelementptr inbounds %struct.record, ptr %1, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %0, ptr %next, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %r.addr, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr @free_recs, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_record(i64 noundef %value) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %value.addr = alloca i64, align 8, !sec !{!"public"}
  %new_record = alloca ptr, align 8, !sec !{!"public"}
  store i64 %value, ptr %value.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr (i64, ...) @alloc_record(i64 noundef 32), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call, ptr %new_record, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %new_record, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  call void @perror(ptr noundef @.str.27) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.else:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load i64, ptr %value.addr, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %new_record, align 8, !sec !{!"public", !"public"}
  %value1 = getelementptr inbounds %struct.record, ptr %2, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %1, ptr %value1, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.end:                                           ; preds = %if.else, !sec !{!"public"}
  %3 = load ptr, ptr %new_record, align 8, !sec !{!"public", !"public"}
  ret ptr %3, !sec !{!"public"}
}

; Function Attrs: cold
declare !sec !{!"public", !"public", !{!"public"}} void @perror(ptr noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_node() #0 !sec !{!"public", !"public", !{}} {
entry:		; !sec !{!"public"}
  %new_node = alloca ptr, align 8, !sec !{!"public"}
  %call = call ptr (i64, ...) @alloc_node(i64 noundef 56), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %0, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  call void @perror(ptr noundef @.str.28) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %1 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %1, 1, !sec !{!"public"}
  %mul = mul i64 %sub, 8, !sec !{!"public"}
  %call1 = call ptr @allocate_align64(i64 noundef %mul), !sec !{!"call", !"public", !{!"public"}}
  %2 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %call1, ptr %keys, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %keys2 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load ptr, ptr %keys2, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp eq ptr %4, null, !sec !{!"public"}
  br i1 %cmp3, label %if.then4, label %if.end5, !sec !{!"public"}

if.then4:                                         ; preds = %if.end, !sec !{!"public"}
  call void @perror(ptr noundef @.str.29) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end5:                                          ; preds = %if.end, !sec !{!"public"}
  %5 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %mul6 = mul i64 %5, 8, !sec !{!"public"}
  %call7 = call ptr @allocate_align64(i64 noundef %mul6), !sec !{!"call", !"public", !{!"public"}}
  %6 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %call7, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %pointers8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load ptr, ptr %pointers8, align 8, !sec !{!"public", !"public"}
  %cmp9 = icmp eq ptr %8, null, !sec !{!"public"}
  br i1 %cmp9, label %if.then10, label %if.end11, !sec !{!"public"}

if.then10:                                        ; preds = %if.end5, !sec !{!"public"}
  call void @perror(ptr noundef @.str.30) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end11:                                         ; preds = %if.end5, !sec !{!"public"}
  %9 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  store i8 0, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %10 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  store i64 0, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %parent, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %next = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 6, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %next, align 8, !sec !{!"public", !"public"}
  %13 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  ret ptr %13, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @allocate_align64(i64 noundef %size) #0 !sec !{!"public", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %size.addr = alloca i64, align 8, !sec !{!"public"}
  %memptr = alloca ptr, align 8, !sec !{!"public"}
  store i64 %size, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  %call = call i32 @posix_memalign(ptr noundef %memptr, i64 noundef 64, i64 noundef %0) #8, !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %tobool = icmp ne i32 %call, 0, !sec !{!"public"}
  br i1 %tobool, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.44), !sec !{!"call", !"public", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %1 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  %2 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %add = add i64 %2, %1, !sec !{!"public"}
  store i64 %add, ptr @allocator_stat, align 8
  %3 = load ptr, ptr %memptr, align 8, !sec !{!"public", !"public"}
  %4 = load i64, ptr %size.addr, align 8, !sec !{!"public", !"public"}
  call void @llvm.memset.p0.i64(ptr align 1 %3, i8 0, i64 %4, i1 false), !sec !{!"call", !"void", !{!"public", !"public", !"public", !"public"}}
  %5 = load ptr, ptr %memptr, align 8, !sec !{!"public", !"public"}
  ret ptr %5, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @make_leaf() #0 !sec !{!"public", !"public", !{}} {
entry:		; !sec !{!"public"}
  %leaf = alloca ptr, align 8, !sec !{!"public"}
  %call = call ptr @make_node(), !sec !{!"call", !"public", !{}}
  store ptr %call, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  store i8 1, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  ret ptr %1, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_left_index(ptr noundef %parent, ptr noundef %left) #0 !sec !{!"private", !"private", !{!"private", !"private"}} {
entry:		; !sec !{!"private"}
  %parent.addr = alloca ptr, align 8, !sec !{!"private"}
  %left.addr = alloca ptr, align 8, !sec !{!"private"}
  %left_index = alloca i64, align 8, !sec !{!"private"}
  store ptr %parent, ptr %parent.addr, align 8, !sec !{!"private", !"private"}
  store ptr %left, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %left_index, align 8, !sec !{!"private", !"private"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry, !sec !{!"private"}
  %0 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %1 = load ptr, ptr %parent.addr, align 8, !sec !{!"private", !"private"}
  %num_keys = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %2 = load i64, ptr %num_keys, align 8, !sec !{!"private", !"private"}
  %cmp = icmp ule i64 %0, %2, !sec !{!"private"}
  br i1 %cmp, label %land.rhs, label %land.end, !sec !{!"private"}

land.rhs:                                         ; preds = %while.cond, !sec !{!"private"}
  %3 = load ptr, ptr %parent.addr, align 8, !sec !{!"private", !"private"}
  %pointers = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %4 = load ptr, ptr %pointers, align 8, !sec !{!"private", !"private"}
  %5 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %5, !sec !{!"private", !"private", !"private"}
  %6 = load ptr, ptr %arrayidx, align 8, !sec !{!"private", !"private"}
  %7 = load ptr, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  %cmp1 = icmp ne ptr %6, %7, !sec !{!"private"}
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond, !sec !{!"private"}
  %8 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !sec !{!"private", !"private", !"private"}
  br i1 %8, label %while.body, label %while.end, !sec !{!"private"}

while.body:                                       ; preds = %land.end, !sec !{!"private"}
  %9 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %inc = add i64 %9, 1, !sec !{!"private"}
  store i64 %inc, ptr %left_index, align 8, !sec !{!"private", !"private"}
  br label %while.cond, !llvm.loop !26

while.end:                                        ; preds = %land.end, !sec !{!"private"}
  %10 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  ret i64 %10, !sec !{!"private"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf(ptr noundef %leaf, i64 noundef %key, ptr noundef %pointer) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %leaf.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %pointer.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %insertion_point = alloca i64, align 8, !sec !{!"public"}
  store ptr %leaf, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %pointer, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry, !sec !{!"public"}
  %0 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ult i64 %0, %2, !sec !{!"public"}
  br i1 %cmp, label %land.rhs, label %land.end, !sec !{!"public"}

land.rhs:                                         ; preds = %while.cond, !sec !{!"public"}
  %3 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %5 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %4, i64 %5, !sec !{!"public", !"public", !"public"}
  %6 = load i64, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %7 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %cmp1 = icmp ult i64 %6, %7, !sec !{!"public"}
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond, !sec !{!"public"}
  %8 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !sec !{!"public", !"public", !"public"}
  br i1 %8, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %land.end, !sec !{!"public"}
  %9 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %9, 1, !sec !{!"public"}
  store i64 %inc, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !27

while.end:                                        ; preds = %land.end, !sec !{!"public"}
  %10 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys2 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load i64, ptr %num_keys2, align 8, !sec !{!"public", !"public"}
  store i64 %11, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end, !sec !{!"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %13 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ugt i64 %12, %13, !sec !{!"public"}
  br i1 %cmp3, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %14 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys4 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %15 = load ptr, ptr %keys4, align 8, !sec !{!"public", !"public"}
  %16 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %16, 1, !sec !{!"public"}
  %arrayidx5 = getelementptr inbounds i64, ptr %15, i64 %sub, !sec !{!"public", !"public", !"public"}
  %17 = load i64, ptr %arrayidx5, align 8, !sec !{!"public", !"public"}
  %18 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys6 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load ptr, ptr %keys6, align 8, !sec !{!"public", !"public"}
  %20 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx7 = getelementptr inbounds i64, ptr %19, i64 %20, !sec !{!"public", !"public", !"public"}
  store i64 %17, ptr %arrayidx7, align 8, !sec !{!"public", !"public"}
  %21 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %23 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub8 = sub i64 %23, 1, !sec !{!"public"}
  %arrayidx9 = getelementptr inbounds ptr, ptr %22, i64 %sub8, !sec !{!"public", !"public", !"public"}
  %24 = load ptr, ptr %arrayidx9, align 8, !sec !{!"public", !"public"}
  %25 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers10 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %26 = load ptr, ptr %pointers10, align 8, !sec !{!"public", !"public"}
  %27 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx11 = getelementptr inbounds ptr, ptr %26, i64 %27, !sec !{!"public", !"public", !"public"}
  store ptr %24, ptr %arrayidx11, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %28 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %dec = add i64 %28, -1, !sec !{!"public"}
  store i64 %dec, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !28

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %29 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %30 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys12 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load ptr, ptr %keys12, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %arrayidx13 = getelementptr inbounds i64, ptr %31, i64 %32, !sec !{!"public", !"public", !"public"}
  store i64 %29, ptr %arrayidx13, align 8, !sec !{!"public", !"public"}
  %33 = load ptr, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %34 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers14 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %35 = load ptr, ptr %pointers14, align 8, !sec !{!"public", !"public"}
  %36 = load i64, ptr %insertion_point, align 8, !sec !{!"public", !"public"}
  %arrayidx15 = getelementptr inbounds ptr, ptr %35, i64 %36, !sec !{!"public", !"public", !"public"}
  store ptr %33, ptr %arrayidx15, align 8, !sec !{!"public", !"public"}
  %37 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys16 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %38 = load i64, ptr %num_keys16, align 8, !sec !{!"public", !"public"}
  %inc17 = add i64 %38, 1, !sec !{!"public"}
  store i64 %inc17, ptr %num_keys16, align 8, !sec !{!"public", !"public"}
  %39 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %39, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_leaf_after_splitting(ptr noundef %root, ptr noundef %leaf, i64 noundef %key, ptr noundef %pointer) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %leaf.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %pointer.addr = alloca ptr, align 8, !sec !{!"public"}
  %new_leaf = alloca ptr, align 8, !sec !{!"public"}
  %temp_keys = alloca ptr, align 8, !sec !{!"public"}
  %temp_pointers = alloca ptr, align 8, !sec !{!"public"}
  %insertion_index = alloca i64, align 8, !sec !{!"public"}
  %split = alloca i64, align 8, !sec !{!"public"}
  %new_key = alloca i64, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %j = alloca i64, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %leaf, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %pointer, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr @make_leaf(), !sec !{!"call", !"public", !{}}
  store ptr %call, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %add = add i64 %0, 1, !sec !{!"public"}
  %mul = mul i64 %add, 8, !sec !{!"public"}
  %call1 = call ptr @allocate_align64(i64 noundef %mul), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call1, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %1, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  call void @perror(ptr noundef @.str.31) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %2 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %add2 = add i64 %2, 1, !sec !{!"public"}
  %mul3 = mul i64 %add2, 8, !sec !{!"public"}
  %call4 = call ptr @allocate_align64(i64 noundef %mul3), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call4, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %cmp5 = icmp eq ptr %3, null, !sec !{!"public"}
  br i1 %cmp5, label %if.then6, label %if.end7, !sec !{!"public"}

if.then6:                                         ; preds = %if.end, !sec !{!"public"}
  call void @perror(ptr noundef @.str.32) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end7:                                          ; preds = %if.end, !sec !{!"public"}
  store i64 0, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end7, !sec !{!"public"}
  %4 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %5 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %5, 1, !sec !{!"public"}
  %cmp8 = icmp ult i64 %4, %sub, !sec !{!"public"}
  br i1 %cmp8, label %land.rhs, label %land.end, !sec !{!"public"}

land.rhs:                                         ; preds = %while.cond, !sec !{!"public"}
  %6 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %7, i64 %8, !sec !{!"public", !"public", !"public"}
  %9 = load i64, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %10 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %cmp9 = icmp ult i64 %9, %10, !sec !{!"public"}
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond, !sec !{!"public"}
  %11 = phi i1 [ false, %while.cond ], [ %cmp9, %land.rhs ], !sec !{!"public", !"public", !"public"}
  br i1 %11, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %land.end, !sec !{!"public"}
  %12 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %12, 1, !sec !{!"public"}
  store i64 %inc, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !29

while.end:                                        ; preds = %land.end, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end, !sec !{!"public"}
  %13 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %15 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp10 = icmp ult i64 %13, %15, !sec !{!"public"}
  br i1 %cmp10, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %16 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %cmp11 = icmp eq i64 %16, %17, !sec !{!"public"}
  br i1 %cmp11, label %if.then12, label %if.end14, !sec !{!"public"}

if.then12:                                        ; preds = %for.body, !sec !{!"public"}
  %18 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc13 = add i64 %18, 1, !sec !{!"public"}
  store i64 %inc13, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %for.body, !sec !{!"public"}
  %19 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys15 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load ptr, ptr %keys15, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx16 = getelementptr inbounds i64, ptr %20, i64 %21, !sec !{!"public", !"public", !"public"}
  %22 = load i64, ptr %arrayidx16, align 8, !sec !{!"public", !"public"}
  %23 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %24 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx17 = getelementptr inbounds i64, ptr %23, i64 %24, !sec !{!"public", !"public", !"public"}
  store i64 %22, ptr %arrayidx17, align 8, !sec !{!"public", !"public"}
  %25 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %26 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %27 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx18 = getelementptr inbounds ptr, ptr %26, i64 %27, !sec !{!"public", !"public", !"public"}
  %28 = load ptr, ptr %arrayidx18, align 8, !sec !{!"public", !"public"}
  %29 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %30 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx19 = getelementptr inbounds ptr, ptr %29, i64 %30, !sec !{!"public", !"public", !"public"}
  store ptr %28, ptr %arrayidx19, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %if.end14, !sec !{!"public"}
  %31 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc20 = add i64 %31, 1, !sec !{!"public"}
  store i64 %inc20, ptr %i, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc21 = add i64 %32, 1, !sec !{!"public"}
  store i64 %inc21, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !30

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %33 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %34 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %35 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %arrayidx22 = getelementptr inbounds i64, ptr %34, i64 %35, !sec !{!"public", !"public", !"public"}
  store i64 %33, ptr %arrayidx22, align 8, !sec !{!"public", !"public"}
  %36 = load ptr, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %37 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr %insertion_index, align 8, !sec !{!"public", !"public"}
  %arrayidx23 = getelementptr inbounds ptr, ptr %37, i64 %38, !sec !{!"public", !"public", !"public"}
  store ptr %36, ptr %arrayidx23, align 8, !sec !{!"public", !"public"}
  %39 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys24 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  store i64 0, ptr %num_keys24, align 8, !sec !{!"public", !"public"}
  %40 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub25 = sub i64 %40, 1, !sec !{!"public"}
  %call26 = call i64 @cut(i64 noundef %sub25), !sec !{!"call", !"public", !{!"public"}}
  store i64 %call26, ptr %split, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc38, %for.end, !sec !{!"public"}
  %41 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %42 = load i64, ptr %split, align 8, !sec !{!"public", !"public"}
  %cmp28 = icmp ult i64 %41, %42, !sec !{!"public"}
  br i1 %cmp28, label %for.body29, label %for.end40, !sec !{!"public"}

for.body29:                                       ; preds = %for.cond27, !sec !{!"public"}
  %43 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %44 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx30 = getelementptr inbounds ptr, ptr %43, i64 %44, !sec !{!"public", !"public", !"public"}
  %45 = load ptr, ptr %arrayidx30, align 8, !sec !{!"public", !"public"}
  %46 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers31 = getelementptr inbounds %struct.node, ptr %46, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %47 = load ptr, ptr %pointers31, align 8, !sec !{!"public", !"public"}
  %48 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx32 = getelementptr inbounds ptr, ptr %47, i64 %48, !sec !{!"public", !"public", !"public"}
  store ptr %45, ptr %arrayidx32, align 8, !sec !{!"public", !"public"}
  %49 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %50 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx33 = getelementptr inbounds i64, ptr %49, i64 %50, !sec !{!"public", !"public", !"public"}
  %51 = load i64, ptr %arrayidx33, align 8, !sec !{!"public", !"public"}
  %52 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %keys34 = getelementptr inbounds %struct.node, ptr %52, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %53 = load ptr, ptr %keys34, align 8, !sec !{!"public", !"public"}
  %54 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx35 = getelementptr inbounds i64, ptr %53, i64 %54, !sec !{!"public", !"public", !"public"}
  store i64 %51, ptr %arrayidx35, align 8, !sec !{!"public", !"public"}
  %55 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys36 = getelementptr inbounds %struct.node, ptr %55, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %56 = load i64, ptr %num_keys36, align 8, !sec !{!"public", !"public"}
  %inc37 = add i64 %56, 1, !sec !{!"public"}
  store i64 %inc37, ptr %num_keys36, align 8, !sec !{!"public", !"public"}
  br label %for.inc38

for.inc38:                                        ; preds = %for.body29, !sec !{!"public"}
  %57 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc39 = add i64 %57, 1, !sec !{!"public"}
  store i64 %inc39, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond27, !llvm.loop !31

for.end40:                                        ; preds = %for.cond27, !sec !{!"public"}
  %58 = load i64, ptr %split, align 8, !sec !{!"public", !"public"}
  store i64 %58, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc52, %for.end40, !sec !{!"public"}
  %59 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %60 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %cmp42 = icmp ult i64 %59, %60, !sec !{!"public"}
  br i1 %cmp42, label %for.body43, label %for.end55, !sec !{!"public"}

for.body43:                                       ; preds = %for.cond41, !sec !{!"public"}
  %61 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %62 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx44 = getelementptr inbounds ptr, ptr %61, i64 %62, !sec !{!"public", !"public", !"public"}
  %63 = load ptr, ptr %arrayidx44, align 8, !sec !{!"public", !"public"}
  %64 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %pointers45 = getelementptr inbounds %struct.node, ptr %64, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %65 = load ptr, ptr %pointers45, align 8, !sec !{!"public", !"public"}
  %66 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx46 = getelementptr inbounds ptr, ptr %65, i64 %66, !sec !{!"public", !"public", !"public"}
  store ptr %63, ptr %arrayidx46, align 8, !sec !{!"public", !"public"}
  %67 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %68 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx47 = getelementptr inbounds i64, ptr %67, i64 %68, !sec !{!"public", !"public", !"public"}
  %69 = load i64, ptr %arrayidx47, align 8, !sec !{!"public", !"public"}
  %70 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %keys48 = getelementptr inbounds %struct.node, ptr %70, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %71 = load ptr, ptr %keys48, align 8, !sec !{!"public", !"public"}
  %72 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx49 = getelementptr inbounds i64, ptr %71, i64 %72, !sec !{!"public", !"public", !"public"}
  store i64 %69, ptr %arrayidx49, align 8, !sec !{!"public", !"public"}
  %73 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %num_keys50 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %74 = load i64, ptr %num_keys50, align 8, !sec !{!"public", !"public"}
  %inc51 = add i64 %74, 1, !sec !{!"public"}
  store i64 %inc51, ptr %num_keys50, align 8, !sec !{!"public", !"public"}
  br label %for.inc52

for.inc52:                                        ; preds = %for.body43, !sec !{!"public"}
  %75 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc53 = add i64 %75, 1, !sec !{!"public"}
  store i64 %inc53, ptr %i, align 8, !sec !{!"public", !"public"}
  %76 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc54 = add i64 %76, 1, !sec !{!"public"}
  store i64 %inc54, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond41, !llvm.loop !32

for.end55:                                        ; preds = %for.cond41, !sec !{!"public"}
  %77 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %77) #8, !sec !{!"free", !"public"}
  %78 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %78) #8, !sec !{!"free", !"public"}
  %79 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers56 = getelementptr inbounds %struct.node, ptr %79, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %80 = load ptr, ptr %pointers56, align 8, !sec !{!"public", !"public"}
  %81 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub57 = sub i64 %81, 1, !sec !{!"public"}
  %arrayidx58 = getelementptr inbounds ptr, ptr %80, i64 %sub57, !sec !{!"public", !"public", !"public"}
  %82 = load ptr, ptr %arrayidx58, align 8, !sec !{!"public", !"public"}
  %83 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %pointers59 = getelementptr inbounds %struct.node, ptr %83, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %84 = load ptr, ptr %pointers59, align 8, !sec !{!"public", !"public"}
  %85 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub60 = sub i64 %85, 1, !sec !{!"public"}
  %arrayidx61 = getelementptr inbounds ptr, ptr %84, i64 %sub60, !sec !{!"public", !"public", !"public"}
  store ptr %82, ptr %arrayidx61, align 8, !sec !{!"public", !"public"}
  %86 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %87 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers62 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %88 = load ptr, ptr %pointers62, align 8, !sec !{!"public", !"public"}
  %89 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub63 = sub i64 %89, 1, !sec !{!"public"}
  %arrayidx64 = getelementptr inbounds ptr, ptr %88, i64 %sub63, !sec !{!"public", !"public", !"public"}
  store ptr %86, ptr %arrayidx64, align 8, !sec !{!"public", !"public"}
  %90 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %num_keys65 = getelementptr inbounds %struct.node, ptr %90, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %91 = load i64, ptr %num_keys65, align 8, !sec !{!"public", !"public"}
  store i64 %91, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc72, %for.end55, !sec !{!"public"}
  %92 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %93 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub67 = sub i64 %93, 1, !sec !{!"public"}
  %cmp68 = icmp ult i64 %92, %sub67, !sec !{!"public"}
  br i1 %cmp68, label %for.body69, label %for.end74, !sec !{!"public"}

for.body69:                                       ; preds = %for.cond66, !sec !{!"public"}
  %94 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %pointers70 = getelementptr inbounds %struct.node, ptr %94, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %95 = load ptr, ptr %pointers70, align 8, !sec !{!"public", !"public"}
  %96 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx71 = getelementptr inbounds ptr, ptr %95, i64 %96, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx71, align 8, !sec !{!"public", !"public"}
  br label %for.inc72

for.inc72:                                        ; preds = %for.body69, !sec !{!"public"}
  %97 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc73 = add i64 %97, 1, !sec !{!"public"}
  store i64 %inc73, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond66, !llvm.loop !33

for.end74:                                        ; preds = %for.cond66, !sec !{!"public"}
  %98 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %num_keys75 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %99 = load i64, ptr %num_keys75, align 8, !sec !{!"public", !"public"}
  store i64 %99, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc82, %for.end74, !sec !{!"public"}
  %100 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %101 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub77 = sub i64 %101, 1, !sec !{!"public"}
  %cmp78 = icmp ult i64 %100, %sub77, !sec !{!"public"}
  br i1 %cmp78, label %for.body79, label %for.end84, !sec !{!"public"}

for.body79:                                       ; preds = %for.cond76, !sec !{!"public"}
  %102 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %pointers80 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %103 = load ptr, ptr %pointers80, align 8, !sec !{!"public", !"public"}
  %104 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx81 = getelementptr inbounds ptr, ptr %103, i64 %104, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx81, align 8, !sec !{!"public", !"public"}
  br label %for.inc82

for.inc82:                                        ; preds = %for.body79, !sec !{!"public"}
  %105 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc83 = add i64 %105, 1, !sec !{!"public"}
  store i64 %inc83, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond76, !llvm.loop !34

for.end84:                                        ; preds = %for.cond76, !sec !{!"public"}
  %106 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %106, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %107 = load ptr, ptr %parent, align 8, !sec !{!"public", !"public"}
  %108 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %parent85 = getelementptr inbounds %struct.node, ptr %108, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %107, ptr %parent85, align 8, !sec !{!"public", !"public"}
  %109 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %keys86 = getelementptr inbounds %struct.node, ptr %109, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %110 = load ptr, ptr %keys86, align 8, !sec !{!"public", !"public"}
  %arrayidx87 = getelementptr inbounds i64, ptr %110, i64 0, !sec !{!"public", !"public", !"public"}
  %111 = load i64, ptr %arrayidx87, align 8, !sec !{!"public", !"public"}
  store i64 %111, ptr %new_key, align 8, !sec !{!"public", !"public"}
  %112 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %113 = load ptr, ptr %leaf.addr, align 8, !sec !{!"public", !"public"}
  %114 = load i64, ptr %new_key, align 8, !sec !{!"public", !"public"}
  %115 = load ptr, ptr %new_leaf, align 8, !sec !{!"public", !"public"}
  %call88 = call ptr @insert_into_parent(ptr noundef %112, ptr noundef %113, i64 noundef %114, ptr noundef %115), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  ret ptr %call88, !sec !{!"public"}
}

; Function Attrs: nounwind
declare !sec !{!"void", !"public", !{}} void @free(ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_parent(ptr noundef %root, ptr noundef %left, i64 noundef %key, ptr noundef %right) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %left.addr = alloca ptr, align 8, !sec !{!"private"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %right.addr = alloca ptr, align 8, !sec !{!"private"}
  %left_index = alloca i64, align 8, !sec !{!"private"}
  %parent = alloca ptr, align 8, !sec !{!"private"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %left, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %right, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %0 = load ptr, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  %parent1 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %1 = load ptr, ptr %parent1, align 8, !sec !{!"private", !"private"}
  store ptr %1, ptr %parent, align 8, !sec !{!"private", !"private"}
  %2 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %cmp = icmp eq ptr %2, null, !sec !{!"private"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"private"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %3 = load ptr, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  %4 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %call = call ptr @insert_into_new_root(ptr noundef %3, i64 noundef %4, ptr noundef %5), !sec !{!"call", !"public", !{!"private", !"public", !"private"}}
  store ptr %call, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %6 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %7 = load ptr, ptr %left.addr, align 8, !sec !{!"private", !"private"}
  %call2 = call i64 @get_left_index(ptr noundef %6, ptr noundef %7), !sec !{!"call", !"private", !{!"private", !"private"}}
  store i64 %call2, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %8 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %num_keys = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %9 = load i64, ptr %num_keys, align 8, !sec !{!"private", !"private"}
  %10 = load i64, ptr @order, align 8, !sec !{!"private", !"public"}
  %sub = sub i64 %10, 1, !sec !{!"private"}
  %cmp3 = icmp ult i64 %9, %sub, !sec !{!"private"}
  br i1 %cmp3, label %if.then4, label %if.end6, !sec !{!"private"}

if.then4:                                         ; preds = %if.end, !sec !{!"public"}
  %11 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %13 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %14 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"public"}
  %15 = load ptr, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %call5 = call ptr @insert_into_node(ptr noundef %11, ptr noundef %12, i64 noundef %13, i64 noundef %14, ptr noundef %15), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"private", !"private"}}
  store ptr %call5, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end6:                                          ; preds = %if.end, !sec !{!"public"}
  %16 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %17 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %18 = load i64, ptr %left_index, align 8, !sec !{!"private", !"private"}
  %19 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %20 = load ptr, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %call7 = call ptr @insert_into_node_after_splitting(ptr noundef %16, ptr noundef %17, i64 noundef %18, i64 noundef %19, ptr noundef %20), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"public", !"private"}}
  store ptr %call7, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.end6, %if.then4, %if.then, !sec !{!"public"}
  %21 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %21, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node(ptr noundef %root, ptr noundef %n, i64 noundef %left_index, i64 noundef %key, ptr noundef %right) #0 !sec !{!"public", !"public", !{!"public", !"private", !"private", !"private", !"private"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"private"}
  %left_index.addr = alloca i64, align 8, !sec !{!"private"}
  %key.addr = alloca i64, align 8, !sec !{!"private"}
  %right.addr = alloca ptr, align 8, !sec !{!"private"}
  %i = alloca i64, align 8, !sec !{!"private"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  store i64 %left_index, ptr %left_index.addr, align 8, !sec !{!"private", !"private"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  store ptr %right, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %0 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %num_keys = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %1 = load i64, ptr %num_keys, align 8, !sec !{!"private", !"private"}
  store i64 %1, ptr %i, align 8, !sec !{!"private", !"private"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry, !sec !{!"public"}
  %2 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %3 = load i64, ptr %left_index.addr, align 8, !sec !{!"private", !"private"}
  %cmp = icmp ugt i64 %2, %3, !sec !{!"private"}
  br i1 %cmp, label %for.body, label %for.end, !sec !{!"private"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %4 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %pointers = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %5 = load ptr, ptr %pointers, align 8, !sec !{!"private", !"private"}
  %6 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %arrayidx = getelementptr inbounds ptr, ptr %5, i64 %6, !sec !{!"private", !"private", !"private"}
  %7 = load ptr, ptr %arrayidx, align 8, !sec !{!"private", !"private"}
  %8 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %pointers1 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %9 = load ptr, ptr %pointers1, align 8, !sec !{!"private", !"private"}
  %10 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %add = add i64 %10, 1, !sec !{!"private"}
  %arrayidx2 = getelementptr inbounds ptr, ptr %9, i64 %add, !sec !{!"private", !"private", !"private"}
  store ptr %7, ptr %arrayidx2, align 8, !sec !{!"private", !"private"}
  %11 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %keys = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %12 = load ptr, ptr %keys, align 8, !sec !{!"private", !"private"}
  %13 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %sub = sub i64 %13, 1, !sec !{!"private"}
  %arrayidx3 = getelementptr inbounds i64, ptr %12, i64 %sub, !sec !{!"private", !"private", !"private"}
  %14 = load i64, ptr %arrayidx3, align 8, !sec !{!"private", !"private"}
  %15 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %keys4 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %16 = load ptr, ptr %keys4, align 8, !sec !{!"private", !"private"}
  %17 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %arrayidx5 = getelementptr inbounds i64, ptr %16, i64 %17, !sec !{!"private", !"private", !"private"}
  store i64 %14, ptr %arrayidx5, align 8, !sec !{!"private", !"private"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %18 = load i64, ptr %i, align 8, !sec !{!"private", !"private"}
  %dec = add i64 %18, -1, !sec !{!"private"}
  store i64 %dec, ptr %i, align 8, !sec !{!"private", !"private"}
  br label %for.cond, !llvm.loop !35

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %19 = load ptr, ptr %right.addr, align 8, !sec !{!"private", !"private"}
  %20 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %pointers6 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %21 = load ptr, ptr %pointers6, align 8, !sec !{!"private", !"private"}
  %22 = load i64, ptr %left_index.addr, align 8, !sec !{!"private", !"private"}
  %add7 = add i64 %22, 1, !sec !{!"private"}
  %arrayidx8 = getelementptr inbounds ptr, ptr %21, i64 %add7, !sec !{!"private", !"private", !"private"}
  store ptr %19, ptr %arrayidx8, align 8, !sec !{!"private", !"private"}
  %23 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"private"}
  %24 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %keys9 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 1, !sec !{!"private", !"private", !"public", !"public"}
  %25 = load ptr, ptr %keys9, align 8, !sec !{!"private", !"private"}
  %26 = load i64, ptr %left_index.addr, align 8, !sec !{!"private", !"private"}
  %arrayidx10 = getelementptr inbounds i64, ptr %25, i64 %26, !sec !{!"private", !"private", !"private"}
  store i64 %23, ptr %arrayidx10, align 8, !sec !{!"private", !"private"}
  %27 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %num_keys11 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i64, ptr %num_keys11, align 8, !sec !{!"private", !"private"}
  %inc = add i64 %28, 1, !sec !{!"private"}
  store i64 %inc, ptr %num_keys11, align 8, !sec !{!"private", !"private"}
  %29 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %29, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_node_after_splitting(ptr noundef %root, ptr noundef %old_node, i64 noundef %left_index, i64 noundef %key, ptr noundef %right) #0!sec !{!"public", !"public", !{!"public", !"private", !"private", !"public", !"private", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %old_node.addr = alloca ptr, align 8, !sec !{!"public"}
  %left_index.addr = alloca i64, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %right.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %j = alloca i64, align 8, !sec !{!"public"}
  %split = alloca i64, align 8, !sec !{!"public"}
  %k_prime = alloca i64, align 8, !sec !{!"public"}
  %new_node = alloca ptr, align 8, !sec !{!"public"}
  %child = alloca ptr, align 8, !sec !{!"public"}
  %temp_keys = alloca ptr, align 8, !sec !{!"public"}
  %temp_pointers = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %old_node, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  store i64 %left_index, ptr %left_index.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %right, ptr %right.addr, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %add = add i64 %0, 1, !sec !{!"public"}
  %mul = mul i64 %add, 8, !sec !{!"public"}
  %call = call ptr @allocate_align64(i64 noundef %mul), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %1, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  call void @perror(ptr noundef @.str.33) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %2 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %mul1 = mul i64 %2, 8, !sec !{!"public"}
  %call2 = call ptr @allocate_align64(i64 noundef %mul1), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call2, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp eq ptr %3, null, !sec !{!"public"}
  br i1 %cmp3, label %if.then4, label %if.end5, !sec !{!"public"}

if.then4:                                         ; preds = %if.end, !sec !{!"public"}
  call void @perror(ptr noundef @.str.34) #9, !sec !{!"call", !"void", !{!"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.end5:                                          ; preds = %if.end, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5, !sec !{!"public"}
  %4 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %add6 = add i64 %6, 1, !sec !{!"public"}
  %cmp7 = icmp ult i64 %4, %add6, !sec !{!"public"}
  br i1 %cmp7, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %7 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr %left_index.addr, align 8, !sec !{!"public", !"public"}
  %add8 = add i64 %8, 1, !sec !{!"public"}
  %cmp9 = icmp eq i64 %7, %add8, !sec !{!"public"}
  br i1 %cmp9, label %if.then10, label %if.end11, !sec !{!"public"}

if.then10:                                        ; preds = %for.body, !sec !{!"public"}
  %9 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %9, 1, !sec !{!"public"}
  store i64 %inc, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %for.body, !sec !{!"public"}
  %10 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %11, i64 %12, !sec !{!"public", !"public", !"public"}
  %13 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %15 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx12 = getelementptr inbounds ptr, ptr %14, i64 %15, !sec !{!"public", !"public", !"public"}
  store ptr %13, ptr %arrayidx12, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %if.end11, !sec !{!"public"}
  %16 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc13 = add i64 %16, 1, !sec !{!"public"}
  store i64 %inc13, ptr %i, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc14 = add i64 %17, 1, !sec !{!"public"}
  store i64 %inc14, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !36

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc25, %for.end, !sec !{!"public"}
  %18 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %num_keys16 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load i64, ptr %num_keys16, align 8, !sec !{!"public", !"public"}
  %cmp17 = icmp ult i64 %18, %20, !sec !{!"public"}
  br i1 %cmp17, label %for.body18, label %for.end28, !sec !{!"public"}

for.body18:                                       ; preds = %for.cond15, !sec !{!"public"}
  %21 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %22 = load i64, ptr %left_index.addr, align 8, !sec !{!"public", !"public"}
  %cmp19 = icmp eq i64 %21, %22, !sec !{!"public"}
  br i1 %cmp19, label %if.then20, label %if.end22, !sec !{!"public"}

if.then20:                                        ; preds = %for.body18, !sec !{!"public"}
  %23 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc21 = add i64 %23, 1, !sec !{!"public"}
  store i64 %inc21, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %for.body18, !sec !{!"public"}
  %24 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %25 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %26 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx23 = getelementptr inbounds i64, ptr %25, i64 %26, !sec !{!"public", !"public", !"public"}
  %27 = load i64, ptr %arrayidx23, align 8, !sec !{!"public", !"public"}
  %28 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %29 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx24 = getelementptr inbounds i64, ptr %28, i64 %29, !sec !{!"public", !"public", !"public"}
  store i64 %27, ptr %arrayidx24, align 8, !sec !{!"public", !"public"}
  br label %for.inc25

for.inc25:                                        ; preds = %if.end22, !sec !{!"public"}
  %30 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc26 = add i64 %30, 1, !sec !{!"public"}
  store i64 %inc26, ptr %i, align 8, !sec !{!"public", !"public"}
  %31 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc27 = add i64 %31, 1, !sec !{!"public"}
  store i64 %inc27, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond15, !llvm.loop !37

for.end28:                                        ; preds = %for.cond15, !sec !{!"public"}
  %32 = load ptr, ptr %right.addr, align 8, !sec !{!"public", !"public"}
  %33 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %34 = load i64, ptr %left_index.addr, align 8, !sec !{!"public", !"public"}
  %add29 = add i64 %34, 1, !sec !{!"public"}
  %arrayidx30 = getelementptr inbounds ptr, ptr %33, i64 %add29, !sec !{!"public", !"public", !"public"}
  store ptr %32, ptr %arrayidx30, align 8, !sec !{!"public", !"public"}
  %35 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %36 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %37 = load i64, ptr %left_index.addr, align 8, !sec !{!"public", !"public"}
  %arrayidx31 = getelementptr inbounds i64, ptr %36, i64 %37, !sec !{!"public", !"public", !"public"}
  store i64 %35, ptr %arrayidx31, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %call32 = call i64 @cut(i64 noundef %38), !sec !{!"call", !"public", !{!"public"}}
  store i64 %call32, ptr %split, align 8, !sec !{!"public", !"public"}
  %call33 = call ptr @make_node(), !sec !{!"call", !"public", !{}}
  store ptr %call33, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %39 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %num_keys34 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  store i64 0, ptr %num_keys34, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc46, %for.end28, !sec !{!"public"}
  %40 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %41 = load i64, ptr %split, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %41, 1, !sec !{!"public"}
  %cmp36 = icmp ult i64 %40, %sub, !sec !{!"public"}
  br i1 %cmp36, label %for.body37, label %for.end48, !sec !{!"public"}

for.body37:                                       ; preds = %for.cond35, !sec !{!"public"}
  %42 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %43 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx38 = getelementptr inbounds ptr, ptr %42, i64 %43, !sec !{!"public", !"public", !"public"}
  %44 = load ptr, ptr %arrayidx38, align 8, !sec !{!"public", !"public"}
  %45 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %pointers39 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %46 = load ptr, ptr %pointers39, align 8, !sec !{!"public", !"public"}
  %47 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx40 = getelementptr inbounds ptr, ptr %46, i64 %47, !sec !{!"public", !"public", !"public"}
  store ptr %44, ptr %arrayidx40, align 8, !sec !{!"public", !"public"}
  %48 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %49 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx41 = getelementptr inbounds i64, ptr %48, i64 %49, !sec !{!"public", !"public", !"public"}
  %50 = load i64, ptr %arrayidx41, align 8, !sec !{!"public", !"public"}
  %51 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %keys42 = getelementptr inbounds %struct.node, ptr %51, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %52 = load ptr, ptr %keys42, align 8, !sec !{!"public", !"public"}
  %53 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx43 = getelementptr inbounds i64, ptr %52, i64 %53, !sec !{!"public", !"public", !"public"}
  store i64 %50, ptr %arrayidx43, align 8, !sec !{!"public", !"public"}
  %54 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %num_keys44 = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %55 = load i64, ptr %num_keys44, align 8, !sec !{!"public", !"public"}
  %inc45 = add i64 %55, 1, !sec !{!"public"}
  store i64 %inc45, ptr %num_keys44, align 8, !sec !{!"public", !"public"}
  br label %for.inc46

for.inc46:                                        ; preds = %for.body37, !sec !{!"public"}
  %56 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc47 = add i64 %56, 1, !sec !{!"public"}
  store i64 %inc47, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond35, !llvm.loop !38

for.end48:                                        ; preds = %for.cond35, !sec !{!"public"}
  %57 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %58 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx49 = getelementptr inbounds ptr, ptr %57, i64 %58, !sec !{!"public", !"public", !"public"}
  %59 = load ptr, ptr %arrayidx49, align 8, !sec !{!"public", !"public"}
  %60 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %pointers50 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %61 = load ptr, ptr %pointers50, align 8, !sec !{!"public", !"public"}
  %62 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx51 = getelementptr inbounds ptr, ptr %61, i64 %62, !sec !{!"public", !"public", !"public"}
  store ptr %59, ptr %arrayidx51, align 8, !sec !{!"public", !"public"}
  %63 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %64 = load i64, ptr %split, align 8, !sec !{!"public", !"public"}
  %sub52 = sub i64 %64, 1, !sec !{!"public"}
  %arrayidx53 = getelementptr inbounds i64, ptr %63, i64 %sub52, !sec !{!"public", !"public", !"public"}
  %65 = load i64, ptr %arrayidx53, align 8, !sec !{!"public", !"public"}
  store i64 %65, ptr %k_prime, align 8, !sec !{!"public", !"public"}
  %66 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc54 = add i64 %66, 1, !sec !{!"public"}
  store i64 %inc54, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc66, %for.end48, !sec !{!"public"}
  %67 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %68 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %cmp56 = icmp ult i64 %67, %68, !sec !{!"public"}
  br i1 %cmp56, label %for.body57, label %for.end69, !sec !{!"public"}

for.body57:                                       ; preds = %for.cond55, !sec !{!"public"}
  %69 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %70 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx58 = getelementptr inbounds ptr, ptr %69, i64 %70, !sec !{!"public", !"public", !"public"}
  %71 = load ptr, ptr %arrayidx58, align 8, !sec !{!"public", !"public"}
  %72 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %pointers59 = getelementptr inbounds %struct.node, ptr %72, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %73 = load ptr, ptr %pointers59, align 8, !sec !{!"public", !"public"}
  %74 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx60 = getelementptr inbounds ptr, ptr %73, i64 %74, !sec !{!"public", !"public", !"public"}
  store ptr %71, ptr %arrayidx60, align 8, !sec !{!"public", !"public"}
  %75 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  %76 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx61 = getelementptr inbounds i64, ptr %75, i64 %76, !sec !{!"public", !"public", !"public"}
  %77 = load i64, ptr %arrayidx61, align 8, !sec !{!"public", !"public"}
  %78 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %keys62 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %79 = load ptr, ptr %keys62, align 8, !sec !{!"public", !"public"}
  %80 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx63 = getelementptr inbounds i64, ptr %79, i64 %80, !sec !{!"public", !"public", !"public"}
  store i64 %77, ptr %arrayidx63, align 8, !sec !{!"public", !"public"}
  %81 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %num_keys64 = getelementptr inbounds %struct.node, ptr %81, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %82 = load i64, ptr %num_keys64, align 8, !sec !{!"public", !"public"}
  %inc65 = add i64 %82, 1, !sec !{!"public"}
  store i64 %inc65, ptr %num_keys64, align 8, !sec !{!"public", !"public"}
  br label %for.inc66

for.inc66:                                        ; preds = %for.body57, !sec !{!"public"}
  %83 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc67 = add i64 %83, 1, !sec !{!"public"}
  store i64 %inc67, ptr %i, align 8, !sec !{!"public", !"public"}
  %84 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc68 = add i64 %84, 1, !sec !{!"public"}
  store i64 %inc68, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond55, !llvm.loop !39

for.end69:                                        ; preds = %for.cond55, !sec !{!"public"}
  %85 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  %86 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx70 = getelementptr inbounds ptr, ptr %85, i64 %86, !sec !{!"public", !"public", !"public"}
  %87 = load ptr, ptr %arrayidx70, align 8, !sec !{!"public", !"public"}
  %88 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %pointers71 = getelementptr inbounds %struct.node, ptr %88, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %89 = load ptr, ptr %pointers71, align 8, !sec !{!"public", !"public"}
  %90 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx72 = getelementptr inbounds ptr, ptr %89, i64 %90, !sec !{!"public", !"public", !"public"}
  store ptr %87, ptr %arrayidx72, align 8, !sec !{!"public", !"public"}
  %91 = load ptr, ptr %temp_pointers, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %91) #8, !sec !{!"free", !"public"}
  %92 = load ptr, ptr %temp_keys, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %92) #8, !sec !{!"free", !"public"}
  %93 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %93, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %94 = load ptr, ptr %parent, align 8, !sec !{!"public", !"public"}
  %95 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %parent73 = getelementptr inbounds %struct.node, ptr %95, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %94, ptr %parent73, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc81, %for.end69, !sec !{!"public"}
  %96 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %97 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %num_keys75 = getelementptr inbounds %struct.node, ptr %97, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %98 = load i64, ptr %num_keys75, align 8, !sec !{!"public", !"public"}
  %cmp76 = icmp ule i64 %96, %98, !sec !{!"public"}
  br i1 %cmp76, label %for.body77, label %for.end83, !sec !{!"public"}

for.body77:                                       ; preds = %for.cond74, !sec !{!"public"}
  %99 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %pointers78 = getelementptr inbounds %struct.node, ptr %99, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %100 = load ptr, ptr %pointers78, align 8, !sec !{!"public", !"public"}
  %101 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx79 = getelementptr inbounds ptr, ptr %100, i64 %101, !sec !{!"public", !"public", !"public"}
  %102 = load ptr, ptr %arrayidx79, align 8, !sec !{!"public", !"public"}
  store ptr %102, ptr %child, align 8, !sec !{!"public", !"public"}
  %103 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %104 = load ptr, ptr %child, align 8, !sec !{!"public", !"public"}
  %parent80 = getelementptr inbounds %struct.node, ptr %104, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %103, ptr %parent80, align 8, !sec !{!"public", !"public"}
  br label %for.inc81

for.inc81:                                        ; preds = %for.body77, !sec !{!"public"}
  %105 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc82 = add i64 %105, 1, !sec !{!"public"}
  store i64 %inc82, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond74, !llvm.loop !40

for.end83:                                        ; preds = %for.cond74, !sec !{!"public"}
  %106 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %107 = load ptr, ptr %old_node.addr, align 8, !sec !{!"public", !"public"}
  %108 = load i64, ptr %k_prime, align 8, !sec !{!"public", !"public"}
  %109 = load ptr, ptr %new_node, align 8, !sec !{!"public", !"public"}
  %call84 = call ptr @insert_into_parent(ptr noundef %106, ptr noundef %107, i64 noundef %108, ptr noundef %109), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  ret ptr %call84, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert_into_new_root(ptr noundef %left, i64 noundef %key, ptr noundef %right) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %left.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %right.addr = alloca ptr, align 8, !sec !{!"public"}
  %root = alloca ptr, align 8, !sec !{!"public"}
  store ptr %left, ptr %left.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %right, ptr %right.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr @make_node(), !sec !{!"call", !"public", !{}}
  store ptr %call, ptr %root, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %2, i64 0, !sec !{!"public", !"public", !"public"}
  store i64 %0, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %left.addr, align 8, !sec !{!"public", !"public"}
  %4 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx1 = getelementptr inbounds ptr, ptr %5, i64 0, !sec !{!"public", !"public", !"public"}
  store ptr %3, ptr %arrayidx1, align 8, !sec !{!"public", !"public"}
  %6 = load ptr, ptr %right.addr, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %pointers2 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %8 = load ptr, ptr %pointers2, align 8, !sec !{!"public", !"public"}
  %arrayidx3 = getelementptr inbounds ptr, ptr %8, i64 1, !sec !{!"public", !"public", !"public"}
  store ptr %6, ptr %arrayidx3, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %10 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %10, 1, !sec !{!"public"}
  store i64 %inc, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %parent, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %13 = load ptr, ptr %left.addr, align 8, !sec !{!"public", !"public"}
  %parent4 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %12, ptr %parent4, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %15 = load ptr, ptr %right.addr, align 8, !sec !{!"public", !"public"}
  %parent5 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %14, ptr %parent5, align 8, !sec !{!"public", !"public"}
  %16 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  ret ptr %16, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @start_new_tree(i64 noundef %key, ptr noundef %pointer) #0 !sec !{!"public", !"public", !{!"public", !"public"}} {
entry:		; !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %pointer.addr = alloca ptr, align 8, !sec !{!"public"}
  %root = alloca ptr, align 8, !sec !{!"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %pointer, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr @make_leaf(), !sec !{!"call", !"public", !{}}
  store ptr %call, ptr %root, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %1 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %2, i64 0, !sec !{!"public", !"public", !"public"}
  store i64 %0, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %4 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx1 = getelementptr inbounds ptr, ptr %5, i64 0, !sec !{!"public", !"public", !"public"}
  store ptr %3, ptr %arrayidx1, align 8, !sec !{!"public", !"public"}
  %6 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %pointers2 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load ptr, ptr %pointers2, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %8, 1, !sec !{!"public"}
  %arrayidx3 = getelementptr inbounds ptr, ptr %7, i64 %sub, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx3, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %parent, align 8, !sec !{!"public", !"public"}
  %10 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %11, 1, !sec !{!"public"}
  store i64 %inc, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  ret ptr %12, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @insert(ptr noundef %root, i64 noundef %key, i64 noundef %value) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %value.addr = alloca i64, align 8, !sec !{!"public"}
  %record_pointer = alloca ptr, align 8, !sec !{!"public"}
  %leaf = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store i64 %value, ptr %value.addr, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"public"}
  %call = call ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext false, ptr noundef null), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"public"}}
  store ptr %call, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ne ptr %2, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %3 = load i64, ptr %value.addr, align 8, !sec !{!"public", !"public"}
  %4 = load ptr, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %value1 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %3, ptr %value1, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %5, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %6 = load i64, ptr %value.addr, align 8, !sec !{!"public", !"public"}
  %call2 = call ptr @make_record(i64 noundef %6), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call2, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp eq ptr %7, null, !sec !{!"public"}
  br i1 %cmp3, label %if.then4, label %if.end6, !sec !{!"public"}

if.then4:                                         ; preds = %if.end, !sec !{!"public"}
  %8 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %call5 = call ptr @start_new_tree(i64 noundef %8, ptr noundef %9), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %call5, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end6:                                          ; preds = %if.end, !sec !{!"public"}
  %10 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"public"}
  %call7 = call ptr @find_leaf(ptr noundef %10, i64 noundef %11, i1 noundef zeroext false), !sec !{!"call", !"public", !{!"public", !"private", !"private"}}
  store ptr %call7, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %13 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %14 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %14, 1, !sec !{!"public"}
  %cmp8 = icmp ult i64 %13, %sub, !sec !{!"public"}
  br i1 %cmp8, label %if.then9, label %if.end11, !sec !{!"public"}

if.then9:                                         ; preds = %if.end6, !sec !{!"public"}
  %15 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %16 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %17 = load ptr, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %call10 = call ptr @insert_into_leaf(ptr noundef %15, i64 noundef %16, ptr noundef %17), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  store ptr %call10, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %18 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %18, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end11:                                         ; preds = %if.end6, !sec !{!"public"}
  %19 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %20 = load ptr, ptr %leaf, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %22 = load ptr, ptr %record_pointer, align 8, !sec !{!"public", !"public"}
  %call12 = call ptr @insert_into_leaf_after_splitting(ptr noundef %19, ptr noundef %20, i64 noundef %21, ptr noundef %22), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  store ptr %call12, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.end11, %if.then9, %if.then4, %if.then, !sec !{!"public"}
  %23 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %23, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_neighbor_index(ptr noundef %n) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"private"}
  %i = alloca i64, align 8, !sec !{!"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry, !sec !{!"public"}
  %0 = load i64, ptr %i, align 8, !sec !{!"private", !"public"}
  %1 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %parent = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %2 = load ptr, ptr %parent, align 8, !sec !{!"private", !"private"}
  %num_keys = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 4, !sec !{!"private", !"private", !"public", !"public"}
  %3 = load i64, ptr %num_keys, align 8, !sec !{!"private", !"private"}
  %cmp = icmp ule i64 %0, %3, !sec !{!"private"}
  br i1 %cmp, label %for.body, label %for.end, !sec !{!"private"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %4 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %parent1 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 2, !sec !{!"private", !"private", !"public", !"public"}
  %5 = load ptr, ptr %parent1, align 8, !sec !{!"private", !"private"}
  %pointers = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 0, !sec !{!"private", !"private", !"public", !"public"}
  %6 = load ptr, ptr %pointers, align 8, !sec !{!"private", !"private"}
  %7 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %6, i64 %7, !sec !{!"private", !"private", !"public"}
  %8 = load ptr, ptr %arrayidx, align 8, !sec !{!"private", !"private"}
  %9 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %cmp2 = icmp eq ptr %8, %9, !sec !{!"private"}
  br i1 %cmp2, label %if.then, label %if.end, !sec !{!"private"}

if.then:                                          ; preds = %for.body, !sec !{!"public"}
  %10 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %10, 1, !sec !{!"public"}
  ret i64 %sub, !sec !{!"public"}

if.end:                                           ; preds = %for.body, !sec !{!"public"}
  br label %for.inc

for.inc:                                          ; preds = %if.end, !sec !{!"public"}
  %11 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %11, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !41

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.35), !sec !{!"call", !"public", !{!"public"}}
  %12 = load ptr, ptr %n.addr, align 8, !sec !{!"private", !"private"}
  %13 = ptrtoint ptr %12 to i64, !sec !{!"private"}
  %d13 = call i64 @declassify.i64(i64 noundef %13), !sec !{!"declassify", !"private", !"public"}
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.36, i64 noundef %d13), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable
}

define dso_local i64 @declassify.i64(i64 noundef %0) #0 !sec !{!"public", !"public", !{!"private"}} {
  ret i64 %0, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @remove_entry_from_node(ptr noundef %n, i64 noundef %key, ptr noundef %pointer) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %pointer.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %num_pointers = alloca i64, align 8, !sec !{!"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %pointer, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry, !sec !{!"public"}
  %0 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %1 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %2 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %1, i64 %2, !sec !{!"public", !"public", !"public"}
  %3 = load i64, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %4 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ne i64 %3, %4, !sec !{!"public"}
  br i1 %cmp, label %while.body, label %while.end, !sec !{!"public"}

while.body:                                       ; preds = %while.cond, !sec !{!"public"}
  %5 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %5, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond, !llvm.loop !42

while.end:                                        ; preds = %while.cond, !sec !{!"public"}
  %6 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc1 = add i64 %6, 1, !sec !{!"public"}
  store i64 %inc1, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end, !sec !{!"public"}
  %7 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %9 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp2 = icmp ult i64 %7, %9, !sec !{!"public"}
  br i1 %cmp2, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %10 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys3 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load ptr, ptr %keys3, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx4 = getelementptr inbounds i64, ptr %11, i64 %12, !sec !{!"public", !"public", !"public"}
  %13 = load i64, ptr %arrayidx4, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys5 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %15 = load ptr, ptr %keys5, align 8, !sec !{!"public", !"public"}
  %16 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %16, 1, !sec !{!"public"}
  %arrayidx6 = getelementptr inbounds i64, ptr %15, i64 %sub, !sec !{!"public", !"public", !"public"}
  store i64 %13, ptr %arrayidx6, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc7 = add i64 %17, 1, !sec !{!"public"}
  store i64 %inc7, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !43

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %18 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %19 to i1, !sec !{!"public"}
  br i1 %tobool, label %cond.true, label %cond.false, !sec !{!"public"}

cond.true:                                        ; preds = %for.end, !sec !{!"public"}
  %20 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys8 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %21 = load i64, ptr %num_keys8, align 8, !sec !{!"public", !"public"}
  br label %cond.end

cond.false:                                       ; preds = %for.end, !sec !{!"public"}
  %22 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys9 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %23 = load i64, ptr %num_keys9, align 8, !sec !{!"public", !"public"}
  %add = add i64 %23, 1, !sec !{!"public"}
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true, !sec !{!"public"}
  %cond = phi i64 [ %21, %cond.true ], [ %add, %cond.false ], !sec !{!"public", !"public", !"public"}
  store i64 %cond, ptr %num_pointers, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond10

while.cond10:                                     ; preds = %while.body13, %cond.end, !sec !{!"public"}
  %24 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %25 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %26 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx11 = getelementptr inbounds ptr, ptr %25, i64 %26, !sec !{!"public", !"public", !"public"}
  %27 = load ptr, ptr %arrayidx11, align 8, !sec !{!"public", !"public"}
  %28 = load ptr, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %cmp12 = icmp ne ptr %27, %28, !sec !{!"public"}
  br i1 %cmp12, label %while.body13, label %while.end15, !sec !{!"public"}

while.body13:                                     ; preds = %while.cond10, !sec !{!"public"}
  %29 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc14 = add i64 %29, 1, !sec !{!"public"}
  store i64 %inc14, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %while.cond10, !llvm.loop !44

while.end15:                                      ; preds = %while.cond10, !sec !{!"public"}
  %30 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc16 = add i64 %30, 1, !sec !{!"public"}
  store i64 %inc16, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc25, %while.end15, !sec !{!"public"}
  %31 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %num_pointers, align 8, !sec !{!"public", !"public"}
  %cmp18 = icmp ult i64 %31, %32, !sec !{!"public"}
  br i1 %cmp18, label %for.body19, label %for.end27, !sec !{!"public"}

for.body19:                                       ; preds = %for.cond17, !sec !{!"public"}
  %33 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers20 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load ptr, ptr %pointers20, align 8, !sec !{!"public", !"public"}
  %35 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx21 = getelementptr inbounds ptr, ptr %34, i64 %35, !sec !{!"public", !"public", !"public"}
  %36 = load ptr, ptr %arrayidx21, align 8, !sec !{!"public", !"public"}
  %37 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers22 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %38 = load ptr, ptr %pointers22, align 8, !sec !{!"public", !"public"}
  %39 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub23 = sub i64 %39, 1, !sec !{!"public"}
  %arrayidx24 = getelementptr inbounds ptr, ptr %38, i64 %sub23, !sec !{!"public", !"public", !"public"}
  store ptr %36, ptr %arrayidx24, align 8, !sec !{!"public", !"public"}
  br label %for.inc25

for.inc25:                                        ; preds = %for.body19, !sec !{!"public"}
  %40 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc26 = add i64 %40, 1, !sec !{!"public"}
  store i64 %inc26, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond17, !llvm.loop !45

for.end27:                                        ; preds = %for.cond17, !sec !{!"public"}
  %41 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys28 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %42 = load i64, ptr %num_keys28, align 8, !sec !{!"public", !"public"}
  %dec = add i64 %42, -1, !sec !{!"public"}
  store i64 %dec, ptr %num_keys28, align 8, !sec !{!"public", !"public"}
  %43 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf29 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %44 = load i8, ptr %is_leaf29, align 8, !sec !{!"public", !"public"}
  %tobool30 = trunc i8 %44 to i1, !sec !{!"public"}
  br i1 %tobool30, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %for.end27, !sec !{!"public"}
  %45 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys31 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %46 = load i64, ptr %num_keys31, align 8, !sec !{!"public", !"public"}
  store i64 %46, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc38, %if.then, !sec !{!"public"}
  %47 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %48 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub33 = sub i64 %48, 1, !sec !{!"public"}
  %cmp34 = icmp ult i64 %47, %sub33, !sec !{!"public"}
  br i1 %cmp34, label %for.body35, label %for.end40, !sec !{!"public"}

for.body35:                                       ; preds = %for.cond32, !sec !{!"public"}
  %49 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers36 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %50 = load ptr, ptr %pointers36, align 8, !sec !{!"public", !"public"}
  %51 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx37 = getelementptr inbounds ptr, ptr %50, i64 %51, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx37, align 8, !sec !{!"public", !"public"}
  br label %for.inc38

for.inc38:                                        ; preds = %for.body35, !sec !{!"public"}
  %52 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc39 = add i64 %52, 1, !sec !{!"public"}
  store i64 %inc39, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond32, !llvm.loop !46

for.end40:                                        ; preds = %for.cond32, !sec !{!"public"}
  br label %if.end

if.else:                                          ; preds = %for.end27, !sec !{!"public"}
  %53 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys41 = getelementptr inbounds %struct.node, ptr %53, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %54 = load i64, ptr %num_keys41, align 8, !sec !{!"public", !"public"}
  %add42 = add i64 %54, 1, !sec !{!"public"}
  store i64 %add42, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc48, %if.else, !sec !{!"public"}
  %55 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %56 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %cmp44 = icmp ult i64 %55, %56, !sec !{!"public"}
  br i1 %cmp44, label %for.body45, label %for.end50, !sec !{!"public"}

for.body45:                                       ; preds = %for.cond43, !sec !{!"public"}
  %57 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers46 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %58 = load ptr, ptr %pointers46, align 8, !sec !{!"public", !"public"}
  %59 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx47 = getelementptr inbounds ptr, ptr %58, i64 %59, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx47, align 8, !sec !{!"public", !"public"}
  br label %for.inc48

for.inc48:                                        ; preds = %for.body45, !sec !{!"public"}
  %60 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc49 = add i64 %60, 1, !sec !{!"public"}
  store i64 %inc49, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond43, !llvm.loop !47

for.end50:                                        ; preds = %for.cond43, !sec !{!"public"}
  br label %if.end

if.end:                                           ; preds = %for.end50, %for.end40, !sec !{!"public"}
  %61 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %61, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @adjust_root(ptr noundef %root) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %new_root = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %1 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ugt i64 %1, 0, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %2 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %3 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %4 to i1, !sec !{!"public"}
  br i1 %tobool, label %if.else, label %if.then1, !sec !{!"public"}

if.then1:                                         ; preds = %if.end, !sec !{!"public"}
  %5 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %6, i64 0, !sec !{!"public", !"public", !"public"}
  %7 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  store ptr %7, ptr %new_root, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %new_root, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr null, ptr %parent, align 8, !sec !{!"public", !"public"}
  br label %if.end2

if.else:                                          ; preds = %if.end, !sec !{!"public"}
  store ptr null, ptr %new_root, align 8, !sec !{!"public", !"public"}
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1, !sec !{!"public"}
  %9 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %10 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %10) #8, !sec !{!"free", !"public"}
  %11 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %pointers3 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %12 = load ptr, ptr %pointers3, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %12) #8, !sec !{!"free", !"public"}
  %13 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  call void @free_node(ptr noundef %13), !sec !{!"call", !"void", !{!"public"}}
  %14 = load ptr, ptr %new_root, align 8, !sec !{!"public", !"public"}
  store ptr %14, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.end2, %if.then, !sec !{!"public"}
  %15 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %15, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @coalesce_nodes(ptr noundef %root, ptr noundef %n, ptr noundef %neighbor, i64 noundef %neighbor_index, i64 noundef %k_prime) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"public"}
  %neighbor.addr = alloca ptr, align 8, !sec !{!"public"}
  %neighbor_index.addr = alloca i64, align 8, !sec !{!"public"}
  %k_prime.addr = alloca i64, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %j = alloca i64, align 8, !sec !{!"public"}
  %neighbor_insertion_index = alloca i64, align 8, !sec !{!"public"}
  %n_end = alloca i64, align 8, !sec !{!"public"}
  %tmp = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store ptr %neighbor, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  store i64 %neighbor_index, ptr %neighbor_index.addr, align 8, !sec !{!"public", !"public"}
  store i64 %k_prime, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %neighbor_index.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq i64 %0, -1, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store ptr %1, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  store ptr %2, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %tmp, align 8, !sec !{!"public", !"public"}
  store ptr %3, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.end:                                           ; preds = %if.then, %entry, !sec !{!"public"}
  %4 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %5 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  store i64 %5, ptr %neighbor_insertion_index, align 8, !sec !{!"public", !"public"}
  %6 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %7 to i1, !sec !{!"public"}
  br i1 %tobool, label %if.else, label %if.then1, !sec !{!"public"}

if.then1:                                         ; preds = %if.end, !sec !{!"public"}
  %8 = load i64, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %10 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %11 = load i64, ptr %neighbor_insertion_index, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %10, i64 %11, !sec !{!"public", !"public", !"public"}
  store i64 %8, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %12 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys2 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %13 = load i64, ptr %num_keys2, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %13, 1, !sec !{!"public"}
  store i64 %inc, ptr %num_keys2, align 8, !sec !{!"public", !"public"}
  %14 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys3 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %15 = load i64, ptr %num_keys3, align 8, !sec !{!"public", !"public"}
  store i64 %15, ptr %n_end, align 8, !sec !{!"public", !"public"}
  %16 = load i64, ptr %neighbor_insertion_index, align 8, !sec !{!"public", !"public"}
  %add = add i64 %16, 1, !sec !{!"public"}
  store i64 %add, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then1, !sec !{!"public"}
  %17 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %18 = load i64, ptr %n_end, align 8, !sec !{!"public", !"public"}
  %cmp4 = icmp ult i64 %17, %18, !sec !{!"public"}
  br i1 %cmp4, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %19 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys5 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load ptr, ptr %keys5, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx6 = getelementptr inbounds i64, ptr %20, i64 %21, !sec !{!"public", !"public", !"public"}
  %22 = load i64, ptr %arrayidx6, align 8, !sec !{!"public", !"public"}
  %23 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys7 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %24 = load ptr, ptr %keys7, align 8, !sec !{!"public", !"public"}
  %25 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx8 = getelementptr inbounds i64, ptr %24, i64 %25, !sec !{!"public", !"public", !"public"}
  store i64 %22, ptr %arrayidx8, align 8, !sec !{!"public", !"public"}
  %26 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %27 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %28 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx9 = getelementptr inbounds ptr, ptr %27, i64 %28, !sec !{!"public", !"public", !"public"}
  %29 = load ptr, ptr %arrayidx9, align 8, !sec !{!"public", !"public"}
  %30 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers10 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load ptr, ptr %pointers10, align 8, !sec !{!"public", !"public"}
  %32 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx11 = getelementptr inbounds ptr, ptr %31, i64 %32, !sec !{!"public", !"public", !"public"}
  store ptr %29, ptr %arrayidx11, align 8, !sec !{!"public", !"public"}
  %33 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys12 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load i64, ptr %num_keys12, align 8, !sec !{!"public", !"public"}
  %inc13 = add i64 %34, 1, !sec !{!"public"}
  store i64 %inc13, ptr %num_keys12, align 8, !sec !{!"public", !"public"}
  %35 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys14 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %36 = load i64, ptr %num_keys14, align 8, !sec !{!"public", !"public"}
  %dec = add i64 %36, -1, !sec !{!"public"}
  store i64 %dec, ptr %num_keys14, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %37 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc15 = add i64 %37, 1, !sec !{!"public"}
  store i64 %inc15, ptr %i, align 8, !sec !{!"public", !"public"}
  %38 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc16 = add i64 %38, 1, !sec !{!"public"}
  store i64 %inc16, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !48

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %39 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers17 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %40 = load ptr, ptr %pointers17, align 8, !sec !{!"public", !"public"}
  %41 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx18 = getelementptr inbounds ptr, ptr %40, i64 %41, !sec !{!"public", !"public", !"public"}
  %42 = load ptr, ptr %arrayidx18, align 8, !sec !{!"public", !"public"}
  %43 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers19 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %44 = load ptr, ptr %pointers19, align 8, !sec !{!"public", !"public"}
  %45 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx20 = getelementptr inbounds ptr, ptr %44, i64 %45, !sec !{!"public", !"public", !"public"}
  store ptr %42, ptr %arrayidx20, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc28, %for.end, !sec !{!"public"}
  %46 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %47 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys22 = getelementptr inbounds %struct.node, ptr %47, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %48 = load i64, ptr %num_keys22, align 8, !sec !{!"public", !"public"}
  %add23 = add i64 %48, 1, !sec !{!"public"}
  %cmp24 = icmp ult i64 %46, %add23, !sec !{!"public"}
  br i1 %cmp24, label %for.body25, label %for.end30, !sec !{!"public"}

for.body25:                                       ; preds = %for.cond21, !sec !{!"public"}
  %49 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers26 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %50 = load ptr, ptr %pointers26, align 8, !sec !{!"public", !"public"}
  %51 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx27 = getelementptr inbounds ptr, ptr %50, i64 %51, !sec !{!"public", !"public", !"public"}
  %52 = load ptr, ptr %arrayidx27, align 8, !sec !{!"public", !"public"}
  store ptr %52, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %53 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %54 = load ptr, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %53, ptr %parent, align 8, !sec !{!"public", !"public"}
  br label %for.inc28

for.inc28:                                        ; preds = %for.body25, !sec !{!"public"}
  %55 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc29 = add i64 %55, 1, !sec !{!"public"}
  store i64 %inc29, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond21, !llvm.loop !49

for.end30:                                        ; preds = %for.cond21, !sec !{!"public"}
  br label %if.end54

if.else:                                          ; preds = %if.end, !sec !{!"public"}
  %56 = load i64, ptr %neighbor_insertion_index, align 8, !sec !{!"public", !"public"}
  store i64 %56, ptr %i, align 8, !sec !{!"public", !"public"}
  store i64 0, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc45, %if.else, !sec !{!"public"}
  %57 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %58 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys32 = getelementptr inbounds %struct.node, ptr %58, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %59 = load i64, ptr %num_keys32, align 8, !sec !{!"public", !"public"}
  %cmp33 = icmp ult i64 %57, %59, !sec !{!"public"}
  br i1 %cmp33, label %for.body34, label %for.end48, !sec !{!"public"}

for.body34:                                       ; preds = %for.cond31, !sec !{!"public"}
  %60 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys35 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %61 = load ptr, ptr %keys35, align 8, !sec !{!"public", !"public"}
  %62 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx36 = getelementptr inbounds i64, ptr %61, i64 %62, !sec !{!"public", !"public", !"public"}
  %63 = load i64, ptr %arrayidx36, align 8, !sec !{!"public", !"public"}
  %64 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys37 = getelementptr inbounds %struct.node, ptr %64, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %65 = load ptr, ptr %keys37, align 8, !sec !{!"public", !"public"}
  %66 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx38 = getelementptr inbounds i64, ptr %65, i64 %66, !sec !{!"public", !"public", !"public"}
  store i64 %63, ptr %arrayidx38, align 8, !sec !{!"public", !"public"}
  %67 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers39 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %68 = load ptr, ptr %pointers39, align 8, !sec !{!"public", !"public"}
  %69 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx40 = getelementptr inbounds ptr, ptr %68, i64 %69, !sec !{!"public", !"public", !"public"}
  %70 = load ptr, ptr %arrayidx40, align 8, !sec !{!"public", !"public"}
  %71 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers41 = getelementptr inbounds %struct.node, ptr %71, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %72 = load ptr, ptr %pointers41, align 8, !sec !{!"public", !"public"}
  %73 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx42 = getelementptr inbounds ptr, ptr %72, i64 %73, !sec !{!"public", !"public", !"public"}
  store ptr %70, ptr %arrayidx42, align 8, !sec !{!"public", !"public"}
  %74 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys43 = getelementptr inbounds %struct.node, ptr %74, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %75 = load i64, ptr %num_keys43, align 8, !sec !{!"public", !"public"}
  %inc44 = add i64 %75, 1, !sec !{!"public"}
  store i64 %inc44, ptr %num_keys43, align 8, !sec !{!"public", !"public"}
  br label %for.inc45

for.inc45:                                        ; preds = %for.body34, !sec !{!"public"}
  %76 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc46 = add i64 %76, 1, !sec !{!"public"}
  store i64 %inc46, ptr %i, align 8, !sec !{!"public", !"public"}
  %77 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %inc47 = add i64 %77, 1, !sec !{!"public"}
  store i64 %inc47, ptr %j, align 8, !sec !{!"public", !"public"}
  br label %for.cond31, !llvm.loop !50

for.end48:                                        ; preds = %for.cond31, !sec !{!"public"}
  %78 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers49 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %79 = load ptr, ptr %pointers49, align 8, !sec !{!"public", !"public"}
  %80 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %80, 1, !sec !{!"public"}
  %arrayidx50 = getelementptr inbounds ptr, ptr %79, i64 %sub, !sec !{!"public", !"public", !"public"}
  %81 = load ptr, ptr %arrayidx50, align 8, !sec !{!"public", !"public"}
  %82 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers51 = getelementptr inbounds %struct.node, ptr %82, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %83 = load ptr, ptr %pointers51, align 8, !sec !{!"public", !"public"}
  %84 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub52 = sub i64 %84, 1, !sec !{!"public"}
  %arrayidx53 = getelementptr inbounds ptr, ptr %83, i64 %sub52, !sec !{!"public", !"public", !"public"}
  store ptr %81, ptr %arrayidx53, align 8, !sec !{!"public", !"public"}
  br label %if.end54

if.end54:                                         ; preds = %for.end48, %for.end30, !sec !{!"public"}
  %85 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %86 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent55 = getelementptr inbounds %struct.node, ptr %86, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %87 = load ptr, ptr %parent55, align 8, !sec !{!"public", !"public"}
  %88 = load i64, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %89 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr @delete_entry(ptr noundef %85, ptr noundef %87, i64 noundef %88, ptr noundef %89), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  store ptr %call, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %90 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys56 = getelementptr inbounds %struct.node, ptr %90, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %91 = load ptr, ptr %keys56, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %91) #8, !sec !{!"free", !"public"}
  %92 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers57 = getelementptr inbounds %struct.node, ptr %92, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %93 = load ptr, ptr %pointers57, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %93) #8, !sec !{!"free", !"public"}
  %94 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  call void @free_node(ptr noundef %94), !sec !{!"call", !"void", !{!"public"}}
  %95 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %95, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete_entry(ptr noundef %root, ptr noundef %n, i64 noundef %key, ptr noundef %pointer) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %retval = alloca ptr, align 8, !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %pointer.addr = alloca ptr, align 8, !sec !{!"public"}
  %min_keys = alloca i64, align 8, !sec !{!"public"}
  %neighbor = alloca ptr, align 8, !sec !{!"public"}
  %neighbor_index = alloca i64, align 8, !sec !{!"public"}
  %k_prime_index = alloca i64, align 8, !sec !{!"public"}
  %k_prime = alloca i64, align 8, !sec !{!"public"}
  %capacity = alloca i64, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr %pointer, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %pointer.addr, align 8, !sec !{!"public", !"public"}
  %call = call ptr @remove_entry_from_node(ptr noundef %0, i64 noundef %1, ptr noundef %2), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  store ptr %call, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %4 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %3, %4, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %5 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %call1 = call ptr @adjust_root(ptr noundef %5), !sec !{!"call", !"public", !{!"public"}}
  store ptr %call1, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end:                                           ; preds = %entry, !sec !{!"public"}
  %6 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %7 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %7 to i1, !sec !{!"public"}
  br i1 %tobool, label %cond.true, label %cond.false, !sec !{!"public"}

cond.true:                                        ; preds = %if.end, !sec !{!"public"}
  %8 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %8, 1, !sec !{!"public"}
  %call2 = call i64 @cut(i64 noundef %sub), !sec !{!"call", !"public", !{!"public"}}
  br label %cond.end

cond.false:                                       ; preds = %if.end, !sec !{!"public"}
  %9 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %call3 = call i64 @cut(i64 noundef %9), !sec !{!"call", !"public", !{!"public"}}
  %sub4 = sub i64 %call3, 1, !sec !{!"public"}
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true, !sec !{!"public"}
  %cond = phi i64 [ %call2, %cond.true ], [ %sub4, %cond.false ], !sec !{!"public", !"public", !"public"}
  store i64 %cond, ptr %min_keys, align 8, !sec !{!"public", !"public"}
  %10 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %min_keys, align 8, !sec !{!"public", !"public"}
  %cmp5 = icmp uge i64 %11, %12, !sec !{!"public"}
  br i1 %cmp5, label %if.then6, label %if.end7, !sec !{!"public"}

if.then6:                                         ; preds = %cond.end, !sec !{!"public"}
  %13 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %13, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.end7:                                          ; preds = %cond.end, !sec !{!"public"}
  %14 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %call8 = call i64 @get_neighbor_index(ptr noundef %14), !sec !{!"call", !"public", !{!"public"}}
  store i64 %call8, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %15 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %cmp9 = icmp eq i64 %15, -1, !sec !{!"public"}
  br i1 %cmp9, label %cond.true10, label %cond.false11, !sec !{!"public"}

cond.true10:                                      ; preds = %if.end7, !sec !{!"public"}
  br label %cond.end12

cond.false11:                                     ; preds = %if.end7, !sec !{!"public"}
  %16 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10, !sec !{!"public"}
  %cond13 = phi i64 [ 0, %cond.true10 ], [ %16, %cond.false11 ], !sec !{!"public", !"public", !"public"}
  store i64 %cond13, ptr %k_prime_index, align 8, !sec !{!"public", !"public"}
  %17 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %18 = load ptr, ptr %parent, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %20 = load i64, ptr %k_prime_index, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds i64, ptr %19, i64 %20, !sec !{!"public", !"public", !"public"}
  %21 = load i64, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  store i64 %21, ptr %k_prime, align 8, !sec !{!"public", !"public"}
  %22 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %cmp14 = icmp eq i64 %22, -1, !sec !{!"public"}
  br i1 %cmp14, label %cond.true15, label %cond.false18, !sec !{!"public"}

cond.true15:                                      ; preds = %cond.end12, !sec !{!"public"}
  %23 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent16 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %24 = load ptr, ptr %parent16, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %25 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %arrayidx17 = getelementptr inbounds ptr, ptr %25, i64 1, !sec !{!"public", !"public", !"public"}
  %26 = load ptr, ptr %arrayidx17, align 8, !sec !{!"public", !"public"}
  br label %cond.end22

cond.false18:                                     ; preds = %cond.end12, !sec !{!"public"}
  %27 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent19 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %28 = load ptr, ptr %parent19, align 8, !sec !{!"public", !"public"}
  %pointers20 = getelementptr inbounds %struct.node, ptr %28, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %29 = load ptr, ptr %pointers20, align 8, !sec !{!"public", !"public"}
  %30 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %arrayidx21 = getelementptr inbounds ptr, ptr %29, i64 %30, !sec !{!"public", !"public", !"public"}
  %31 = load ptr, ptr %arrayidx21, align 8, !sec !{!"public", !"public"}
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false18, %cond.true15, !sec !{!"public"}
  %cond23 = phi ptr [ %26, %cond.true15 ], [ %31, %cond.false18 ], !sec !{!"public", !"public", !"public"}
  store ptr %cond23, ptr %neighbor, align 8, !sec !{!"public", !"public"}
  %32 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf24 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %33 = load i8, ptr %is_leaf24, align 8, !sec !{!"public", !"public"}
  %tobool25 = trunc i8 %33 to i1, !sec !{!"public"}
  br i1 %tobool25, label %cond.true26, label %cond.false27, !sec !{!"public"}

cond.true26:                                      ; preds = %cond.end22, !sec !{!"public"}
  %34 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  br label %cond.end29

cond.false27:                                     ; preds = %cond.end22, !sec !{!"public"}
  %35 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %sub28 = sub i64 %35, 1, !sec !{!"public"}
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false27, %cond.true26, !sec !{!"public"}
  %cond30 = phi i64 [ %34, %cond.true26 ], [ %sub28, %cond.false27 ], !sec !{!"public", !"public", !"public"}
  store i64 %cond30, ptr %capacity, align 8, !sec !{!"public", !"public"}
  %36 = load ptr, ptr %neighbor, align 8, !sec !{!"public", !"public"}
  %num_keys31 = getelementptr inbounds %struct.node, ptr %36, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %37 = load i64, ptr %num_keys31, align 8, !sec !{!"public", !"public"}
  %38 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys32 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %39 = load i64, ptr %num_keys32, align 8, !sec !{!"public", !"public"}
  %add = add i64 %37, %39, !sec !{!"public"}
  %40 = load i64, ptr %capacity, align 8, !sec !{!"public", !"public"}
  %cmp33 = icmp ult i64 %add, %40, !sec !{!"public"}
  br i1 %cmp33, label %if.then34, label %if.else, !sec !{!"public"}

if.then34:                                        ; preds = %cond.end29, !sec !{!"public"}
  %41 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %42 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %43 = load ptr, ptr %neighbor, align 8, !sec !{!"public", !"public"}
  %44 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %45 = load i64, ptr %k_prime, align 8, !sec !{!"public", !"public"}
  %call35 = call ptr @coalesce_nodes(ptr noundef %41, ptr noundef %42, ptr noundef %43, i64 noundef %44, i64 noundef %45), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public", !"public"}}
  store ptr %call35, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

if.else:                                          ; preds = %cond.end29, !sec !{!"public"}
  %46 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %47 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %48 = load ptr, ptr %neighbor, align 8, !sec !{!"public", !"public"}
  %49 = load i64, ptr %neighbor_index, align 8, !sec !{!"public", !"public"}
  %50 = load i64, ptr %k_prime_index, align 8, !sec !{!"public", !"public"}
  %51 = load i64, ptr %k_prime, align 8, !sec !{!"public", !"public"}
  %call36 = call ptr @redistribute_nodes(ptr noundef %46, ptr noundef %47, ptr noundef %48, i64 noundef %49, i64 noundef %50, i64 noundef %51), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public"}}
  store ptr %call36, ptr %retval, align 8, !sec !{!"public", !"public"}
  br label %return

return:                                           ; preds = %if.else, %if.then34, %if.then6, %if.then, !sec !{!"public"}
  %52 = load ptr, ptr %retval, align 8, !sec !{!"public", !"public"}
  ret ptr %52, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @redistribute_nodes(ptr noundef %root, ptr noundef %n, ptr noundef %neighbor, i64 noundef %neighbor_index, i64 noundef %k_prime_index, i64 noundef %k_prime) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %n.addr = alloca ptr, align 8, !sec !{!"public"}
  %neighbor.addr = alloca ptr, align 8, !sec !{!"public"}
  %neighbor_index.addr = alloca i64, align 8, !sec !{!"public"}
  %k_prime_index.addr = alloca i64, align 8, !sec !{!"public"}
  %k_prime.addr = alloca i64, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %tmp = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store ptr %n, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  store ptr %neighbor, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  store i64 %neighbor_index, ptr %neighbor_index.addr, align 8, !sec !{!"public", !"public"}
  store i64 %k_prime_index, ptr %k_prime_index.addr, align 8, !sec !{!"public", !"public"}
  store i64 %k_prime, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %neighbor_index.addr, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ne i64 %0, -1, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.else59, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %1 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %1, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %2 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %2 to i1, !sec !{!"public"}
  br i1 %tobool, label %if.end, label %if.then1, !sec !{!"public"}

if.then1:                                         ; preds = %if.then, !sec !{!"public"}
  %3 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %6, !sec !{!"public", !"public", !"public"}
  %7 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers2 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %9 = load ptr, ptr %pointers2, align 8, !sec !{!"public", !"public"}
  %10 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys3 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %11 = load i64, ptr %num_keys3, align 8, !sec !{!"public", !"public"}
  %add = add i64 %11, 1, !sec !{!"public"}
  %arrayidx4 = getelementptr inbounds ptr, ptr %9, i64 %add, !sec !{!"public", !"public", !"public"}
  store ptr %7, ptr %arrayidx4, align 8, !sec !{!"public", !"public"}
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then, !sec !{!"public"}
  %12 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys5 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %13 = load i64, ptr %num_keys5, align 8, !sec !{!"public", !"public"}
  store i64 %13, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end, !sec !{!"public"}
  %14 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %cmp6 = icmp ugt i64 %14, 0, !sec !{!"public"}
  br i1 %cmp6, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %15 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %16 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub = sub i64 %17, 1, !sec !{!"public"}
  %arrayidx7 = getelementptr inbounds i64, ptr %16, i64 %sub, !sec !{!"public", !"public", !"public"}
  %18 = load i64, ptr %arrayidx7, align 8, !sec !{!"public", !"public"}
  %19 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys8 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %20 = load ptr, ptr %keys8, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx9 = getelementptr inbounds i64, ptr %20, i64 %21, !sec !{!"public", !"public", !"public"}
  store i64 %18, ptr %arrayidx9, align 8, !sec !{!"public", !"public"}
  %22 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers10 = getelementptr inbounds %struct.node, ptr %22, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %23 = load ptr, ptr %pointers10, align 8, !sec !{!"public", !"public"}
  %24 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %sub11 = sub i64 %24, 1, !sec !{!"public"}
  %arrayidx12 = getelementptr inbounds ptr, ptr %23, i64 %sub11, !sec !{!"public", !"public", !"public"}
  %25 = load ptr, ptr %arrayidx12, align 8, !sec !{!"public", !"public"}
  %26 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers13 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %27 = load ptr, ptr %pointers13, align 8, !sec !{!"public", !"public"}
  %28 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx14 = getelementptr inbounds ptr, ptr %27, i64 %28, !sec !{!"public", !"public", !"public"}
  store ptr %25, ptr %arrayidx14, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %29 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %dec = add i64 %29, -1, !sec !{!"public"}
  store i64 %dec, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !51

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %30 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf15 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %31 = load i8, ptr %is_leaf15, align 8, !sec !{!"public", !"public"}
  %tobool16 = trunc i8 %31 to i1, !sec !{!"public"}
  br i1 %tobool16, label %if.else, label %if.then17, !sec !{!"public"}

if.then17:                                        ; preds = %for.end, !sec !{!"public"}
  %32 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers18 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %33 = load ptr, ptr %pointers18, align 8, !sec !{!"public", !"public"}
  %34 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys19 = getelementptr inbounds %struct.node, ptr %34, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %35 = load i64, ptr %num_keys19, align 8, !sec !{!"public", !"public"}
  %arrayidx20 = getelementptr inbounds ptr, ptr %33, i64 %35, !sec !{!"public", !"public", !"public"}
  %36 = load ptr, ptr %arrayidx20, align 8, !sec !{!"public", !"public"}
  %37 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers21 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %38 = load ptr, ptr %pointers21, align 8, !sec !{!"public", !"public"}
  %arrayidx22 = getelementptr inbounds ptr, ptr %38, i64 0, !sec !{!"public", !"public", !"public"}
  store ptr %36, ptr %arrayidx22, align 8, !sec !{!"public", !"public"}
  %39 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers23 = getelementptr inbounds %struct.node, ptr %39, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %40 = load ptr, ptr %pointers23, align 8, !sec !{!"public", !"public"}
  %arrayidx24 = getelementptr inbounds ptr, ptr %40, i64 0, !sec !{!"public", !"public", !"public"}
  %41 = load ptr, ptr %arrayidx24, align 8, !sec !{!"public", !"public"}
  store ptr %41, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %42 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %43 = load ptr, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %parent = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %42, ptr %parent, align 8, !sec !{!"public", !"public"}
  %44 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers25 = getelementptr inbounds %struct.node, ptr %44, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %45 = load ptr, ptr %pointers25, align 8, !sec !{!"public", !"public"}
  %46 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys26 = getelementptr inbounds %struct.node, ptr %46, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %47 = load i64, ptr %num_keys26, align 8, !sec !{!"public", !"public"}
  %arrayidx27 = getelementptr inbounds ptr, ptr %45, i64 %47, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx27, align 8, !sec !{!"public", !"public"}
  %48 = load i64, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %49 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys28 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %50 = load ptr, ptr %keys28, align 8, !sec !{!"public", !"public"}
  %arrayidx29 = getelementptr inbounds i64, ptr %50, i64 0, !sec !{!"public", !"public", !"public"}
  store i64 %48, ptr %arrayidx29, align 8, !sec !{!"public", !"public"}
  %51 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys30 = getelementptr inbounds %struct.node, ptr %51, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %52 = load ptr, ptr %keys30, align 8, !sec !{!"public", !"public"}
  %53 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys31 = getelementptr inbounds %struct.node, ptr %53, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %54 = load i64, ptr %num_keys31, align 8, !sec !{!"public", !"public"}
  %sub32 = sub i64 %54, 1, !sec !{!"public"}
  %arrayidx33 = getelementptr inbounds i64, ptr %52, i64 %sub32, !sec !{!"public", !"public", !"public"}
  %55 = load i64, ptr %arrayidx33, align 8, !sec !{!"public", !"public"}
  %56 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent34 = getelementptr inbounds %struct.node, ptr %56, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %57 = load ptr, ptr %parent34, align 8, !sec !{!"public", !"public"}
  %keys35 = getelementptr inbounds %struct.node, ptr %57, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %58 = load ptr, ptr %keys35, align 8, !sec !{!"public", !"public"}
  %59 = load i64, ptr %k_prime_index.addr, align 8, !sec !{!"public", !"public"}
  %arrayidx36 = getelementptr inbounds i64, ptr %58, i64 %59, !sec !{!"public", !"public", !"public"}
  store i64 %55, ptr %arrayidx36, align 8, !sec !{!"public", !"public"}
  br label %if.end58

if.else:                                          ; preds = %for.end, !sec !{!"public"}
  %60 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers37 = getelementptr inbounds %struct.node, ptr %60, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %61 = load ptr, ptr %pointers37, align 8, !sec !{!"public", !"public"}
  %62 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys38 = getelementptr inbounds %struct.node, ptr %62, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %63 = load i64, ptr %num_keys38, align 8, !sec !{!"public", !"public"}
  %sub39 = sub i64 %63, 1, !sec !{!"public"}
  %arrayidx40 = getelementptr inbounds ptr, ptr %61, i64 %sub39, !sec !{!"public", !"public", !"public"}
  %64 = load ptr, ptr %arrayidx40, align 8, !sec !{!"public", !"public"}
  %65 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers41 = getelementptr inbounds %struct.node, ptr %65, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %66 = load ptr, ptr %pointers41, align 8, !sec !{!"public", !"public"}
  %arrayidx42 = getelementptr inbounds ptr, ptr %66, i64 0, !sec !{!"public", !"public", !"public"}
  store ptr %64, ptr %arrayidx42, align 8, !sec !{!"public", !"public"}
  %67 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers43 = getelementptr inbounds %struct.node, ptr %67, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %68 = load ptr, ptr %pointers43, align 8, !sec !{!"public", !"public"}
  %69 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys44 = getelementptr inbounds %struct.node, ptr %69, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %70 = load i64, ptr %num_keys44, align 8, !sec !{!"public", !"public"}
  %sub45 = sub i64 %70, 1, !sec !{!"public"}
  %arrayidx46 = getelementptr inbounds ptr, ptr %68, i64 %sub45, !sec !{!"public", !"public", !"public"}
  store ptr null, ptr %arrayidx46, align 8, !sec !{!"public", !"public"}
  %71 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys47 = getelementptr inbounds %struct.node, ptr %71, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %72 = load ptr, ptr %keys47, align 8, !sec !{!"public", !"public"}
  %73 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys48 = getelementptr inbounds %struct.node, ptr %73, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %74 = load i64, ptr %num_keys48, align 8, !sec !{!"public", !"public"}
  %sub49 = sub i64 %74, 1, !sec !{!"public"}
  %arrayidx50 = getelementptr inbounds i64, ptr %72, i64 %sub49, !sec !{!"public", !"public", !"public"}
  %75 = load i64, ptr %arrayidx50, align 8, !sec !{!"public", !"public"}
  %76 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys51 = getelementptr inbounds %struct.node, ptr %76, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %77 = load ptr, ptr %keys51, align 8, !sec !{!"public", !"public"}
  %arrayidx52 = getelementptr inbounds i64, ptr %77, i64 0, !sec !{!"public", !"public", !"public"}
  store i64 %75, ptr %arrayidx52, align 8, !sec !{!"public", !"public"}
  %78 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys53 = getelementptr inbounds %struct.node, ptr %78, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %79 = load ptr, ptr %keys53, align 8, !sec !{!"public", !"public"}
  %arrayidx54 = getelementptr inbounds i64, ptr %79, i64 0, !sec !{!"public", !"public", !"public"}
  %80 = load i64, ptr %arrayidx54, align 8, !sec !{!"public", !"public"}
  %81 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent55 = getelementptr inbounds %struct.node, ptr %81, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %82 = load ptr, ptr %parent55, align 8, !sec !{!"public", !"public"}
  %keys56 = getelementptr inbounds %struct.node, ptr %82, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %83 = load ptr, ptr %keys56, align 8, !sec !{!"public", !"public"}
  %84 = load i64, ptr %k_prime_index.addr, align 8, !sec !{!"public", !"public"}
  %arrayidx57 = getelementptr inbounds i64, ptr %83, i64 %84, !sec !{!"public", !"public", !"public"}
  store i64 %80, ptr %arrayidx57, align 8, !sec !{!"public", !"public"}
  br label %if.end58

if.end58:                                         ; preds = %if.else, %if.then17, !sec !{!"public"}
  br label %if.end125

if.else59:                                        ; preds = %entry, !sec !{!"public"}
  %85 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf60 = getelementptr inbounds %struct.node, ptr %85, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %86 = load i8, ptr %is_leaf60, align 8, !sec !{!"public", !"public"}
  %tobool61 = trunc i8 %86 to i1, !sec !{!"public"}
  br i1 %tobool61, label %if.then62, label %if.else78, !sec !{!"public"}

if.then62:                                        ; preds = %if.else59, !sec !{!"public"}
  %87 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys63 = getelementptr inbounds %struct.node, ptr %87, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %88 = load ptr, ptr %keys63, align 8, !sec !{!"public", !"public"}
  %arrayidx64 = getelementptr inbounds i64, ptr %88, i64 0, !sec !{!"public", !"public", !"public"}
  %89 = load i64, ptr %arrayidx64, align 8, !sec !{!"public", !"public"}
  %90 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys65 = getelementptr inbounds %struct.node, ptr %90, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %91 = load ptr, ptr %keys65, align 8, !sec !{!"public", !"public"}
  %92 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys66 = getelementptr inbounds %struct.node, ptr %92, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %93 = load i64, ptr %num_keys66, align 8, !sec !{!"public", !"public"}
  %arrayidx67 = getelementptr inbounds i64, ptr %91, i64 %93, !sec !{!"public", !"public", !"public"}
  store i64 %89, ptr %arrayidx67, align 8, !sec !{!"public", !"public"}
  %94 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers68 = getelementptr inbounds %struct.node, ptr %94, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %95 = load ptr, ptr %pointers68, align 8, !sec !{!"public", !"public"}
  %arrayidx69 = getelementptr inbounds ptr, ptr %95, i64 0, !sec !{!"public", !"public", !"public"}
  %96 = load ptr, ptr %arrayidx69, align 8, !sec !{!"public", !"public"}
  %97 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers70 = getelementptr inbounds %struct.node, ptr %97, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %98 = load ptr, ptr %pointers70, align 8, !sec !{!"public", !"public"}
  %99 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys71 = getelementptr inbounds %struct.node, ptr %99, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %100 = load i64, ptr %num_keys71, align 8, !sec !{!"public", !"public"}
  %arrayidx72 = getelementptr inbounds ptr, ptr %98, i64 %100, !sec !{!"public", !"public", !"public"}
  store ptr %96, ptr %arrayidx72, align 8, !sec !{!"public", !"public"}
  %101 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys73 = getelementptr inbounds %struct.node, ptr %101, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %102 = load ptr, ptr %keys73, align 8, !sec !{!"public", !"public"}
  %arrayidx74 = getelementptr inbounds i64, ptr %102, i64 1, !sec !{!"public", !"public", !"public"}
  %103 = load i64, ptr %arrayidx74, align 8, !sec !{!"public", !"public"}
  %104 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent75 = getelementptr inbounds %struct.node, ptr %104, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %105 = load ptr, ptr %parent75, align 8, !sec !{!"public", !"public"}
  %keys76 = getelementptr inbounds %struct.node, ptr %105, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %106 = load ptr, ptr %keys76, align 8, !sec !{!"public", !"public"}
  %107 = load i64, ptr %k_prime_index.addr, align 8, !sec !{!"public", !"public"}
  %arrayidx77 = getelementptr inbounds i64, ptr %106, i64 %107, !sec !{!"public", !"public", !"public"}
  store i64 %103, ptr %arrayidx77, align 8, !sec !{!"public", !"public"}
  br label %if.end98

if.else78:                                        ; preds = %if.else59, !sec !{!"public"}
  %108 = load i64, ptr %k_prime.addr, align 8, !sec !{!"public", !"public"}
  %109 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %keys79 = getelementptr inbounds %struct.node, ptr %109, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %110 = load ptr, ptr %keys79, align 8, !sec !{!"public", !"public"}
  %111 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys80 = getelementptr inbounds %struct.node, ptr %111, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %112 = load i64, ptr %num_keys80, align 8, !sec !{!"public", !"public"}
  %arrayidx81 = getelementptr inbounds i64, ptr %110, i64 %112, !sec !{!"public", !"public", !"public"}
  store i64 %108, ptr %arrayidx81, align 8, !sec !{!"public", !"public"}
  %113 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers82 = getelementptr inbounds %struct.node, ptr %113, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %114 = load ptr, ptr %pointers82, align 8, !sec !{!"public", !"public"}
  %arrayidx83 = getelementptr inbounds ptr, ptr %114, i64 0, !sec !{!"public", !"public", !"public"}
  %115 = load ptr, ptr %arrayidx83, align 8, !sec !{!"public", !"public"}
  %116 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers84 = getelementptr inbounds %struct.node, ptr %116, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %117 = load ptr, ptr %pointers84, align 8, !sec !{!"public", !"public"}
  %118 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys85 = getelementptr inbounds %struct.node, ptr %118, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %119 = load i64, ptr %num_keys85, align 8, !sec !{!"public", !"public"}
  %add86 = add i64 %119, 1, !sec !{!"public"}
  %arrayidx87 = getelementptr inbounds ptr, ptr %117, i64 %add86, !sec !{!"public", !"public", !"public"}
  store ptr %115, ptr %arrayidx87, align 8, !sec !{!"public", !"public"}
  %120 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %pointers88 = getelementptr inbounds %struct.node, ptr %120, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %121 = load ptr, ptr %pointers88, align 8, !sec !{!"public", !"public"}
  %122 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys89 = getelementptr inbounds %struct.node, ptr %122, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %123 = load i64, ptr %num_keys89, align 8, !sec !{!"public", !"public"}
  %add90 = add i64 %123, 1, !sec !{!"public"}
  %arrayidx91 = getelementptr inbounds ptr, ptr %121, i64 %add90, !sec !{!"public", !"public", !"public"}
  %124 = load ptr, ptr %arrayidx91, align 8, !sec !{!"public", !"public"}
  store ptr %124, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %125 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %126 = load ptr, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %parent92 = getelementptr inbounds %struct.node, ptr %126, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store ptr %125, ptr %parent92, align 8, !sec !{!"public", !"public"}
  %127 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys93 = getelementptr inbounds %struct.node, ptr %127, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %128 = load ptr, ptr %keys93, align 8, !sec !{!"public", !"public"}
  %arrayidx94 = getelementptr inbounds i64, ptr %128, i64 0, !sec !{!"public", !"public", !"public"}
  %129 = load i64, ptr %arrayidx94, align 8, !sec !{!"public", !"public"}
  %130 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %parent95 = getelementptr inbounds %struct.node, ptr %130, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %131 = load ptr, ptr %parent95, align 8, !sec !{!"public", !"public"}
  %keys96 = getelementptr inbounds %struct.node, ptr %131, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %132 = load ptr, ptr %keys96, align 8, !sec !{!"public", !"public"}
  %133 = load i64, ptr %k_prime_index.addr, align 8, !sec !{!"public", !"public"}
  %arrayidx97 = getelementptr inbounds i64, ptr %132, i64 %133, !sec !{!"public", !"public", !"public"}
  store i64 %129, ptr %arrayidx97, align 8, !sec !{!"public", !"public"}
  br label %if.end98

if.end98:                                         ; preds = %if.else78, %if.then62, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond99

for.cond99:                                       ; preds = %for.inc114, %if.end98, !sec !{!"public"}
  %134 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %135 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys100 = getelementptr inbounds %struct.node, ptr %135, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %136 = load i64, ptr %num_keys100, align 8, !sec !{!"public", !"public"}
  %sub101 = sub i64 %136, 1, !sec !{!"public"}
  %cmp102 = icmp ult i64 %134, %sub101, !sec !{!"public"}
  br i1 %cmp102, label %for.body103, label %for.end115, !sec !{!"public"}

for.body103:                                      ; preds = %for.cond99, !sec !{!"public"}
  %137 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys104 = getelementptr inbounds %struct.node, ptr %137, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %138 = load ptr, ptr %keys104, align 8, !sec !{!"public", !"public"}
  %139 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %add105 = add i64 %139, 1, !sec !{!"public"}
  %arrayidx106 = getelementptr inbounds i64, ptr %138, i64 %add105, !sec !{!"public", !"public", !"public"}
  %140 = load i64, ptr %arrayidx106, align 8, !sec !{!"public", !"public"}
  %141 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %keys107 = getelementptr inbounds %struct.node, ptr %141, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %142 = load ptr, ptr %keys107, align 8, !sec !{!"public", !"public"}
  %143 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx108 = getelementptr inbounds i64, ptr %142, i64 %143, !sec !{!"public", !"public", !"public"}
  store i64 %140, ptr %arrayidx108, align 8, !sec !{!"public", !"public"}
  %144 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers109 = getelementptr inbounds %struct.node, ptr %144, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %145 = load ptr, ptr %pointers109, align 8, !sec !{!"public", !"public"}
  %146 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %add110 = add i64 %146, 1, !sec !{!"public"}
  %arrayidx111 = getelementptr inbounds ptr, ptr %145, i64 %add110, !sec !{!"public", !"public", !"public"}
  %147 = load ptr, ptr %arrayidx111, align 8, !sec !{!"public", !"public"}
  %148 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers112 = getelementptr inbounds %struct.node, ptr %148, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %149 = load ptr, ptr %pointers112, align 8, !sec !{!"public", !"public"}
  %150 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx113 = getelementptr inbounds ptr, ptr %149, i64 %150, !sec !{!"public", !"public", !"public"}
  store ptr %147, ptr %arrayidx113, align 8, !sec !{!"public", !"public"}
  br label %for.inc114

for.inc114:                                       ; preds = %for.body103, !sec !{!"public"}
  %151 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %151, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond99, !llvm.loop !52

for.end115:                                       ; preds = %for.cond99, !sec !{!"public"}
  %152 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf116 = getelementptr inbounds %struct.node, ptr %152, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %153 = load i8, ptr %is_leaf116, align 8, !sec !{!"public", !"public"}
  %tobool117 = trunc i8 %153 to i1, !sec !{!"public"}
  br i1 %tobool117, label %if.end124, label %if.then118, !sec !{!"public"}

if.then118:                                       ; preds = %for.end115, !sec !{!"public"}
  %154 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers119 = getelementptr inbounds %struct.node, ptr %154, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %155 = load ptr, ptr %pointers119, align 8, !sec !{!"public", !"public"}
  %156 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %add120 = add i64 %156, 1, !sec !{!"public"}
  %arrayidx121 = getelementptr inbounds ptr, ptr %155, i64 %add120, !sec !{!"public", !"public", !"public"}
  %157 = load ptr, ptr %arrayidx121, align 8, !sec !{!"public", !"public"}
  %158 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %pointers122 = getelementptr inbounds %struct.node, ptr %158, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %159 = load ptr, ptr %pointers122, align 8, !sec !{!"public", !"public"}
  %160 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx123 = getelementptr inbounds ptr, ptr %159, i64 %160, !sec !{!"public", !"public", !"public"}
  store ptr %157, ptr %arrayidx123, align 8, !sec !{!"public", !"public"}
  br label %if.end124

if.end124:                                        ; preds = %if.then118, %for.end115, !sec !{!"public"}
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %if.end58, !sec !{!"public"}
  %161 = load ptr, ptr %n.addr, align 8, !sec !{!"public", !"public"}
  %num_keys126 = getelementptr inbounds %struct.node, ptr %161, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %162 = load i64, ptr %num_keys126, align 8, !sec !{!"public", !"public"}
  %inc127 = add i64 %162, 1, !sec !{!"public"}
  store i64 %inc127, ptr %num_keys126, align 8, !sec !{!"public", !"public"}
  %163 = load ptr, ptr %neighbor.addr, align 8, !sec !{!"public", !"public"}
  %num_keys128 = getelementptr inbounds %struct.node, ptr %163, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %164 = load i64, ptr %num_keys128, align 8, !sec !{!"public", !"public"}
  %dec129 = add i64 %164, -1, !sec !{!"public"}
  store i64 %dec129, ptr %num_keys128, align 8, !sec !{!"public", !"public"}
  %165 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %165, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @delete(ptr noundef %root, i64 noundef %key) #0 !sec !{!"public", !"public", !{!"public", !"public", !"public", !"public", !"public", !"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %key.addr = alloca i64, align 8, !sec !{!"public"}
  %key_leaf = alloca ptr, align 8, !sec !{!"public"}
  %key_record = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  store i64 %key, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %key_leaf, align 8, !sec !{!"public", !"public"}
  store ptr null, ptr %key_record, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %key.addr, align 8, !sec !{!"private", !"public"}
  %call = call ptr @find(ptr noundef %0, i64 noundef %1, i1 noundef zeroext false, ptr noundef %key_leaf), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"public"}}
  store ptr %call, ptr %key_record, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %key_record, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ne ptr %2, null, !sec !{!"public"}
  br i1 %cmp, label %land.lhs.true, label %if.end, !sec !{!"public"}

land.lhs.true:                                    ; preds = %entry, !sec !{!"public"}
  %3 = load ptr, ptr %key_leaf, align 8, !sec !{!"public", !"public"}
  %cmp1 = icmp ne ptr %3, null, !sec !{!"public"}
  br i1 %cmp1, label %if.then, label %if.end, !sec !{!"public"}

if.then:                                          ; preds = %land.lhs.true, !sec !{!"public"}
  %4 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %5 = load ptr, ptr %key_leaf, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %key.addr, align 8, !sec !{!"public", !"public"}
  %7 = load ptr, ptr %key_record, align 8, !sec !{!"public", !"public"}
  %call2 = call ptr @delete_entry(ptr noundef %4, ptr noundef %5, i64 noundef %6, ptr noundef %7), !sec !{!"call", !"public", !{!"public", !"public", !"public", !"public"}}
  store ptr %call2, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %8 = load ptr, ptr %key_record, align 8, !sec !{!"public", !"public"}
  call void @free_record(ptr noundef %8), !sec !{!"call", !"void", !{!"public"}}
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry, !sec !{!"public"}
  %9 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  ret ptr %9, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @destroy_tree_nodes(ptr noundef %root) #0 !sec !{!"void", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %is_leaf = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %1 = load i8, ptr %is_leaf, align 8, !sec !{!"public", !"public"}
  %tobool = trunc i8 %1 to i1, !sec !{!"public"}
  br i1 %tobool, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then, !sec !{!"public"}
  %2 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %3 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %num_keys = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %4 = load i64, ptr %num_keys, align 8, !sec !{!"public", !"public"}
  %cmp = icmp ult i64 %2, %4, !sec !{!"public"}
  br i1 %cmp, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %5 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %pointers = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %6 = load ptr, ptr %pointers, align 8, !sec !{!"public", !"public"}
  %7 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds ptr, ptr %6, i64 %7, !sec !{!"public", !"public", !"public"}
  %8 = load ptr, ptr %arrayidx, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %8) #8, !sec !{!"free", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %9 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %9, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !53

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  br label %if.end

if.else:                                          ; preds = %entry, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc7, %if.else, !sec !{!"public"}
  %10 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %num_keys2 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 4, !sec !{!"public", !"public", !"public", !"public"}
  %12 = load i64, ptr %num_keys2, align 8, !sec !{!"public", !"public"}
  %add = add i64 %12, 1, !sec !{!"public"}
  %cmp3 = icmp ult i64 %10, %add, !sec !{!"public"}
  br i1 %cmp3, label %for.body4, label %for.end9, !sec !{!"public"}

for.body4:                                        ; preds = %for.cond1, !sec !{!"public"}
  %13 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %pointers5 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %14 = load ptr, ptr %pointers5, align 8, !sec !{!"public", !"public"}
  %15 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx6 = getelementptr inbounds ptr, ptr %14, i64 %15, !sec !{!"public", !"public", !"public"}
  %16 = load ptr, ptr %arrayidx6, align 8, !sec !{!"public", !"public"}
  call void @destroy_tree_nodes(ptr noundef %16), !sec !{!"call", !"void", !{!"public"}}
  br label %for.inc7

for.inc7:                                         ; preds = %for.body4, !sec !{!"public"}
  %17 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc8 = add i64 %17, 1, !sec !{!"public"}
  store i64 %inc8, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond1, !llvm.loop !54

for.end9:                                         ; preds = %for.cond1, !sec !{!"public"}
  br label %if.end

if.end:                                           ; preds = %for.end9, %for.end, !sec !{!"public"}
  %18 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %pointers10 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load ptr, ptr %pointers10, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %19) #8, !sec !{!"free", !"public"}
  %20 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %keys = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  %21 = load ptr, ptr %keys, align 8, !sec !{!"public", !"public"}
  call void @free(ptr noundef %21) #8, !sec !{!"free", !"public"}
  %22 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  call void @free_node(ptr noundef %22), !sec !{!"call", !"void", !{!"public"}}
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @destroy_tree(ptr noundef %root) #0 !sec !{!"public", !"public", !{!"public"}} {
entry:		; !sec !{!"public"}
  %root.addr = alloca ptr, align 8, !sec !{!"public"}
  store ptr %root, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  %0 = load ptr, ptr %root.addr, align 8, !sec !{!"public", !"public"}
  call void @destroy_tree_nodes(ptr noundef %0), !sec !{!"call", !"void", !{!"public"}}
  ret ptr null, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @myrand() #0 !sec !{!"public", !"public", !{}} {
entry:		; !sec !{!"public"}
  call void @next(), !sec !{!"call", !"void", !{}}
  %0 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16, !sec !{!"public", !"public"}
  %shl = shl i64 %0, 15, !sec !{!"public"}
  %1 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"public", !"public"}
  %shr = lshr i64 %1, 1, !sec !{!"public"}
  %add = add i64 %shl, %shr, !sec !{!"public"}
  ret i64 %add, !sec !{!"public"}
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @next() #0 !sec !{!"void", !"private", !{}} {
entry:		; !sec !{!"private"}
  %p = alloca [2 x i64], align 16, !sec !{!"private"}
  %q = alloca [2 x i64], align 16, !sec !{!"private"}
  %r = alloca [2 x i64], align 16, !sec !{!"private"}
  %carry0 = alloca i64, align 8, !sec !{!"private"}
  %carry1 = alloca i64, align 8, !sec !{!"private"}
  %l = alloca i32, align 4, !sec !{!"private"}
  %l29 = alloca i32, align 4, !sec !{!"private"}
  %l54 = alloca i32, align 4, !sec !{!"private"}
  %0 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %1 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %mul = mul nsw i64 %0, %1, !sec !{!"private"}
  %conv = trunc i64 %mul to i32, !sec !{!"private"}
  store i32 %conv, ptr %l, align 4, !sec !{!"private", !"private"}
  %2 = load i32, ptr %l, align 4, !sec !{!"private", !"private"}
  %and = and i32 %2, 65535, !sec !{!"private"}
  %conv1 = zext i32 %and to i64, !sec !{!"private"}
  %arrayidx = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv1, ptr %arrayidx, align 16, !sec !{!"private", !"private"}
  %3 = load i32, ptr %l, align 4, !sec !{!"private", !"private"}
  %shr = ashr i32 %3, 16, !sec !{!"private"}
  %and2 = and i32 %shr, 65535, !sec !{!"private"}
  %conv3 = zext i32 %and2 to i64, !sec !{!"private"}
  %arrayidx4 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv3, ptr %arrayidx4, align 8, !sec !{!"private", !"private"}
  %arrayidx5 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %4 = load i64, ptr %arrayidx5, align 16, !sec !{!"private", !"private"}
  %conv6 = trunc i64 %4 to i32, !sec !{!"private"}
  %conv7 = sext i32 %conv6 to i64, !sec !{!"private"}
  %5 = load i64, ptr @c, align 8, !sec !{!"private", !"public"}
  %add = add nsw i64 %conv7, %5, !sec !{!"private"}
  %cmp = icmp sgt i64 %add, 65535, !sec !{!"private"}
  %conv8 = zext i1 %cmp to i32, !sec !{!"private"}
  %conv9 = sext i32 %conv8 to i64, !sec !{!"private"}
  store i64 %conv9, ptr %carry0, align 8, !sec !{!"private", !"private"}
  %arrayidx10 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %6 = load i64, ptr %arrayidx10, align 16, !sec !{!"private", !"private"}
  %7 = load i64, ptr @c, align 8, !sec !{!"private", !"public"}
  %add11 = add i64 %6, %7, !sec !{!"private"}
  %conv12 = trunc i64 %add11 to i32, !sec !{!"private"}
  %and13 = and i32 %conv12, 65535, !sec !{!"private"}
  %conv14 = zext i32 %and13 to i64, !sec !{!"private"}
  %arrayidx15 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv14, ptr %arrayidx15, align 16, !sec !{!"private", !"private"}
  %arrayidx16 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %8 = load i64, ptr %arrayidx16, align 8, !sec !{!"private", !"private"}
  %conv17 = trunc i64 %8 to i32, !sec !{!"private"}
  %conv18 = sext i32 %conv17 to i64, !sec !{!"private"}
  %9 = load i64, ptr %carry0, align 8, !sec !{!"private", !"private"}
  %add19 = add nsw i64 %conv18, %9, !sec !{!"private"}
  %cmp20 = icmp sgt i64 %add19, 65535, !sec !{!"private"}
  %conv21 = zext i1 %cmp20 to i32, !sec !{!"private"}
  %conv22 = sext i32 %conv21 to i64, !sec !{!"private"}
  store i64 %conv22, ptr %carry1, align 8, !sec !{!"private", !"private"}
  %arrayidx23 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %10 = load i64, ptr %arrayidx23, align 8, !sec !{!"private", !"private"}
  %11 = load i64, ptr %carry0, align 8, !sec !{!"private", !"private"}
  %add24 = add i64 %10, %11, !sec !{!"private"}
  %conv25 = trunc i64 %add24 to i32, !sec !{!"private"}
  %and26 = and i32 %conv25, 65535, !sec !{!"private"}
  %conv27 = zext i32 %and26 to i64, !sec !{!"private"}
  %arrayidx28 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv27, ptr %arrayidx28, align 8, !sec !{!"private", !"private"}
  %12 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %13 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %mul30 = mul nsw i64 %12, %13, !sec !{!"private"}
  %conv31 = trunc i64 %mul30 to i32, !sec !{!"private"}
  store i32 %conv31, ptr %l29, align 4, !sec !{!"private", !"private"}
  %14 = load i32, ptr %l29, align 4, !sec !{!"private", !"private"}
  %and32 = and i32 %14, 65535, !sec !{!"private"}
  %conv33 = zext i32 %and32 to i64, !sec !{!"private"}
  %arrayidx34 = getelementptr inbounds [2 x i64], ptr %q, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv33, ptr %arrayidx34, align 16, !sec !{!"private", !"private"}
  %15 = load i32, ptr %l29, align 4, !sec !{!"private", !"private"}
  %shr35 = ashr i32 %15, 16, !sec !{!"private"}
  %and36 = and i32 %shr35, 65535, !sec !{!"private"}
  %conv37 = zext i32 %and36 to i64, !sec !{!"private"}
  %arrayidx38 = getelementptr inbounds [2 x i64], ptr %q, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv37, ptr %arrayidx38, align 8, !sec !{!"private", !"private"}
  %arrayidx39 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %16 = load i64, ptr %arrayidx39, align 8, !sec !{!"private", !"private"}
  %conv40 = trunc i64 %16 to i32, !sec !{!"private"}
  %conv41 = sext i32 %conv40 to i64, !sec !{!"private"}
  %arrayidx42 = getelementptr inbounds [2 x i64], ptr %q, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %17 = load i64, ptr %arrayidx42, align 16, !sec !{!"private", !"private"}
  %add43 = add nsw i64 %conv41, %17, !sec !{!"private"}
  %cmp44 = icmp sgt i64 %add43, 65535, !sec !{!"private"}
  %conv45 = zext i1 %cmp44 to i32, !sec !{!"private"}
  %conv46 = sext i32 %conv45 to i64, !sec !{!"private"}
  store i64 %conv46, ptr %carry0, align 8, !sec !{!"private", !"private"}
  %arrayidx47 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %18 = load i64, ptr %arrayidx47, align 8, !sec !{!"private", !"private"}
  %arrayidx48 = getelementptr inbounds [2 x i64], ptr %q, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %19 = load i64, ptr %arrayidx48, align 16, !sec !{!"private", !"private"}
  %add49 = add i64 %18, %19, !sec !{!"private"}
  %conv50 = trunc i64 %add49 to i32, !sec !{!"private"}
  %and51 = and i32 %conv50, 65535, !sec !{!"private"}
  %conv52 = zext i32 %and51 to i64, !sec !{!"private"}
  %arrayidx53 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv52, ptr %arrayidx53, align 8, !sec !{!"private", !"private"}
  %20 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %21 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %mul55 = mul nsw i64 %20, %21, !sec !{!"private"}
  %conv56 = trunc i64 %mul55 to i32, !sec !{!"private"}
  store i32 %conv56, ptr %l54, align 4, !sec !{!"private", !"private"}
  %22 = load i32, ptr %l54, align 4, !sec !{!"private", !"private"}
  %and57 = and i32 %22, 65535, !sec !{!"private"}
  %conv58 = zext i32 %and57 to i64, !sec !{!"private"}
  %arrayidx59 = getelementptr inbounds [2 x i64], ptr %r, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv58, ptr %arrayidx59, align 16, !sec !{!"private", !"private"}
  %23 = load i32, ptr %l54, align 4, !sec !{!"private", !"private"}
  %shr60 = ashr i32 %23, 16, !sec !{!"private"}
  %and61 = and i32 %shr60, 65535, !sec !{!"private"}
  %conv62 = zext i32 %and61 to i64, !sec !{!"private"}
  %arrayidx63 = getelementptr inbounds [2 x i64], ptr %r, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  store i64 %conv62, ptr %arrayidx63, align 8, !sec !{!"private", !"private"}
  %24 = load i64, ptr %carry0, align 8, !sec !{!"private", !"private"}
  %25 = load i64, ptr %carry1, align 8, !sec !{!"private", !"private"}
  %add64 = add i64 %24, %25, !sec !{!"private"}
  %arrayidx65 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %26 = load i64, ptr %arrayidx65, align 8, !sec !{!"private", !"private"}
  %conv66 = trunc i64 %26 to i32, !sec !{!"private"}
  %conv67 = sext i32 %conv66 to i64, !sec !{!"private"}
  %arrayidx68 = getelementptr inbounds [2 x i64], ptr %r, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %27 = load i64, ptr %arrayidx68, align 16, !sec !{!"private", !"private"}
  %add69 = add nsw i64 %conv67, %27, !sec !{!"private"}
  %cmp70 = icmp sgt i64 %add69, 65535, !sec !{!"private"}
  %conv71 = zext i1 %cmp70 to i32, !sec !{!"private"}
  %conv72 = sext i32 %conv71 to i64, !sec !{!"private"}
  %add73 = add i64 %add64, %conv72, !sec !{!"private"}
  %arrayidx74 = getelementptr inbounds [2 x i64], ptr %q, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %28 = load i64, ptr %arrayidx74, align 8, !sec !{!"private", !"private"}
  %add75 = add i64 %add73, %28, !sec !{!"private"}
  %arrayidx76 = getelementptr inbounds [2 x i64], ptr %r, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %29 = load i64, ptr %arrayidx76, align 8, !sec !{!"private", !"private"}
  %add77 = add i64 %add75, %29, !sec !{!"private"}
  %30 = load i64, ptr @a, align 16, !sec !{!"private", !"public"}
  %31 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16, !sec !{!"private", !"public"}
  %mul78 = mul i64 %30, %31, !sec !{!"private"}
  %add79 = add i64 %add77, %mul78, !sec !{!"private"}
  %32 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %33 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8, !sec !{!"private", !"public"}
  %mul80 = mul i64 %32, %33, !sec !{!"private"}
  %add81 = add i64 %add79, %mul80, !sec !{!"private"}
  %34 = load i64, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16, !sec !{!"private", !"public"}
  %35 = load i64, ptr @x, align 16, !sec !{!"private", !"public"}
  %mul82 = mul i64 %34, %35, !sec !{!"private"}
  %add83 = add i64 %add81, %mul82, !sec !{!"private"}
  %conv84 = trunc i64 %add83 to i32, !sec !{!"private"}
  %and85 = and i32 %conv84, 65535, !sec !{!"private"}
  %conv86 = zext i32 %and85 to i64, !sec !{!"private"}
  store i64 %conv86, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  %arrayidx87 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 1, !sec !{!"private", !"private", !"public", !"public"}
  %36 = load i64, ptr %arrayidx87, align 8, !sec !{!"private", !"private"}
  %arrayidx88 = getelementptr inbounds [2 x i64], ptr %r, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %37 = load i64, ptr %arrayidx88, align 16, !sec !{!"private", !"private"}
  %add89 = add i64 %36, %37, !sec !{!"private"}
  %conv90 = trunc i64 %add89 to i32, !sec !{!"private"}
  %and91 = and i32 %conv90, 65535, !sec !{!"private"}
  %conv92 = zext i32 %and91 to i64, !sec !{!"private"}
  store i64 %conv92, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %arrayidx93 = getelementptr inbounds [2 x i64], ptr %p, i64 0, i64 0, !sec !{!"private", !"private", !"public", !"public"}
  %38 = load i64, ptr %arrayidx93, align 16, !sec !{!"private", !"private"}
  %conv94 = trunc i64 %38 to i32, !sec !{!"private"}
  %and95 = and i32 %conv94, 65535, !sec !{!"private"}
  %conv96 = zext i32 %and95 to i64, !sec !{!"private"}
  store i64 %conv96, ptr @x, align 16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myrandseed(i32 noundef %seedval) #0 !sec !{!"void", !"private", !{!"private"}} {
entry:		; !sec !{!"private"}
  %seedval.addr = alloca i32, align 4, !sec !{!"private"}
  store i32 %seedval, ptr %seedval.addr, align 4, !sec !{!"private", !"private"}
  store i64 13070, ptr @x, align 16
  %0 = load i32, ptr %seedval.addr, align 4, !sec !{!"private", !"private"}
  %and = and i32 %0, 65535, !sec !{!"private"}
  %conv = zext i32 %and to i64, !sec !{!"private"}
  store i64 %conv, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 1), align 8
  %1 = load i32, ptr %seedval.addr, align 4, !sec !{!"private", !"private"}
  %shr = ashr i32 %1, 16, !sec !{!"private"}
  %and1 = and i32 %shr, 65535, !sec !{!"private"}
  %conv2 = zext i32 %and1 to i64, !sec !{!"private"}
  store i64 %conv2, ptr getelementptr inbounds ([3 x i64], ptr @x, i64 0, i64 2), align 16
  store i64 58989, ptr @a, align 16
  store i64 57068, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 1), align 8
  store i64 5, ptr getelementptr inbounds ([3 x i64], ptr @a, i64 0, i64 2), align 16
  store i64 11, ptr @c, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @real_main() #0 !sec !{!"public", !"public", !{}} {
entry:		; !sec !{!"public"}
  %input_file = alloca ptr, align 8, !sec !{!"public"}
  %fp = alloca ptr, align 8, !sec !{!"public"}
  %root = alloca ptr, align 8, !sec !{!"public"}
  %nelements = alloca i64, align 8, !sec !{!"public"}
  %nlookup = alloca i64, align 8, !sec !{!"public"}
  %total_mem = alloca i64, align 8, !sec !{!"public"}
  %elms = alloca ptr, align 8, !sec !{!"public"}
  %i = alloca i64, align 8, !sec !{!"public"}
  %i6 = alloca i64, align 8, !sec !{!"public"}
  %j = alloca i64, align 8, !sec !{!"public"}
  %tmp = alloca i64, align 8, !sec !{!"public"}
  %i21 = alloca i64, align 8, !sec !{!"public"}
  %sum = alloca i64, align 8, !sec !{!"public"}
  %start = alloca %struct.timeval, align 8, !sec !{!"public"}
  %end = alloca %struct.timeval, align 8, !sec !{!"public"}
  %i37 = alloca i64, align 8, !sec !{!"public"}
  %rdn = alloca i64, align 8, !sec !{!"public"}
  %r = alloca ptr, align 8, !sec !{!"public"}
  %e = alloca ptr, align 8, !sec !{!"public"}
  store ptr null, ptr %root, align 8, !sec !{!"public", !"public"}
  store i8 0, ptr @verbose_output, align 1
  call void @myrandseed(i32 noundef -889275714), !sec !{!"call", !"void", !{!"private"}}
  store i64 1548576, ptr %nelements, align 8, !sec !{!"public", !"public"}
  store i64 1200000000, ptr %nlookup, align 8, !sec !{!"public", !"public"}
  %0 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  %mul = mul i64 %0, 64, !sec !{!"public"}
  store i64 %mul, ptr %total_mem, align 8, !sec !{!"public", !"public"}
  %1 = load i64, ptr %total_mem, align 8, !sec !{!"public", !"public"}
  %call = call ptr @allocate(i64 noundef %1, i64 noundef 2097152), !sec !{!"call", !"public", !{!"public", !"public"}}
  store ptr %call, ptr %elms, align 8, !sec !{!"public", !"public"}
  %2 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %cmp = icmp eq ptr %2, null, !sec !{!"public"}
  br i1 %cmp, label %if.then, label %if.else, !sec !{!"public"}

if.then:                                          ; preds = %entry, !sec !{!"public"}
  %3 = load ptr, ptr @stderr, align 8, !sec !{!"public", !"public"}
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.37), !sec !{!"call", !"public", !{!"public", !"public"}}
  call void @exit(i32 noundef 1) #7, !sec !{!"call", !"void", !{!"public"}}
  unreachable

if.else:                                          ; preds = %entry, !sec !{!"public"}
  %4 = load i64, ptr %total_mem, align 8, !sec !{!"public", !"public"}
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.38, i64 noundef %4), !sec !{!"call", !"public", !{!"public", !"public"}}
  br label %if.end

if.end:                                           ; preds = %if.else, !sec !{!"public"}
  store i64 0, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end, !sec !{!"public"}
  %5 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %6 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  %cmp3 = icmp ult i64 %5, %6, !sec !{!"public"}
  br i1 %cmp3, label %for.body, label %for.end, !sec !{!"public"}

for.body:                                         ; preds = %for.cond, !sec !{!"public"}
  %7 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %8 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx = getelementptr inbounds %struct.element, ptr %7, i64 %8, !sec !{!"public", !"public", !"public"}
  %key = getelementptr inbounds %struct.element, ptr %arrayidx, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 4, ptr %key, align 8, !sec !{!"public", !"public"}
  %9 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %10 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx4 = getelementptr inbounds %struct.element, ptr %9, i64 %10, !sec !{!"public", !"public", !"public"}
  %stats = getelementptr inbounds %struct.element, ptr %arrayidx4, i32 0, i32 1, !sec !{!"public", !"public", !"public", !"public"}
  store i64 0, ptr %stats, align 8, !sec !{!"public", !"public"}
  %11 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %12 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %arrayidx5 = getelementptr inbounds %struct.element, ptr %11, i64 %12, !sec !{!"public", !"public", !"public"}
  %value = getelementptr inbounds %struct.element, ptr %arrayidx5, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  store i64 1, ptr %value, align 8, !sec !{!"public", !"public"}
  br label %for.inc

for.inc:                                          ; preds = %for.body, !sec !{!"public"}
  %13 = load i64, ptr %i, align 8, !sec !{!"public", !"public"}
  %inc = add i64 %13, 1, !sec !{!"public"}
  store i64 %inc, ptr %i, align 8, !sec !{!"public", !"public"}
  br label %for.cond, !llvm.loop !55

for.end:                                          ; preds = %for.cond, !sec !{!"public"}
  %14 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  store i64 %14, ptr %i6, align 8, !sec !{!"public", !"public"}
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc19, %for.end, !sec !{!"public"}
  %15 = load i64, ptr %i6, align 8, !sec !{!"public", !"public"}
  %cmp8 = icmp ugt i64 %15, 1, !sec !{!"public"}
  br i1 %cmp8, label %for.body9, label %for.end20, !sec !{!"public"}

for.body9:                                        ; preds = %for.cond7, !sec !{!"public"}
  %call10 = call i64 @myrand(), !sec !{!"call", !"public", !{}}
  %16 = load i64, ptr %i6, align 8, !sec !{!"public", !"public"}
  %add = add i64 %16, 1, !sec !{!"public"}
  %rem = urem i64 %call10, %add, !sec !{!"public"}
  store i64 %rem, ptr %j, align 8, !sec !{!"public", !"public"}
  %17 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %18 = load i64, ptr %i6, align 8, !sec !{!"public", !"public"}
  %arrayidx11 = getelementptr inbounds %struct.element, ptr %17, i64 %18, !sec !{!"public", !"public", !"public"}
  %key12 = getelementptr inbounds %struct.element, ptr %arrayidx11, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %19 = load i64, ptr %key12, align 8, !sec !{!"public", !"public"}
  store i64 %19, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %20 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %21 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx13 = getelementptr inbounds %struct.element, ptr %20, i64 %21, !sec !{!"public", !"public", !"public"}
  %key14 = getelementptr inbounds %struct.element, ptr %arrayidx13, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %22 = load i64, ptr %key14, align 8, !sec !{!"public", !"public"}
  %23 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %24 = load i64, ptr %i6, align 8, !sec !{!"public", !"public"}
  %arrayidx15 = getelementptr inbounds %struct.element, ptr %23, i64 %24, !sec !{!"public", !"public", !"public"}
  %key16 = getelementptr inbounds %struct.element, ptr %arrayidx15, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %22, ptr %key16, align 8, !sec !{!"public", !"public"}
  %25 = load i64, ptr %tmp, align 8, !sec !{!"public", !"public"}
  %26 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %27 = load i64, ptr %j, align 8, !sec !{!"public", !"public"}
  %arrayidx17 = getelementptr inbounds %struct.element, ptr %26, i64 %27, !sec !{!"public", !"public", !"public"}
  %key18 = getelementptr inbounds %struct.element, ptr %arrayidx17, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  store i64 %25, ptr %key18, align 8, !sec !{!"public", !"public"}
  br label %for.inc19

for.inc19:                                        ; preds = %for.body9, !sec !{!"public"}
  %28 = load i64, ptr %i6, align 8, !sec !{!"public", !"public"}
  %dec = add i64 %28, -1, !sec !{!"public"}
  store i64 %dec, ptr %i6, align 8, !sec !{!"public", !"public"}
  br label %for.cond7, !llvm.loop !56

for.end20:                                        ; preds = %for.cond7, !sec !{!"public"}
  store i64 0, ptr %i21, align 8, !sec !{!"public", !"public"}
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc29, %for.end20, !sec !{!"public"}
  %29 = load i64, ptr %i21, align 8, !sec !{!"public", !"public"}
  %30 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  %cmp23 = icmp ult i64 %29, %30, !sec !{!"public"}
  br i1 %cmp23, label %for.body24, label %for.end31, !sec !{!"public"}

for.body24:                                       ; preds = %for.cond22, !sec !{!"public"}
  %31 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %32 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %33 = load i64, ptr %i21, align 8, !sec !{!"public", !"public"}
  %arrayidx25 = getelementptr inbounds %struct.element, ptr %32, i64 %33, !sec !{!"public", !"public", !"public"}
  %key26 = getelementptr inbounds %struct.element, ptr %arrayidx25, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %34 = load i64, ptr %key26, align 8, !sec !{!"public", !"public"}
  %35 = load ptr, ptr %elms, align 8, !sec !{!"public", !"public"}
  %36 = load i64, ptr %i21, align 8, !sec !{!"public", !"public"}
  %arrayidx27 = getelementptr inbounds %struct.element, ptr %35, i64 %36, !sec !{!"public", !"public", !"public"}
  %37 = ptrtoint ptr %arrayidx27 to i64, !sec !{!"public"}
  %call28 = call ptr @insert(ptr noundef %31, i64 noundef %34, i64 noundef %37), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  store ptr %call28, ptr %root, align 8, !sec !{!"public", !"public"}
  br label %for.inc29

for.inc29:                                        ; preds = %for.body24, !sec !{!"public"}
  %38 = load i64, ptr %i21, align 8, !sec !{!"public", !"public"}
  %inc30 = add i64 %38, 1, !sec !{!"public"}
  store i64 %inc30, ptr %i21, align 8, !sec !{!"public", !"public"}
  br label %for.cond22, !llvm.loop !57

for.end31:                                        ; preds = %for.cond22, !sec !{!"public"}
  %39 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  %call32 = call i32 (ptr, ...) @printf(ptr noundef @.str.39, i64 noundef %39), !sec !{!"call", !"public", !{!"public", !"public"}}
  %40 = load i64, ptr @order, align 8, !sec !{!"public", !"public"}
  %call33 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, i64 noundef %40), !sec !{!"call", !"public", !{!"public", !"public"}}
  %41 = load i64, ptr @allocator_stat, align 8, !sec !{!"public", !"public"}
  %shr = lshr i64 %41, 20, !sec !{!"public"}
  %call34 = call i32 (ptr, ...) @printf(ptr noundef @.str.41, i64 noundef %shr), !sec !{!"call", !"public", !{!"public", !"public"}}
  %call35 = call i32 @usleep(i32 noundef 250), !sec !{!"call", !"public", !{!"public"}}
  store i64 0, ptr %sum, align 8, !sec !{!"public", !"public"}
  %call36 = call i32 @gettimeofday(ptr noundef %start, ptr noundef null) #8, !sec !{!"call", !"public", !{!"public", !"public"}}
  store i64 0, ptr %i37, align 8, !sec !{!"public", !"public"}
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc55, %for.end31, !sec !{!"public"}
  %42 = load i64, ptr %i37, align 8, !sec !{!"public", !"public"}
  %43 = load i64, ptr %nlookup, align 8, !sec !{!"public", !"public"}
  %cmp39 = icmp ult i64 %42, %43, !sec !{!"public"}
  br i1 %cmp39, label %for.body40, label %for.end57, !sec !{!"public"}

for.body40:                                       ; preds = %for.cond38, !sec !{!"public"}
  %call41 = call i64 @myrand(), !sec !{!"call", !"public", !{}}
  %44 = load i64, ptr %nelements, align 8, !sec !{!"public", !"public"}
  %mul42 = mul i64 %44, 2, !sec !{!"public"}
  %rem43 = urem i64 %call41, %mul42, !sec !{!"public"}
  store i64 %rem43, ptr %rdn, align 8, !sec !{!"public", !"public"}
  %45 = load ptr, ptr %root, align 8, !sec !{!"public", !"public"}
  %46 = load i64, ptr %rdn, align 8, !sec !{!"private", !"public"}
  %call44 = call ptr @find(ptr noundef %45, i64 noundef %46, i1 noundef zeroext false, ptr noundef null), !sec !{!"call", !"public", !{!"public", !"private", !"private", !"public"}}
  store ptr %call44, ptr %r, align 8, !sec !{!"public", !"public"}
  %47 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %tobool = icmp ne ptr %47, null, !sec !{!"public"}
  br i1 %tobool, label %if.then45, label %if.end54, !sec !{!"public"}

if.then45:                                        ; preds = %for.body40, !sec !{!"public"}
  %48 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %value46 = getelementptr inbounds %struct.record, ptr %48, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %49 = load i64, ptr %value46, align 8, !sec !{!"public", !"public"}
  %50 = inttoptr i64 %49 to ptr
  store ptr %50, ptr %e, align 8, !sec !{!"public", !"public"}
  %51 = load ptr, ptr %r, align 8, !sec !{!"public", !"public"}
  %stats47 = getelementptr inbounds %struct.record, ptr %51, i32 0, i32 3, !sec !{!"public", !"public", !"public", !"public"}
  %52 = load i64, ptr %stats47, align 8, !sec !{!"public", !"public"}
  %inc48 = add i64 %52, 1, !sec !{!"public"}
  store i64 %inc48, ptr %stats47, align 8, !sec !{!"public", !"public"}
  %53 = load ptr, ptr %e, align 8, !sec !{!"public", !"public"}
  %tobool49 = icmp ne ptr %53, null, !sec !{!"public"}
  br i1 %tobool49, label %if.then50, label %if.end53, !sec !{!"public"}

if.then50:                                        ; preds = %if.then45, !sec !{!"public"}
  %54 = load ptr, ptr %e, align 8, !sec !{!"public", !"public"}
  %value51 = getelementptr inbounds %struct.element, ptr %54, i32 0, i32 2, !sec !{!"public", !"public", !"public", !"public"}
  %55 = load i64, ptr %value51, align 8, !sec !{!"public", !"public"}
  %56 = load i64, ptr %sum, align 8, !sec !{!"public", !"public"}
  %add52 = add i64 %56, %55, !sec !{!"public"}
  store i64 %add52, ptr %sum, align 8, !sec !{!"public", !"public"}
  br label %if.end53

if.end53:                                         ; preds = %if.then50, %if.then45, !sec !{!"public"}
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %for.body40, !sec !{!"public"}
  br label %for.inc55

for.inc55:                                        ; preds = %if.end54, !sec !{!"public"}
  %57 = load i64, ptr %i37, align 8, !sec !{!"public", !"public"}
  %inc56 = add i64 %57, 1, !sec !{!"public"}
  store i64 %inc56, ptr %i37, align 8, !sec !{!"public", !"public"}
  br label %for.cond38, !llvm.loop !58

for.end57:                                        ; preds = %for.cond38, !sec !{!"public"}
  %call58 = call i32 @gettimeofday(ptr noundef %end, ptr noundef null) #8, !sec !{!"call", !"public", !{!"public", !"public"}}
  %58 = load i64, ptr %sum, align 8, !sec !{!"public", !"public"}
  %tv_sec = getelementptr inbounds %struct.timeval, ptr %end, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %59 = load i64, ptr %tv_sec, align 8, !sec !{!"public", !"public"}
  %tv_sec59 = getelementptr inbounds %struct.timeval, ptr %start, i32 0, i32 0, !sec !{!"public", !"public", !"public", !"public"}
  %60 = load i64, ptr %tv_sec59, align 8, !sec !{!"public", !"public"}
  %sub = sub nsw i64 %59, %60, !sec !{!"public"}
  %call60 = call i32 (ptr, ...) @printf(ptr noundef @.str.42, i64 noundef %58, i64 noundef %sub), !sec !{!"call", !"public", !{!"public", !"public", !"public"}}
  %call61 = call i32 (ptr, ...) @printf(ptr noundef @.str.43), !sec !{!"call", !"public", !{!"public"}}
  ret i32 0, !sec !{!"public"}
}

declare !sec !{!"public", !"public", !{!"public", !"public"}} i32 @usleep(i32 noundef) #1

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public"}} i32 @gettimeofday(ptr noundef, ptr noundef) #6

; Function Attrs: nounwind
declare !sec !{!"public", !"public", !{!"public", !"public", !"public"}} i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) #6

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
