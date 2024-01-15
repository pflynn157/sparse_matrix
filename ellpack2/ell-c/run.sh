#!/bin/bash

clang ell.c -o ell -march=native -O2
./ell 2> actual.txt
#diff actual.txt expected.txt
