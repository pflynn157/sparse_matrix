#!/bin/bash

if [ ! -d build ]
then
    mkdir build
fi

if [ ! -d csv ]
then
    mkdir csv
fi

#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/build/lib:/home/patrick/Work/PNNL/COMET/install/lib"
#export COMET_PATH="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_PATH="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib"
export COMET_PATH="/home/pflynn5/COMET/build"
export LLVM_PATH="/home/pflynn5/COMET/llvm/build/bin"


##
## Depends on environment variables being set
## SPARSE_FILE_NAME0
## $1 = the name for our file
##
function run_benchmark() {
    # ELL
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm ell_mv.mlir &> build/ell_mv.mlir
    $LLVM_PATH/mlir-translate --mlir-to-llvmir build/ell_mv.mlir &> build/ell.ll
    
    # Test 1
    printf "" > csv/ELL_native_O2.csv
    $LLVM_PATH/clang build/ell.ll -o build/ell -L$COMET_PATH/lib -lcomet_runner_utils -march=native -O2
    build/ell | grep -oP '\d+\.\d+' >> csv/ELL_native_O2.csv
    
    # Test 2
    printf "" > csv/ELL_native_O3.csv
    $LLVM_PATH/clang build/ell.ll -o build/ell -L$COMET_PATH/lib -lcomet_runner_utils -march=native -O3
    build/ell | grep -oP '\d+\.\d+' >> csv/ELL_native_O3.csv
    
    # Test 3
    printf "" > csv/ELL_knl_O2.csv
    $LLVM_PATH/clang build/ell.ll -o build/ell -L$COMET_PATH/lib -lcomet_runner_utils -march=knl -O2
    build/ell | grep -oP '\d+\.\d+' >> csv/ELL_knl_O2.csv
    
    # Test 4
    printf "" > csv/ELL_knl_O3.csv
    $LLVM_PATH/clang build/ell.ll -o build/ell -L$COMET_PATH/lib -lcomet_runner_utils -march=knl -O3
    build/ell | grep -oP '\d+\.\d+' >> csv/ELL_knl_O3.csv
}

export SPARSE_FILE_NAME0=../data/data/bcsstk17/bcsstk17.mtx
run_benchmark "bcsstk17"

#export SPARSE_FILE_NAME0=../data/data/cant/cant.mtx
#run_benchmark "cant"

#export SPARSE_FILE_NAME0=../data/data/consph/consph.mtx
#run_benchmark "consph"

#export SPARSE_FILE_NAME0=../data/data/cop20k_A/cop20k_A.mtx
#run_benchmark "cop20k_A"

#export SPARSE_FILE_NAME0=../data/data/pdb1HYS/pdb1HYS.mtx
#run_benchmark "pdb1HYS"

#export SPARSE_FILE_NAME0=../data/data/rma10/rma10.mtx
#run_benchmark "rma10"

#export SPARSE_FILE_NAME0=../data/data/rma10/rma10_b.mtx
#run_benchmark "rma10_b"

#export SPARSE_FILE_NAME0=../data/data/shipsec1/shipsec1.mtx
#run_benchmark "shipsec1"

#export SPARSE_FILE_NAME0=../data/data/scircuit/scircuit.mtx
#run_benchmark "scircuit"

#export SPARSE_FILE_NAME0=../data/data/scircuit/scircuit_b.mtx
#run_benchmark "scircuit_b"

#export SPARSE_FILE_NAME0=../data/data/com-LiveJournal/com-LiveJournal_Communities_top5000.mtx
#run_benchmark "com-LiveJournal_Communities_top5000"

#export SPARSE_FILE_NAME0=../data/data/com-LiveJournal/com-LiveJournal_nodeid.mtx
#run_benchmark "com-LiveJournal_nodeid"

