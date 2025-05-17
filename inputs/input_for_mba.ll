; ModuleID = 'input_for_mba.c'
source_filename = "input_for_mba.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef signext i8 @foo(i8 noundef signext %0, i8 noundef signext %1, i8 noundef signext %2, i8 noundef signext %3) local_unnamed_addr #0 {
  %5 = add i8 %1, %0
  %6 = add i8 %5, %2
  %7 = add i8 %6, %3
  ret i8 %7
}

; Function Attrs: mustprogress nofree nounwind willreturn uwtable
define dso_local range(i32 -128, 128) i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = getelementptr inbounds i8, ptr %1, i64 8
  %4 = load ptr, ptr %3, align 8, !tbaa !5
  %5 = tail call i64 @strtol(ptr nocapture noundef nonnull %4, ptr noundef null, i32 noundef 10) #3
  %6 = getelementptr inbounds i8, ptr %1, i64 16
  %7 = load ptr, ptr %6, align 8, !tbaa !5
  %8 = tail call i64 @strtol(ptr nocapture noundef nonnull %7, ptr noundef null, i32 noundef 10) #3
  %9 = getelementptr inbounds i8, ptr %1, i64 24
  %10 = load ptr, ptr %9, align 8, !tbaa !5
  %11 = tail call i64 @strtol(ptr nocapture noundef nonnull %10, ptr noundef null, i32 noundef 10) #3
  %12 = getelementptr inbounds i8, ptr %1, i64 32
  %13 = load ptr, ptr %12, align 8, !tbaa !5
  %14 = tail call i64 @strtol(ptr nocapture noundef nonnull %13, ptr noundef null, i32 noundef 10) #3
  %15 = trunc i64 %5 to i32
  %16 = trunc i64 %8 to i32
  %17 = trunc i64 %11 to i32
  %18 = trunc i64 %14 to i32
  %19 = add i32 %16, %15
  %20 = add i32 %19, %17
  %21 = add i32 %20, %18
  %22 = shl i32 %21, 24
  %23 = ashr exact i32 %22, 24
  ret i32 %23
}

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 19.1.1 (/home/runner/work/llvm-project/llvm-project/clang d401987fe349a87c53fe25829215b080b70c0c1a)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
