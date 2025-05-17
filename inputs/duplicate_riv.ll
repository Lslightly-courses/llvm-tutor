; ModuleID = 'input_for_riv.ll'
source_filename = "input_for_riv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @foo(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
lt-if-then-else-0:
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %lt-clone-1-0, label %lt-clone-2-0

lt-clone-1-0:                                     ; preds = %lt-if-then-else-0
  %4 = add nsw i32 %0, 123
  %5 = icmp sgt i32 %0, 0
  br label %lt-tail-0

lt-clone-2-0:                                     ; preds = %lt-if-then-else-0
  %6 = add nsw i32 %0, 123
  %7 = icmp sgt i32 %0, 0
  br label %lt-tail-0

lt-tail-0:                                        ; preds = %lt-clone-2-0, %lt-clone-1-0
  %8 = phi i32 [ %4, %lt-clone-1-0 ], [ %6, %lt-clone-2-0 ]
  %9 = phi i1 [ %5, %lt-clone-1-0 ], [ %7, %lt-clone-2-0 ]
  br i1 %9, label %lt-if-then-else-1, label %lt-if-then-else-4

lt-if-then-else-1:                                ; preds = %lt-tail-0
  %10 = icmp eq i32 %2, 0
  br i1 %10, label %lt-clone-1-1, label %lt-clone-2-1

lt-clone-1-1:                                     ; preds = %lt-if-then-else-1
  %11 = mul nsw i32 %1, %0
  %12 = sdiv i32 %1, %2
  %13 = icmp eq i32 %11, %12
  br label %lt-tail-1

lt-clone-2-1:                                     ; preds = %lt-if-then-else-1
  %14 = mul nsw i32 %1, %0
  %15 = sdiv i32 %1, %2
  %16 = icmp eq i32 %14, %15
  br label %lt-tail-1

lt-tail-1:                                        ; preds = %lt-clone-2-1, %lt-clone-1-1
  %17 = phi i32 [ %11, %lt-clone-1-1 ], [ %14, %lt-clone-2-1 ]
  %18 = phi i32 [ %12, %lt-clone-1-1 ], [ %15, %lt-clone-2-1 ]
  %19 = phi i1 [ %13, %lt-clone-1-1 ], [ %16, %lt-clone-2-1 ]
  br i1 %19, label %lt-if-then-else-2, label %lt-if-then-else-3

lt-if-then-else-2:                                ; preds = %lt-tail-1
  %20 = icmp eq i32 %17, 0
  br i1 %20, label %lt-clone-1-2, label %lt-clone-2-2

lt-clone-1-2:                                     ; preds = %lt-if-then-else-2
  %21 = mul i32 %17, -2
  %22 = mul i32 %21, %18
  %23 = add i32 %8, %22
  br label %lt-tail-2

lt-clone-2-2:                                     ; preds = %lt-if-then-else-2
  %24 = mul i32 %17, -2
  %25 = mul i32 %24, %18
  %26 = add i32 %8, %25
  br label %lt-tail-2

lt-tail-2:                                        ; preds = %lt-clone-2-2, %lt-clone-1-2
  %27 = phi i32 [ %21, %lt-clone-1-2 ], [ %24, %lt-clone-2-2 ]
  %28 = phi i32 [ %22, %lt-clone-1-2 ], [ %25, %lt-clone-2-2 ]
  %29 = phi i32 [ %23, %lt-clone-1-2 ], [ %26, %lt-clone-2-2 ]
  br label %lt-if-then-else-4

lt-if-then-else-3:                                ; preds = %lt-tail-1
  %30 = icmp eq i32 %0, 0
  br i1 %30, label %lt-clone-1-3, label %lt-clone-2-3

lt-clone-1-3:                                     ; preds = %lt-if-then-else-3
  %31 = mul nsw i32 %2, 987
  %32 = mul nsw i32 %31, %18
  br label %lt-tail-3

lt-clone-2-3:                                     ; preds = %lt-if-then-else-3
  %33 = mul nsw i32 %2, 987
  %34 = mul nsw i32 %33, %18
  br label %lt-tail-3

lt-tail-3:                                        ; preds = %lt-clone-2-3, %lt-clone-1-3
  %35 = phi i32 [ %31, %lt-clone-1-3 ], [ %33, %lt-clone-2-3 ]
  %36 = phi i32 [ %32, %lt-clone-1-3 ], [ %34, %lt-clone-2-3 ]
  br label %lt-if-then-else-4

lt-if-then-else-4:                                ; preds = %lt-tail-3, %lt-tail-2, %lt-tail-0
  %37 = phi i32 [ %29, %lt-tail-2 ], [ %36, %lt-tail-3 ], [ 321, %lt-tail-0 ]
  %38 = icmp eq i1 %9, false
  br i1 %38, label %lt-clone-1-4, label %lt-clone-2-4

lt-clone-1-4:                                     ; preds = %lt-if-then-else-4
  br label %lt-tail-4

lt-clone-2-4:                                     ; preds = %lt-if-then-else-4
  br label %lt-tail-4

lt-tail-4:                                        ; preds = %lt-clone-2-4, %lt-clone-1-4
  ret i32 %37
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 19.1.1 (/home/runner/work/llvm-project/llvm-project/clang d401987fe349a87c53fe25829215b080b70c0c1a)"}
