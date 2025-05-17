#!/bin/bash
# Generate the input file
clang -emit-llvm -S -Xclang -disable-O0-optnone -c input_for_fcmp_eq.c -o input_for_fcmp_eq.ll
# Run the pass
opt --load-pass-plugin ../build/lib/libFindFCmpEq.so --passes="print<find-fcmp-eq>" -disable-output input_for_fcmp_eq.ll
