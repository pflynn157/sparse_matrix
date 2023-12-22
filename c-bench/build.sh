#!/bin/bash

if [ ! -d ./build ]
then
    mkdir build
fi

clang lib.c dense-dense.c -o build/dense-dense
clang lib.c coo.c -o build/coo
clang lib.c csr.c -o build/csr
clang lib.c ell.c -o build/ell
clang lib.c bcsr1.c -o build/bcsr1

