#!/bin/bash -x
clang -emit-llvm -c input_for_cc.c -o input_for_cc.bc
opt -load-pass-plugin ../build/lib/libStaticCallCounter.so -passes="print<static-cc>" -disable-output input_for_cc.bc

