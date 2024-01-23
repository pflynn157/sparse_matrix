#!/bin/bash
#####################################3
# Testing
# Work PC
#export LD_LIBRARY_PATH="/home/pflynn5/PNNL/COMET/install/lib:/home/pflynn5/PNNL/COMET/build/lib"
#export COMET_BASE="/home/pflynn5/PNNL/COMET/build"
#export LLVM_BASE="/home/pflynn5/PNNL/COMET/llvm/build/bin"

# Carina
export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib"
export COMET_BASE="/home/pflynn5/COMET/build"
export LLVM_BASE="/home/pflynn5/COMET/llvm/build/bin"

# PC
#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/build/lib:/home/patrick/Work/PNNL/COMET/install/lib"
#export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

if [ ! -d ./csv ] ; then
    mkdir csv
fi

mkdir -p csv/test1_mv1024
mkdir -p csv/test1_mv512
mkdir -p csv/test1_mm1024
mkdir -p csv/test1_mm512

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
function run() {
    echo $1
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir/$1.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

    $LLVM_BASE/clang /tmp/first.ll -o exe -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
    printf "" > csv/$2/$1_$3_native_O2.csv
    ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_native_O2.csv
    
    echo ""
    echo ""
}

# 1024x? matrices
export SPARSE_FILE_NAME0=1024/1024x8.mtx
run "csr_mv" "test1_mv1024" "1024x8"
run "ell_mv1" "test1_mv1024" "1024x8"
run "ell_mv2" "test1_mv1024" "1024x8"
run "csr_mm8" "test1_mm1024" "1024x8"
run "ell1_mm8" "test1_mm1024" "1024x8"
run "ell2_mm8" "test1_mm1024" "1024x8"

export SPARSE_FILE_NAME0=1024/1024x16.mtx
run "csr_mv" "test1_mv1024" "1024x16"
run "ell_mv1" "test1_mv1024" "1024x16"
run "ell_mv2" "test1_mv1024" "1024x16"
run "csr_mm16" "test1_mm1024" "1024x16"
run "ell1_mm16" "test1_mm1024" "1024x16"
run "ell2_mm16" "test1_mm1024" "1024x16"

export SPARSE_FILE_NAME0=1024/1024x32.mtx
run "csr_mv" "test1_mv1024" "1024x32"
run "ell_mv1" "test1_mv1024" "1024x32"
run "ell_mv2" "test1_mv1024" "1024x32"
run "csr_mm32" "test1_mm1024" "1024x32"
run "ell1_mm32" "test1_mm1024" "1024x32"
run "ell2_mm32" "test1_mm1024" "1024x32"

export SPARSE_FILE_NAME0=1024/1024x512.mtx
run "csr_mv" "test1_mv1024" "1024x512"
run "ell_mv1" "test1_mv1024" "1024x512"
run "ell_mv2" "test1_mv1024" "1024x512"
run "csr_mm512" "test1_mm1024" "1024x512"
run "ell1_mm512" "test1_mm1024" "1024x512"
run "ell2_mm512" "test1_mm1024" "1024x512"

export SPARSE_FILE_NAME0=1024/1024x1024.mtx
run "csr_mv" "test1_mv1024" "1024x1024"
run "ell_mv1" "test1_mv1024" "1024x1024"
run "ell_mv2" "test1_mv1024" "1024x1024"
run "csr_mm1024" "test1_mm1024" "1024x1024"
run "ell1_mm1024" "test1_mm1024" "1024x1024"
run "ell2_mm1024" "test1_mm1024" "1024x1024"

# 512x? matrices
export SPARSE_FILE_NAME0=512/512x8.mtx
run "csr_mv" "test1_mv512" "512x8"
run "ell_mv1" "test1_mv512" "512x8"
run "ell_mv2" "test1_mv512" "512x8"
run "csr_mm8" "test1_mm512" "512x8"
run "ell1_mm8" "test1_mm512" "512x8"
run "ell2_mm8" "test1_mm512" "512x8"

export SPARSE_FILE_NAME0=512/512x16.mtx
run "csr_mv" "test1_mv512" "512x16"
run "ell_mv1" "test1_mv512" "512x16"
run "ell_mv2" "test1_mv512" "512x16"
run "csr_mm16" "test1_mm512" "512x16"
run "ell1_mm16" "test1_mm512" "512x16"
run "ell2_mm16" "test1_mm512" "512x16"

export SPARSE_FILE_NAME0=512/512x32.mtx
run "csr_mv" "test1_mv512" "512x32"
run "ell_mv1" "test1_mv512" "512x32"
run "ell_mv2" "test1_mv512" "512x32"
run "csr_mm32" "test1_mm512" "512x32"
run "ell1_mm32" "test1_mm512" "512x32"
run "ell2_mm32" "test1_mm512" "512x32"

export SPARSE_FILE_NAME0=512/512x128.mtx
run "csr_mv" "test1_mv512" "512x128"
run "ell_mv1" "test1_mv512" "512x128"
run "ell_mv2" "test1_mv512" "512x128"
run "csr_mm128" "test1_mm512" "512x128"
run "ell1_mm128" "test1_mm512" "512x128"
run "ell2_mm128" "test1_mm512" "512x128"

export SPARSE_FILE_NAME0=512/512x512.mtx
run "csr_mv" "test1_mv512" "512x512"
run "ell_mv1" "test1_mv512" "512x512"
run "ell_mv2" "test1_mv512" "512x512"
run "csr_mm512" "test1_mm512" "512x512"
run "ell1_mm512" "test1_mm512" "512x512"
run "ell2_mm512" "test1_mm512" "512x512"


