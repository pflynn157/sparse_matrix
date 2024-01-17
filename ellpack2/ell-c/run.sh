#!/bin/bash

clang ell.c -o ell -march=native -O2 -DSQUARE
./ell #2> actual.txt
#diff actual.txt expected.txt

clang ell.c -o ell -march=native -O2 -DBCSSTK17
./ell

