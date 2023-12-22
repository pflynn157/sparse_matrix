#!/bin/bash

if [ ! -d build ]
then
    mkdir build
fi

if [ ! -d csv ]
then
    mkdir csv
fi

export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/install/lib"
export COMET_PATH="/home/patrick/Work/PNNL/COMET/build"
export LLVM_PATH="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

number_iters=5

##
## CSR
##
export SPARSE_FILE_NAME0=../data/test_bench512.mtx
printf "" > csv/CSR_512.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm csr_mv.ta &> build/csr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/csr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/CSR_512.csv
done

export SPARSE_FILE_NAME0=../data/test_bench1024.mtx
printf "" > csv/CSR_1024.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm csr_mv.ta &> build/csr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/csr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/CSR_1024.csv
done

##
## COO
##
export SPARSE_FILE_NAME0=../data/test_bench512.mtx
printf "" > csv/COO_512.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm coo_mv.ta &> build/coo_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/coo_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/COO_512.csv
done

export SPARSE_FILE_NAME0=../data/test_bench1024.mtx
printf "" > csv/COO_1024.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm coo_mv.ta &> build/coo_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/coo_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/COO_1024.csv
done

##
## ELL
##
export SPARSE_FILE_NAME0=../data/test_bench512.mtx
printf "" > csv/ELL_512.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm ell_mv.ta &> build/ell_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/ell_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/ELL_512.csv
done

export SPARSE_FILE_NAME0=../data/test_bench1024.mtx
printf "" > csv/ELL_1024.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm ell_mv.ta &> build/ell_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/ell_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/ELL_1024.csv
done

##
## BCSR
##
export SPARSE_FILE_NAME0=../data/test_bench512.mtx
printf "" > csv/BCSR_512.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.ta &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR_512.csv
done

export SPARSE_FILE_NAME0=../data/test_bench1024.mtx
printf "" > csv/BCSR_1024.csv
for _ in $(seq $number_iters)
do
    $COMET_PATH/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm bcsr_mv.ta &> build/bcsr_mv.mlir
    $LLVM_PATH/mlir-cpu-runner build/bcsr_mv.mlir -O3 -e main -entry-point-result=void \
        -shared-libs=$COMET_PATH/lib/libcomet_runner_utils.so | grep -oP '\d+\.\d+' >> csv/BCSR_1024.csv
done

