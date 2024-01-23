#!/bin/bash
#####################################3
# Testing
# Work PC
export LD_LIBRARY_PATH="/home/pflynn5/PNNL/COMET/install/lib:/home/pflynn5/PNNL/COMET/build/lib"
export COMET_BASE="/home/pflynn5/PNNL/COMET/build"
export LLVM_BASE="/home/pflynn5/PNNL/COMET/llvm/build/bin"

# Carina
#export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib"
#export COMET_BASE="/home/pflynn5/COMET/build"
#export LLVM_BASE="/home/pflynn5/COMET/llvm/build/bin"

# PC
#export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/build/lib:/home/patrick/Work/PNNL/COMET/install/lib"
#export COMET_BASE="/home/patrick/Work/PNNL/COMET/build"
#export LLVM_BASE="/home/patrick/Work/PNNL/COMET/llvm/build/bin"

if [ ! -d ./csv ] ; then
    mkdir csv
fi

mkdir -p csv/test2_mv
mkdir -p csv/test2_mm

rm csv/test2_mv/*
rm csv/test2_mm/*

if [ ! -d ./1024_gen ] ; then
    mkdir 1024_gen
fi

rm 1024_gen/*

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
function run() {
    echo $1
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir2/$1.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

    $LLVM_BASE/clang /tmp/first.ll -o exe -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
    #printf "" > csv/$2/$1_$3_native_O2.csv
    ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_native_O2.csv
    
    echo ""
    echo ""
}

max=10

# 1024x? matrices
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 8
    mv 1024x8.mtx 1024x8_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x8_$i.mtx
    run "csr_mv" "test2_mv" "1024x8"
    run "ell_mv" "test2_mv" "1024x8"
    run "csr_mm8" "test2_mm" "1024x8"
    run "ell_mm8" "test2_mm" "1024x8"
done

for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 16
    mv 1024x16.mtx 1024x16_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x16_$i.mtx
    run "csr_mv" "test2_mv" "1024x16"
    run "ell_mv" "test2_mv" "1024x16"
    run "csr_mm16" "test2_mm" "1024x16"
    run "ell_mm16" "test2_mm" "1024x16"
done

for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 32
    mv 1024x32.mtx 1024x32_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x32_$i.mtx
    run "csr_mv" "test2_mv" "1024x32"
    run "ell_mv" "test2_mv" "1024x32"
    run "csr_mm32" "test2_mm" "1024x32"
    run "ell_mm32" "test2_mm" "1024x32"
done

for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 512
    mv 1024x512.mtx 1024x512_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x512_$i.mtx
    run "csr_mv" "test2_mv" "1024x512"
    run "ell_mv" "test2_mv" "1024x512"
    run "csr_mm512" "test2_mm" "1024x512"
    run "ell_mm512" "test2_mm" "1024x512"
done

for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 1024
    mv 1024x1024.mtx 1024x1024_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x1024_$i.mtx
    run "csr_mv" "test2_mv" "1024x1024"
    run "ell_mv" "test2_mv" "1024x1024"
    run "csr_mm1024" "test2_mm" "1024x1024"
    run "ell_mm1024" "test2_mm" "1024x1024"
done

