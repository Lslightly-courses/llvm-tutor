; ModuleID = 'input_for_merge_fail.ll'
source_filename = "input_for_merge_fail.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @pure(i32 noundef %0) #0 {
lt-if-then-else-0:
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lt-clone-2-0, label %lt-clone-2-0

lt-clone-2-0:                                     ; preds = %lt-if-then-else-0, %lt-if-then-else-0
  br label %lt-tail-0

lt-tail-0:                                        ; preds = %lt-clone-2-0
  ret i32 %0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
lt-if-then-else-1:
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lt-clone-1-1, label %lt-clone-2-1

lt-clone-1-1:                                     ; preds = %lt-if-then-else-1
  %2 = add nsw i32 13, %0
  %3 = add nsw i32 %2, 1
  %4 = call i32 @pure(i32 noundef %3)
  br label %lt-tail-1

lt-clone-2-1:                                     ; preds = %lt-if-then-else-1
  %5 = add nsw i32 13, %0
  %6 = add nsw i32 %5, 1
  %7 = call i32 @pure(i32 noundef %6)
  br label %lt-tail-1

lt-tail-1:                                        ; preds = %lt-clone-2-1, %lt-clone-1-1
  %8 = phi i32 [ %2, %lt-clone-1-1 ], [ %5, %lt-clone-2-1 ]
  %9 = phi i32 [ %3, %lt-clone-1-1 ], [ %6, %lt-clone-2-1 ]
  %10 = phi i32 [ %4, %lt-clone-1-1 ], [ %7, %lt-clone-2-1 ]
  ret i32 %10
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 19.1.1 (/home/runner/work/llvm-project/llvm-project/clang d401987fe349a87c53fe25829215b080b70c0c1a)"}
