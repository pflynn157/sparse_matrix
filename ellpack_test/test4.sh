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

mkdir -p csv/bcsstk17
mkdir -p csv/cant
mkdir -p csv/pdb1HYS
mkdir -p csv/rma10

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
function run() {
    echo $1
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir/$1.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

    $LLVM_BASE/clang /tmp/first.ll -o exe -L$COMET_BASE/lib -lcomet_runner_utils -march=knl -O3 -ftree-vectorize
    printf "" > csv/$2/$1_$3_knl_O3.csv
    ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_knl_O3.csv
    
    echo ""
    echo ""
}

# 1024x? matrices
export SPARSE_FILE_NAME0=data/bcsstk17.mtx
run "csr_mv" "bcsstk17" "bcsstk17"
run "ell_mv1" "bcsstk17" "bcsstk17"
run "ell_mv2" "bcsstk17" "bcsstk17"
run "csr_mm_bcsstk17" "bcsstk17" "bcsstk17"
run "ell1_mm_bcsstk17" "bcsstk17" "bcsstk17"
run "ell2_mm_bcsstk17" "bcsstk17" "bcsstk17"

export SPARSE_FILE_NAME0=data/cant.mtx
run "csr_mv" "cant" "cant"
run "ell_mv1" "cant" "cant"
run "ell_mv2" "cant" "cant"
run "csr_mm_cant" "cant" "cant"
run "ell1_mm_cant" "cant" "cant"
run "ell2_mm_cant" "cant" "cant"

export SPARSE_FILE_NAME0=data/pdb1HYS.mtx
run "csr_mv" "pdb1HYS" "pdb1HYS"
run "ell_mv1" "pdb1HYS" "pdb1HYS"
run "ell_mv2" "pdb1HYS" "pdb1HYS"
run "csr_mm_pdb1HYS" "pdb1HYS" "pdb1HYS"
run "ell1_mm_pdb1HYS" "pdb1HYS" "pdb1HYS"
run "ell2_mm_pdb1HYS" "pdb1HYS" "pdb1HYS"

export SPARSE_FILE_NAME0=data/rma10.mtx
run "csr_mv" "rma10" "rma10"
run "ell_mv1" "rma10" "rma10"
run "ell_mv2" "rma10" "rma10"
run "csr_mm_rma10" "rma10" "rma10"
run "ell1_mm_rma10" "rma10" "rma10"
run "ell2_mm_rma10" "rma10" "rma10"

