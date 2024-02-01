#!/bin/bash
#####################################3
# Testing
# Work PC
#export LD_LIBRARY_PATH="/home/pflynn5/PNNL/COMET/install/lib:/home/pflynn5/PNNL/COMET/build/lib:/home/pflynn5/PNNL/COMET/llvm/build/lib"
#export COMET_BASE="/home/pflynn5/PNNL/COMET/build"
#export LLVM_BASE="/home/pflynn5/PNNL/COMET/llvm/build/bin"
#export LLVM_LIB="/home/pflynn5/PNNL/COMET/llvm/build/lib"

# Carina
export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib:/home/pflynn5/COMET/llvm/build/lib"
export COMET_BASE="/home/pflynn5/COMET/build"
export LLVM_BASE="/home/pflynn5/COMET/llvm/build/bin"
export LLVM_LIB="/home/pflynn5/COMET/llvm/build/lib"

# PC
#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/build/lib:/home/patrick/Work/PNNL/COMET/install/lib"
#export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

if [ ! -d ./csv ] ; then
    mkdir csv
fi

mkdir -p csv/test_omp

rm csv/test_omp/*

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
#
#        $4 = block size 1
#        $5 = block size 2
#        $6 = block size 3
#        $7 = block size 4
function run() {
    echo $1
    
    if [[ $4 == "0" ]]
    then
        printf "" > csv/$2/$1_$3_"csr".csv
        $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir-c-omp/$1.mlir &> /tmp/first.mlir
        $LLVM_BASE/mlir-cpu-runner /tmp/first.mlir -O2 \
                -e main -entry-point-result=void \
                -shared-libs=$COMET_BASE/lib/libcomet_runner_utils.so \
                  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"csr".csv
    else
        blocks=("$4" "$5" "$6" "$7")
        
        for b in ${blocks[@]}; do
            echo "Block: $b"
            export BLOCK_ROWS="$b"
            export BLOCK_COLS="$b"
        
            #printf "" > csv/$2/$1_$3_$4x$4.csv
            $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir-c-omp/$1.mlir &> /tmp/first.mlir
            #$LLVM_BASE/mlir-cpu-runner /tmp/first.mlir -O2 \
            #        -e main -entry-point-result=void \
            #        -shared-libs=$COMET_BASE/lib/libcomet_runner_utils.so \
            #          | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"$b"x"$b".csv
            $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll
            $LLVM_BASE/clang mlir-c-omp/lib.c -c -o /tmp/lib.o -march=native -O2 -ftree-vectorize -fopenmp

            $LLVM_BASE/clang /tmp/first.ll /tmp/lib.o -o exe -L$COMET_BASE/lib -lcomet_runner_utils -O2 \
                -L$LLVM_LIB -lomp
            printf "" > csv/$2/$1_$3_"$b"x"$b".csv
            ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"$b"x"$b".csv
            #./exe
        done
    fi
    
    echo ""
    echo ""
}

export OMP_NUM_THREADS=8

# 1024x? matrices
export SPARSE_FILE_NAME0=1024/1024x8.mtx
run "bcsr_mv" "test_omp" "1024x8" 1 2 4 8
run "bcsr_mm8" "test_omp" "1024x8" 1 2 4 8

export SPARSE_FILE_NAME0=1024/1024x16.mtx
run "bcsr_mv" "test_omp" "1024x16" 1 4 8 16
run "bcsr_mm16" "test_omp" "1024x16" 1 4 8 16

export SPARSE_FILE_NAME0=1024/1024x32.mtx
run "bcsr_mv" "test_omp" "1024x32" 1 8 16 32
run "bcsr_mm32" "test_omp" "1024x32" 1 8 16 32

export SPARSE_FILE_NAME0=1024/1024x512.mtx
run "bcsr_mv" "test_omp" "1024x512" 1 128 256 512
run "bcsr_mm512" "test_omp" "1024x512" 1 128 256 512

export SPARSE_FILE_NAME0=1024/1024x1024.mtx
run "bcsr_mv" "test_omp" "1024x1024" 1 256 512 1024
run "bcsr_mm1024" "test_omp" "1024x1024" 1 256 512 1024

# 512x? matrices
export SPARSE_FILE_NAME0=512/512x8.mtx
run "bcsr_mv" "test_omp" "512x8" 1 2 4 8
run "bcsr_mm8" "test_omp" "512x8" 1 2 4 8

export SPARSE_FILE_NAME0=512/512x16.mtx
run "bcsr_mv" "test_omp" "512x16" 1 4 8 16
run "bcsr_mm16" "test_omp" "512x16" 1 4 8 16

export SPARSE_FILE_NAME0=512/512x32.mtx
run "bcsr_mv" "test_omp" "512x32" 1 8 16 32
run "bcsr_mm32" "test_omp" "512x32" 1 8 16 32

export SPARSE_FILE_NAME0=512/512x128.mtx
run "bcsr_mv" "test_omp" "512x128" 1 32 64 128
run "bcsr_mm128" "test_omp" "512x128" 1 32 64 128

export SPARSE_FILE_NAME0=512/512x512.mtx
run "bcsr_mv" "test_omp" "512x512" 1 128 256 512
run "bcsr_mm512" "test_omp" "512x512" 1 128 256 512

