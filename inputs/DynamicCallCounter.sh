#!/bin/bash -x
clang -emit-llvm -c input_for_cc.c -o input_for_cc.bc
opt -load-pass-plugin ../build/lib/libDynamicCallCounter.so -passes="dynamic-cc" input_for_cc.bc -o instrumented_bin
lli instrumented_bin
