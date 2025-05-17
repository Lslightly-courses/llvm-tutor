#!/bin/bash
clang -emit-llvm -S -O1 input_for_duplicate_bb.c -o input_for_duplicate_bb.ll
opt -load-pass-plugin ../build/lib/libRIV.so -load-pass-plugin ../build/lib/libDuplicateBB.so -passes=duplicate-bb -S input_for_duplicate_bb.ll -o duplicate.ll

clang -emit-llvm -S -O1 input_for_riv.c -o input_for_riv.ll
opt -load-pass-plugin ../build/lib/libRIV.so -load-pass-plugin ../build/lib/libDuplicateBB.so -passes=duplicate-bb -S input_for_riv.ll -o duplicate_riv.ll