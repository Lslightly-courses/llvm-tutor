#!/bin/bash
clang -emit-llvm -S input_for_mba_sub.c -o input_for_sub.ll
opt -load-pass-plugin=../build/lib/libMBASub.so -passes="mba-sub" -S input_for_sub.ll -o MBASub_out.ll

clang -O1 -emit-llvm -S input_for_mba.c -o input_for_mba.ll
opt -load-pass-plugin=../build/lib/libMBAAdd.so -passes="mba-add" -S input_for_mba.ll -o MBAAdd_out.ll

