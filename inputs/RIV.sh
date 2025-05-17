#!/bin/bash
# Generate an LLVM file to analyze
clang -emit-llvm -S -O1 input_for_riv.c -o input_for_riv.ll
# Run the pass through opt
opt -load-pass-plugin ../build/lib/libRIV.so -passes="print<riv>" -disable-output input_for_riv.ll
