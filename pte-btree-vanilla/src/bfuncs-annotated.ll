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