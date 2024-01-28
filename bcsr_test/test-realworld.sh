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

rm csv/bcsstk17/*
rm csv/cant/*
rm csv/pdb1HYS/*
rm csv/rma10/*

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
        $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir/$1.mlir &> /tmp/first.mlir
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
            $COMET_BASE/bin/comet-opt --convert-ta-to-it --convert-to-loops --convert-to-llvm mlir/$1.mlir &> /tmp/first.mlir
            $LLVM_BASE/mlir-cpu-runner /tmp/first.mlir -O2 \
                    -e main -entry-point-result=void \
                    -shared-libs=$COMET_BASE/lib/libcomet_runner_utils.so \
                      | grep -oP '\d+\.\d+' >> csv/$2/$1_$3_"$b"x"$b".csv
        done
    fi
    
    echo ""
    echo ""
}

# 1024x? matrices
export SPARSE_FILE_NAME0=data/bcsstk17.mtx
run "csr_mv" "bcsstk17" "bcsstk17" 0
run "bcsr_mv" "bcsstk17" "bcsstk17" 1 6 5487 10974
run "csr_mm_bcsstk17" "bcsstk17" "bcsstk17" 0
run "bcsr_mm_bcsstk17" "bcsstk17" "bcsstk17" 1 6 5487 10974

export SPARSE_FILE_NAME0=data/cant.mtx
run "csr_mv" "cant" "cant" 0
run "bcsr_mv" "cant" "cant" 1 9 20817 62451
run "csr_mm_cant" "cant" "cant" 0
run "bcsr_mm_cant" "cant" "cant" 1 9 20817 62451

export SPARSE_FILE_NAME0=data/pdb1HYS.mtx
run "csr_mv" "pdb1HYS" "pdb1HYS" 0
run "bcsr_mv" "pdb1HYS" "pdb1HYS" 1 61 12139 36417
run "csr_mm_pdb1HYS" "pdb1HYS" "pdb1HYS" 0
run "bcsr_mm_pdb1HYS" "pdb1HYS" "pdb1HYS" 1 61 12139 36417

export SPARSE_FILE_NAME0=data/rma10.mtx
run "csr_mv" "rma10" "rma10" 0
run "bcsr_mv" "rma10" "rma10" 1 29 2465 46835
run "csr_mm_rma10" "rma10" "rma10" 0
run "bcsr_mm_rma10" "rma10" "rma10" 1 29 2465 46835

