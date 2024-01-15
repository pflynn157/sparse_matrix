#!/bin/bash

clang++ csr.cpp -o csr -march=native -O3 -fopenmp
./csr 2> actual.txt
diff actual.txt expected.txt
