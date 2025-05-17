#!/bin/bash -x
clang -emit-llvm -S -O1 input_for_mba.c -o input_for_mba.ll
gdb --args opt -S -load-pass-plugin ../build/lib/libMBAAdd.so -passes=mba-add input_for_mba.ll -o out.ll
