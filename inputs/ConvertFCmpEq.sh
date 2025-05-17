#!/bin/bash
clang -emit-llvm -S -Xclang -disable-O0-optnone \
  -c input_for_fcmp_eq.c -o input_for_fcmp_eq.ll
opt --load-pass-plugin ../build/lib/libFindFCmpEq.so \
  --load-pass-plugin ../build/lib/libConvertFCmpEq.so \
  --passes=convert-fcmp-eq -S input_for_fcmp_eq.ll -o fcmp_eq_after_conversion.ll
