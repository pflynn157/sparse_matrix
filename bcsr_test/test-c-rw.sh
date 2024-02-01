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

mkdir -p csv/test_c_rw

rm csv/test_c_rw/*

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
        $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir-c/$1.mlir &> /tmp/first.mlir
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
            $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir-c/$1.mlir &> /tmp/first.mlir
            #$LLVM_BASE/mlir-cpu-runner /tmp/first.mlir -O2 \
            #        -e main -entry-point-result=void \
            #        -shared-libs=$COMET_BASE/lib/libcomet_runner_utils.so \
            #          | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"$b"x"$b".csv
            $LLVM_BASE/mlir-translate --mlir-to-llvmir /tmp/first.mlir &> /tmp/first.ll
            $LLVM_BASE/clang mlir-c/lib.c -c -o /tmp/lib.o -march=native -O2 -ftree-vectorize

            $LLVM_BASE/clang /tmp/first.ll /tmp/lib.o -o exe -L$COMET_BASE/lib -lcomet_runner_utils -O2
            printf "" > csv/$2/$1_$3_"$b"x"$b".csv
            ./exe  | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"$b"x"$b".csv
            #./exe
        done
    fi
    
    echo ""
    echo ""
}

# 1024x? matrices
export SPARSE_FILE_NAME0=data/bcsstk17.mtx
run "csr_mv" "test_c_rw" "bcsstk17" 0
run "bcsr_mv" "test_c_rw" "bcsstk17" 1 4 40 150
run "csr_mm_bcsstk17" "test_c_rw" "bcsstk17" 0
run "bcsr_mm_bcsstk17" "test_c_rw" "bcsstk17" 1 4 40 150

export SPARSE_FILE_NAME0=data/cant.mtx
run "csr_mv" "test_c_rw" "cant" 0
run "bcsr_mv" "test_c_rw" "cant" 1 4 39 78
run "csr_mm_cant" "test_c_rw" "cant" 0
run "bcsr_mm_cant" "test_c_rw" "cant" 1 4 39 78

export SPARSE_FILE_NAME0=data/pdb1HYS.mtx
run "csr_mv" "test_c_rw" "pdb1HYS" 0
run "bcsr_mv" "test_c_rw" "pdb1HYS" 1 4 102 204
run "csr_mm_pdb1HYS" "test_c_rw" "pdb1HYS" 0
run "bcsr_mm_pdb1HYS" "test_c_rw" "pdb1HYS" 1 4 102 204

export SPARSE_FILE_NAME0=data/rma10.mtx
run "csr_mv" "test_c_rw" "rma10" 0
run "bcsr_mv" "test_c_rw" "rma10" 1 4 27 54
run "csr_mm_rma10" "test_c_rw" "rma10" 0
run "bcsr_mm_rma10" "test_c_rw" "rma10" 1 4 27 54


