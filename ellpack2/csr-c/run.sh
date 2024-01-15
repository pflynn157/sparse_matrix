#!/bin/bash

clang csr.c -o csr -march=native -O2
./csr 2> actual.txt
#diff actual.txt expected.txt
