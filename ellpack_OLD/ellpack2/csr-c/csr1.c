// run:
// gcc test2.cpp -o test2 -march=native -O3 -fopenmp && ./test2 2> actual.txt && diff actual.txt expected.txt
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>

double getTime()
{
  struct timeval tp;
  int stat = gettimeofday(&tp, NULL);
  return (tp.tv_sec + tp.tv_usec * 1.0e-6);
}

void printElapsedTime(double stime, double etime)
{
  fprintf(stdout, "ELAPSED_TIME = %lf\n", etime - stime);
}

int main(int argc, char **argv) {
    uint64_t rows = 512;
    uint64_t v_columnPtr[] = {
        #include "colptr.txt"
    };
    uint64_t v_columnIdxs[] = {
        #include "colidx.txt"
    };
    double v_values[] = {
        #include "vals.txt"
    };
    
    size_t columnPtr_size = sizeof(v_columnPtr) / sizeof(uint64_t);
    size_t columnIdxs_size = sizeof(v_columnIdxs) / sizeof(uint64_t);
    size_t vals_size = sizeof(v_values) / sizeof(double);
    
    uint64_t *columnPtr = malloc(sizeof(uint64_t)*columnPtr_size);
    uint64_t *columnIdxs = malloc(sizeof(uint64_t)*columnIdxs_size);
    double *values = malloc(sizeof(double)*vals_size);
    
    double *vector = malloc(sizeof(double)*rows);
    double *results = malloc(sizeof(double)*rows);
    for (size_t i = 0; i<rows; i++) {
        vector[i] = 1.7;
        results[i] = 0;
    }
    
    for (size_t i = 0; i<columnPtr_size; i++) columnPtr[i] = v_columnPtr[i];
    for (size_t i = 0; i<columnIdxs_size; i++) columnIdxs[i] = v_columnIdxs[i];
    for (size_t i = 0; i<vals_size; i++) values[i] = v_values[i];

    // Measure time
    double stime = getTime();
    for (uint64_t i = 0; i<rows; i++) {
        for (uint64_t p = columnPtr[i]; p<columnPtr[i+1]; p++) {
            uint64_t j = columnIdxs[p];
            results[i] += values[p] * vector[j];
        }
    } 
    double etime = getTime();
    printElapsedTime(stime, etime);
    
    for (size_t i = 0; i<rows; i++) fprintf(stderr, "%.1f,", results[i]);
    fprintf(stderr, "\n");
    
    return 0;
}

