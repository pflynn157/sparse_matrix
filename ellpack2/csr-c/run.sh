#!/bin/bash

#clang csr.c -o csr -march=native -O2
#./csr 2> actual.txt
#diff actual.txt expected.txt

#####################################3
# Testing
export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/install/lib:/home/patrick/Work/PNNL/COMET/build/lib"
export SPARSE_FILE_NAME0=square.mtx

export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

$COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm csr.mlir &> /tmp/first.mlir
$LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

$LLVM_BASE/clang /tmp/first.ll csr.c -o csr -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
./csr


