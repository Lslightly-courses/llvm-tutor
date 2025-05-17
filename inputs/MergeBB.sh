#!/bin/bash -x
opt -load-pass-plugin ../build/lib/libMergeBB.so -passes=merge-bb -S foo.ll -o merge.ll
# because of canMergeInstructions, this case will failed to be merged.
opt -load-pass-plugin ../build/lib/libMergeBB.so -passes=merge-bb -S foo_fail.ll -o merge_fail.ll

clang -emit-llvm -S -O1 input_for_duplicate_bb.c -o input_for_duplicate_bb.ll
opt -load-pass-plugin ../build/lib/libRIV.so -load-pass-plugin ../build/lib/libMergeBB.so -load-pass-plugin ../build/lib/libDuplicateBB.so -passes=duplicate-bb,merge-bb -S input_for_duplicate_bb.ll -o merge_after_duplicate.ll

# because of canMergeInstructions, this case will failed to be merged.
clang -emit-llvm -S -O0 -Xclang -disable-O0-optnone input_for_merge_fail.c -o input_for_merge_fail.ll
opt -passes=mem2reg -S input_for_merge_fail.ll -o input_for_merge_fail.ll
opt -load-pass-plugin ../build/lib/libRIV.so -load-pass-plugin ../build/lib/libMergeBB.so -load-pass-plugin ../build/lib/libDuplicateBB.so -passes=duplicate-bb,merge-bb -S input_for_merge_fail.ll -o merge_after_duplicate_fail.ll