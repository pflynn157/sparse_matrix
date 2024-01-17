#!/bin/bash

#clang csr.c -o csr -march=native -O2
#./csr 2> actual.txt
#diff actual.txt expected.txt

#####################################3
# Testing
#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/install/lib:/home/patrick/Work/PNNL/COMET/build/lib"
#export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib"
export COMET_BASE="/home/pflynn5/COMET/build"
export LLVM_BASE="/home/pflynn5/COMET/llvm/build/bin"

export SPARSE_FILE_NAME0=square.mtx

$COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm csr.mlir &> /tmp/first.mlir
$LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

$LLVM_BASE/clang /tmp/first.ll csr.c -o csr -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
./csr


