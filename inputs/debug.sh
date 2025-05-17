#!/bin/bash -x
clang -emit-llvm -S -O1 input_for_mba.c -o input_for_mba.ll
opt -S -load-pass-plugin ../build/lib/libMBAAdd.so -passes=mba-add input_for_mba.ll -stats -o out.ll

# note:
# for -stat
# Statistics are disabled.  Build with asserts or with -DLLVM_FORCE_ENABLE_STATS
# As you can see, you get a nice summary from MBAAdd. In many cases this will be sufficient to understand what might be going wrong. Note that for these macros to work you need a debug build of LLVM (i.e. opt) and llvm-tutor (i.e. use -DCMAKE_BUILD_TYPE=Debug instead of -DCMAKE_BUILD_TYPE=Release).