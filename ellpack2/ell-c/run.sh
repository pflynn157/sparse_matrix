#!/bin/bash
#####################################3
# Testing
export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/install/lib:/home/patrick/Work/PNNL/COMET/build/lib"
export SPARSE_FILE_NAME0=small.mtx

export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

$COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm ell.mlir &> /tmp/first.mlir
$LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

$LLVM_BASE/clang /tmp/first.ll ell.c -o ell -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
./ell


