#!/bin/bash

clang lib.c dense-dense.c -o dense-dense
clang lib.c coo.c -o coo
clang lib.c csr.c -o csr
clang lib.c ell.c -o ell
clang lib.c bcsr1.c -o bcsr1
clang lib.c bcsr2.c -o bcsr2 -g

