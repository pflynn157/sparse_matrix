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
    #printf "" > csv/CSR/CSR_$1.csv
    #echo "Running $1 for CSR"
    #$COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm csr_mv.mlir &> build/csr_mv.mlir
    #$LLVM_PATH/mlir-cpu-runner build/csr_mv.mlir -O3 -e main -entry-point-result=void \
    #    -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/CSR/CSR_$1.csv
    
    # COO
    #printf "" > csv/COO/COO_$1.csv
    #echo "Running $1 for COO"
    #$COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm coo_mv.mlir &> build/coo_mv.mlir
    #$LLVM_PATH/mlir-cpu-runner build/coo_mv.mlir -O3 -e main -entry-point-result=void \
    #    -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/COO/COO_$1.csv
    
    # ELL
    #printf "" > csv/ELL/ELL_$1.csv
    #echo "Running $1 for ELL"
    #$COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm ell_mv.mlir &> build/ell_mv.mlir
    #$LLVM_PATH/mlir-cpu-runner build/ell_mv.mlir -O3 -e main -entry-point-result=void \
    #    -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/ELL/ELL_$1.csv
    
    # BCSR
    # Block sizes 2, 4, 8, 16, 32, default
    export BLOCK_ROWS=1
    export BLOCK_COLS=1
    echo "Running $1 for BCSR 1x1"
    printf "" > csv/BCSR/BCSR_$1_1x1.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.mlir &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_1x1.csv
    
    export BLOCK_ROWS=2
    export BLOCK_COLS=2
    echo "Running $1 for BCSR 2x2"
    printf "" > csv/BCSR/BCSR_$1_2x2.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.mlir &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_2x2.csv
    
    export BLOCK_ROWS=4
    export BLOCK_COLS=4
    echo "Running $1 for BCSR 4x4"
    printf "" > csv/BCSR/BCSR_$1_4x4.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.mlir &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_4x4.csv
    
    export BLOCK_ROWS=16
    export BLOCK_COLS=16
    echo "Running $1 for BCSR 16x16"
    printf "" > csv/BCSR/BCSR_$1_16x16.csv
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.mlir &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR/BCSR_$1_16x16.csv
}

#export SPARSE_FILE_NAME0=../data/data/bcsstk17/bcsstk17.mtx
#run_benchmark "bcsstk17"

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

# TODO: Needed for 16x16
#export SPARSE_FILE_NAME0=../data/data/scircuit/scircuit_b.mtx
#run_benchmark "scircuit_b"

export SPARSE_FILE_NAME0=../data/data/com-LiveJournal/com-LiveJournal_Communities_top5000.mtx
run_benchmark "com-LiveJournal_Communities_top5000"

export SPARSE_FILE_NAME0=../data/data/com-LiveJournal/com-LiveJournal_nodeid.mtx
run_benchmark "com-LiveJournal_nodeid"

