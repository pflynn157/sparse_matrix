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

mkdir -p csv/test_c

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
function run() {
    echo $1
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir-c/$1.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll
    
    $LLVM_BASE/clang mlir-c/lib.c -c -o /tmp/lib.o -march=native -O2 -ftree-vectorize

    $LLVM_BASE/clang /tmp/first.ll /tmp/lib.o -o exe -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
    printf "" > csv/$2/$1_$3.csv
    ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3.csv
    #./exe
    
    echo ""
    echo ""
}

export SPARSE_FILE_NAME0=1024/1024x8.mtx
run "csr_mv" "test_c" "1024x8"
run "ell_mv1" "test_c" "1024x8"
run "ell_mv2" "test_c" "1024x8"
run "csr_mm8" "test_c" "1024x8"
run "ell1_mm8" "test_c" "1024x8"
run "ell2_mm8" "test_c" "1024x8"

export SPARSE_FILE_NAME0=1024/1024x16.mtx
run "csr_mv" "test_c" "1024x16"
run "ell_mv1" "test_c" "1024x16"
run "ell_mv2" "test_c" "1024x16"
run "csr_mm16" "test_c" "1024x16"
run "ell1_mm16" "test_c" "1024x16"
run "ell2_mm16" "test_c" "1024x16"

export SPARSE_FILE_NAME0=1024/1024x32.mtx
run "csr_mv" "test_c" "1024x32"
run "ell_mv1" "test_c" "1024x32"
run "ell_mv2" "test_c" "1024x32"
run "csr_mm32" "test_c" "1024x32"
run "ell1_mm32" "test_c" "1024x32"
run "ell2_mm32" "test_c" "1024x32"

export SPARSE_FILE_NAME0=1024/1024x512.mtx
run "csr_mv" "test_c" "1024x512"
run "ell_mv1" "test_c" "1024x512"
run "ell_mv2" "test_c" "1024x512"
run "csr_mm512" "test_c" "1024x512"
run "ell1_mm512" "test_c" "1024x512"
run "ell2_mm512" "test_c" "1024x512"

export SPARSE_FILE_NAME0=1024/1024x1024.mtx
run "csr_mv" "test_c" "1024x1024"
run "ell_mv1" "test_c" "1024x1024"
run "ell_mv2" "test_c" "1024x1024"
run "csr_mm1024" "test_c" "1024x1024"
run "ell1_mm1024" "test_c" "1024x1024"
run "ell2_mm1024" "test_c" "1024x1024"

##
## Real-world
##
export SPARSE_FILE_NAME0=data/bcsstk17.mtx
run "csr_mv" "test_c" "bcsstk17"
run "ell_mv1" "test_c" "bcsstk17"
run "ell_mv2" "test_c" "bcsstk17"
run "csr_mm_bcsstk17" "test_c" "bcsstk17"
run "ell1_mm_bcsstk17" "test_c" "bcsstk17"
run "ell2_mm_bcsstk17" "test_c" "bcsstk17"

export SPARSE_FILE_NAME0=data/cant.mtx
run "csr_mv" "test_c" "cant"
run "ell_mv1" "test_c" "cant"
run "ell_mv2" "test_c" "cant"
run "csr_mm_cant" "test_c" "cant"
run "ell1_mm_cant" "test_c" "cant"
run "ell2_mm_cant" "test_c" "cant"

export SPARSE_FILE_NAME0=data/pdb1HYS.mtx
run "csr_mv" "test_c" "pdb1HYS"
run "ell_mv1" "test_c" "pdb1HYS"
run "ell_mv2" "test_c" "pdb1HYS"
run "csr_mm_pdb1HYS" "test_c" "pdb1HYS"
run "ell1_mm_pdb1HYS" "test_c" "pdb1HYS"
run "ell2_mm_pdb1HYS" "test_c" "pdb1HYS"

export SPARSE_FILE_NAME0=data/rma10.mtx
run "csr_mv" "test_c" "rma10"
run "ell_mv1" "test_c" "rma10"
run "ell_mv2" "test_c" "rma10"
run "csr_mm_rma10" "test_c" "rma10"
run "ell1_mm_rma10" "test_c" "rma10"
run "ell2_mm_rma10" "test_c" "rma10"

