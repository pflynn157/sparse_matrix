#!/bin/bash

clang lib.c dense-dense.c -o dense-dense
clang lib.c coo.c -o coo
clang lib.c csr.c -o csr
clang lib.c ell.c -o ell

