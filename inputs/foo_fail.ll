define i32 @foo(i32) {
  %2 = icmp eq i32 %0, 19
  br i1 %2, label %3, label %6

; <label>:3:
  %4 = add i32 %0,  13
  %5 = add i32 %4, 1
  br label %9

; <label>:6:
  %7 = add i32 %0,  13
  %8 = add i32 %7, 1
  br label %9

; <label>:9:
  %10 = phi i32 [ %4, %3 ], [ %7, %6 ]
  %11 = phi i32 [ %5, %3 ], [ %8, %6 ]
  ret i32 %10
}