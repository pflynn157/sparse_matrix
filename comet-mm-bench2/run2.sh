#!/bin/bash

if [ ! -d build ]
then
    mkdir build
fi

if [ ! -d csv ]
then
    mkdir csv
    mkdir csv/CSR
    mkdir csv/COO
    mkdir csv/ELL
    mkdir csv/BCSR
fi

#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/install/lib"
#export COMET_PATH="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_PATH="/home/patrick/Work/PNNL/COMET/llvm/build/bin"
export LD_LIBRARY_PATH="/home/pflynn5/COMET/install/lib"
export COMET_PATH="/home/pflynn5/COMET/build"
export LLVM_PATH="/home/pflynn5/COMET/llvm/build/bin"

##
## Depends on environment variables being set
## SPARSE_FILE_NAME0
## $1 = the name for our file
##
function run_benchmark() {
    # CSR
    printf "" > csv/CSR/CSR_$1.csv
    echo "Running $1 for CSR"
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/csr_$1.mlir &> build/csr_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/csr_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/CSR/CSR_$1.csv 
    
    # COO
    printf "" > csv/COO/COO_$1.csv
    echo "Running $1 for COO"
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/coo_$1.mlir &> build/coo_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/coo_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/COO/COO_$1.csv
    
    # ELL
    printf "" > csv/ELL/ELL_$1.csv
    echo "Running $1 for ELL"
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/ell_$1.mlir &> build/ell_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/ell_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/ELL/ELL_$1.csv
    
    # BCSR
    # Block sizes 2, 4, 8, 16, 32, default
    export BLOCK_ROWS=1
    export BLOCK_COLS=1
    echo "Running $1 for BCSR 1x1"
    printf "" > csv/BCSR/BCSR_$1_1x1.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/bcsr_$1.mlir &> build/bcsr_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_1x1.csv
    
    # Block size 2
    export BLOCK_ROWS=2
    export BLOCK_COLS=2
    echo "Running $1 for BCSR 2x2"
    printf "" > csv/BCSR/BCSR_$1_2x2.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/bcsr_$1.mlir &> build/bcsr_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_2x2.csv
    
    # Block size 4
    export BLOCK_ROWS=4
    export BLOCK_COLS=4
    echo "Running $1 for BCSR 4x4"
    printf "" > csv/BCSR/BCSR_$1_4x4.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/bcsr_$1.mlir &> build/bcsr_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_4x4.csv
        
    # Block size 16
    export BLOCK_ROWS=16
    export BLOCK_COLS=16
    echo "Running $1 for BCSR 16x16"
    printf "" > csv/BCSR/BCSR_$1_16x16.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm $1/bcsr_$1.mlir &> build/bcsr_$1.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_$1.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_16x16.csv
}

export SPARSE_FILE_NAME0=../data/data/rma10/rma10.mtx
run_benchmark "rma10"

export SPARSE_FILE_NAME0=../data/data/scircuit/scircuit.mtx
run_benchmark "scircuit"

# TODO: ELL/BCSR needed
#export SPARSE_FILE_NAME0=../data/data/shipsec1/shipsec1.mtx
#run_benchmark "shipsec1"

export SPARSE_FILE_NAME0=../data/data/com-LiveJournal/com-LiveJournal_Communities_top5000.mtx
run_benchmark "com-LiveJournal_Communities_top5000"


