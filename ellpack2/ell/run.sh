#!/bin/bash

clang++ test2.cpp -o test2 -march=native -O3 -fopenmp
./test2 2> actual.txt
diff actual.txt expected.txt
