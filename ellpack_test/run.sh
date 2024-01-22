#!/bin/bash
#####################################3
# Testing
export LD_LIBRARY_PATH="/home/pflynn5/PNNL/COMET/install/lib:/home/pflynn5/PNNL/COMET/build/lib"
export COMET_BASE="/home/pflynn5/PNNL/COMET/build"
export LLVM_BASE="/home/pflynn5/PNNL/COMET/llvm/build/bin"

#export LD_LIBRARY_PATH="/home/pflynn5/COMET/build/lib:/home/pflynn5/COMET/install/lib"
#export COMET_BASE="/home/pflynn5/COMET/build"
#export LLVM_BASE="/home/pflynn5/COMET/llvm/build/bin"

if [ ! -d ./csv ] ; then
    mkdir csv
fi

function run() {
    INPUT_FILE=$1
    INPUT_NAME=$2
    
    $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir/$INPUT_FILE.mlir &> /tmp/first.mlir
    $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll

    $LLVM_BASE/clang /tmp/first.ll -o ell -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O2 -ftree-vectorize
    echo "" > csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_native_O2.csv
    ./ell  | grep -oP '\d+\.\d+' >> csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_native_O2.csv
    
    $LLVM_BASE/clang /tmp/first.ll -o ell -L$COMET_BASE/lib -lcomet_runner_utils -march=native -O3 -ftree-vectorize
    echo "" > csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_native_O3.csv
    ./ell  | grep -oP '\d+\.\d+' >> csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_native_O3.csv
    
    $LLVM_BASE/clang /tmp/first.ll -o ell -L$COMET_BASE/lib -lcomet_runner_utils -march=knl -O2 -ftree-vectorize
    echo "" > csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_knl_O2.csv
    ./ell  | grep -oP '\d+\.\d+' >> csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_knl_O2.csv
    
    $LLVM_BASE/clang /tmp/first.ll -o ell -L$COMET_BASE/lib -lcomet_runner_utils -march=knl -O3 -ftree-vectorize
    echo "" > csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_knl_O3.csv
    ./ell  | grep -oP '\d+\.\d+' >> csv/ELL_"$INPUT_FILE"_"$INPUT_NAME"_knl_O3.csv
}

##
## 512
##
export SPARSE_FILE_NAME0=512/512x8.mtx
run "mv1" "512x8"
run "mv2r" "512x8"
run "mm1" "512x8"
run "mm2r" "512x8"

export SPARSE_FILE_NAME0=512/512x16.mtx
run "mv1" "512x16"
run "mv2r" "512x16"
run "mm1" "512x16"
run "mm2r" "512x16"

export SPARSE_FILE_NAME0=512/512x32.mtx
run "mv1" "512x32"
run "mv2r" "512x32"
run "mm1" "512x32"
run "mm2r" "512x32"

export SPARSE_FILE_NAME0=512/512x64.mtx
run "mv1" "512x64"
run "mv2r" "512x64"
run "mm1" "512x64"
run "mm2r" "512x64"

export SPARSE_FILE_NAME0=512/512x128.mtx
run "mv1" "512x128"
run "mv2r" "512x128"
run "mm1" "512x128"
run "mm2r" "512x128"

export SPARSE_FILE_NAME0=512/512x256.mtx
run "mv1" "512x256"
run "mv2r" "512x256"
run "mm1" "512x256"
run "mm2r" "512x256"

export SPARSE_FILE_NAME0=512/512x512.mtx
run "mv1" "512x512"
run "mv2r" "512x512"
run "mm1" "512x512"
run "mm2r" "512x512"

##
## 1024
##
export SPARSE_FILE_NAME0=1024/1024x8.mtx
run "mv1" "1024x8"
run "mv2r" "1024x8"
run "mm1" "1024x8"
run "mm2r" "1024x8"

export SPARSE_FILE_NAME0=1024/1024x16.mtx
run "mv1" "1024x16"
run "mv2r" "1024x16"
run "mm1" "1024x16"
run "mm2r" "1024x16"

export SPARSE_FILE_NAME0=1024/1024x32.mtx
run "mv1" "1024x32"
run "mv2r" "1024x32"
run "mm1" "1024x32"
run "mm2r" "1024x32"

export SPARSE_FILE_NAME0=1024/1024x64.mtx
run "mv1" "1024x64"
run "mv2r" "1024x64"
run "mm1" "1024x64"
run "mm2r" "1024x64"

export SPARSE_FILE_NAME0=1024/1024x128.mtx
run "mv1" "1024x128"
run "mv2r" "1024x128"
run "mm1" "1024x128"
run "mm2r" "1024x128"

export SPARSE_FILE_NAME0=1024/1024x256.mtx
run "mv1" "512x256"
run "mv2r" "512x256"
run "mm1" "512x256"
run "mm2r" "512x256"

export SPARSE_FILE_NAME0=1024/1024x512.mtx
run "mv1" "1024x512"
run "mv2r" "1024x512"
run "mm1" "1024x512"
run "mm2r" "1024x512"

export SPARSE_FILE_NAME0=1024/1024x1024.mtx
run "mv1" "1024x1024"
run "mv2r" "1024x1024"
run "mm1" "1024x1024"
run "mm2r" "1024x1024"


