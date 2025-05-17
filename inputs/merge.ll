; ModuleID = 'foo.ll'
source_filename = "foo.ll"

define i32 @foo(i32 %0) {
  %2 = icmp eq i32 %0, 19
  br i1 %2, label %3, label %3

3:                                                ; preds = %1, %1
  %4 = add i32 %0, 13
  br label %5

5:                                                ; preds = %3
  ret i32 %4
}
