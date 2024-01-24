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

mkdir -p csv/test2_mv
mkdir -p csv/test2_mm

rm csv/test2_mv/*
rm csv/test2_mm/*

if [ ! -d ./1024_gen ] ; then
    mkdir 1024_gen
fi

if [ ! -d ./512_gen ] ; then
    mkdir 512_gen
fi

rm 1024_gen/*
rm 512_gen/*

# Input: $1 = file
#        $2 = test_name
#        $3 = name suffix
function run() {
    echo $1
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir2/$1.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

    $LLVM_BASE/clang /tmp/first.ll -o exe -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
    printf "" > csv/$2/$1_$3_native_O2.csv
    ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_native_O2.csv
    
    echo ""
    echo ""
}

max=10

##
## 8- DONE
##
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 8
    mv 1024x8.mtx 1024x8_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x8_$i.mtx
    run "csr_mv" "test2_mv" "1024x8"
    run "ell_mv1" "test2_mv" "1024x8"
    run "ell_mv2" "test2_mv" "1024x8"
    run "csr_mm8" "test2_mm" "1024x8"
    run "ell1_mm8" "test2_mm" "1024x8"
    run "ell2_mm8" "test2_mm" "1024x8"
    
    cd 512_gen
    python3 ../gen.py 512 512 8
    mv 512x8.mtx 512x8_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=512_gen/512x8_$i.mtx
    run "csr_mv" "test2_mv" "512x8"
    run "ell_mv1" "test2_mv" "512x8"
    run "ell_mv2" "test2_mv" "512x8"
    run "csr_mm8" "test2_mm" "512x8"
    run "ell1_mm8" "test2_mm" "512x8"
    run "ell2_mm8" "test2_mm" "512x8"
done

##
## 16- Done
##
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 16
    mv 1024x16.mtx 1024x16_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x16_$i.mtx
    run "csr_mv" "test2_mv" "1024x16"
    run "ell_mv1" "test2_mv" "1024x16"
    run "ell_mv2" "test2_mv" "1024x16"
    run "csr_mm16" "test2_mm" "1024x16"
    run "ell1_mm16" "test2_mm" "1024x16"
    run "ell2_mm16" "test2_mm" "1024x16"
    
    cd 512_gen
    python3 ../gen.py 512 512 16
    mv 512x16.mtx 512x16_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=512_gen/512x16_$i.mtx
    run "csr_mv" "test2_mv" "512x16"
    run "ell_mv1" "test2_mv" "512x16"
    run "ell_mv2" "test2_mv" "512x16"
    run "csr_mm16" "test2_mm" "512x16"
    run "ell1_mm16" "test2_mm" "512x16"
    run "ell2_mm16" "test2_mm" "512x16"
done

##
## 32- Done
##
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 32
    mv 1024x32.mtx 1024x32_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x32_$i.mtx
    run "csr_mv" "test2_mv" "1024x32"
    run "ell_mv1" "test2_mv" "1024x32"
    run "ell_mv2" "test2_mv" "1024x32"
    run "csr_mm32" "test2_mm" "1024x32"
    run "ell1_mm32" "test2_mm" "1024x32"
    run "ell2_mm32" "test2_mm" "1024x32"
    
    cd 512_gen
    python3 ../gen.py 512 512 32
    mv 512x32.mtx 512x32_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=512_gen/512x32_$i.mtx
    run "csr_mv" "test2_mv" "512x32"
    run "ell_mv1" "test2_mv" "512x32"
    run "ell_mv2" "test2_mv" "512x32"
    run "csr_mm32" "test2_mm" "512x32"
    run "ell1_mm32" "test2_mm" "512x32"
    run "ell2_mm32" "test2_mm" "512x32"
done

##
## 1024x512- Done
##
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 512
    mv 1024x512.mtx 1024x512_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x512_$i.mtx
    run "csr_mv" "test2_mv" "1024x512"
    run "ell_mv1" "test2_mv" "1024x512"
    run "ell_mv2" "test2_mv" "1024x512"
    run "csr_mm512" "test2_mm" "1024x512"
    run "ell1_mm512" "test2_mm" "1024x512"
    run "ell2_mm512" "test2_mm" "1024x512"
done

##
## 512x128- DONE
##
for i in $(seq $max)
do
    cd 512_gen
    python3 ../gen.py 512 512 128
    mv 512x128.mtx 512x128_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=512_gen/512x128_$i.mtx
    run "csr_mv" "test2_mv" "512x128"
    run "ell_mv1" "test2_mv" "512x128"
    run "ell_mv2" "test2_mv" "512x128"
    run "csr_mm128" "test2_mm" "512x128"
    run "ell1_mm128" "test2_mm" "512x128"
    run "ell2_mm128" "test2_mm" "512x128"
done

##
## 512x512- DONE
##
for i in $(seq $max)
do
    cd 512_gen
    python3 ../gen.py 512 512 512
    mv 512x512.mtx 512x512_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=512_gen/512x512_$i.mtx
    run "csr_mv" "test2_mv" "512x512"
    run "ell_mv1" "test2_mv" "512x512"
    run "ell_mv2" "test2_mv" "512x512"
    run "csr_mm512" "test2_mm" "512x512"
    run "ell1_mm512" "test2_mm" "512x512"
    run "ell2_mm512" "test2_mm" "512x512"
done

##
## 1024x1024- Done
##
for i in $(seq $max)
do
    cd 1024_gen
    python3 ../gen.py 1024 1024 1024
    mv 1024x1024.mtx 1024x1024_$i.mtx
    cd ..
    export SPARSE_FILE_NAME0=1024_gen/1024x1024_$i.mtx
    run "csr_mv" "test2_mv" "1024x1024"
    run "ell_mv1" "test2_mv" "1024x1024"
    run "ell_mv2" "test2_mv" "1024x1024"
    run "csr_mm1024" "test2_mm" "1024x1024"
    run "ell1_mm1024" "test2_mm" "1024x1024"
    run "ell2_mm1024" "test2_mm" "1024x1024"
done

