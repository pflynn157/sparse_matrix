#!/bin/bash

export LD_LIBRARY_PATH="/home/patrick/Work/PNNL/COMET/build/lib:/home/patrick/Work/PNNL/COMET/install/lib"
export SPARSE_FILE_NAME0="/home/patrick/Work/PNNL/COMET/square.mtx"

clang ell1.c -o ell1 -O2 -march=native \
    -I/home/patrick/Work/PNNL/COMET/include/comet/ExecutionEngine \
    -L/home/patrick/Work/PNNL/COMET/build/lib -lcomet_runner_utils \
    -L/home/patrick/Work/PNNL/COMET/install/lib \
    -lm

./ell1

