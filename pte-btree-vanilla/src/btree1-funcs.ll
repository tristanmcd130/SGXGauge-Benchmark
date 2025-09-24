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