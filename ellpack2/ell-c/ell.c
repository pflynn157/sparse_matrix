// run:
// gcc test2.cpp -o test2 -march=native -O3 -fopenmp && ./test2 2> actual.txt && diff actual.txt expected.txt
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <immintrin.h>

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
    uint64_t cols = 32;
    uint64_t v_columnIdxs[] = {
        #include "cols.txt"
    };
    double v_values[] = {
        #include "vals.txt"
    };
    
    size_t columnIdxs_size = sizeof(v_columnIdxs) / sizeof(uint64_t);
    size_t vals_size = sizeof(v_values) / sizeof(double);
    
    uint64_t *columnIdxs = malloc(sizeof(uint64_t)*columnIdxs_size);
    double *values = malloc(sizeof(double)*vals_size);
    
    double *vector = malloc(sizeof(double)*rows);
    double *results1 = malloc(sizeof(double)*rows);
    double *results2 = malloc(sizeof(double)*rows);
    double *results3 = malloc(sizeof(double)*rows);
    for (size_t i = 0; i<rows; i++) {
        vector[i] = 1.7;
        results1[i] = 0;
        results2[i] = 0;
        results3[i] = 0;
    }
    
    for (size_t i = 0; i<columnIdxs_size; i++) columnIdxs[i] = v_columnIdxs[i];
    for (size_t i = 0; i<vals_size; i++) values[i] = v_values[i];

    // Measure time (algorithm 1)
    double stime = getTime();
    for (uint64_t n1 = 0; n1<cols; n1++) {
        for (uint64_t i = 0; i<rows; i++) {
            results1[i] += values[n1 * rows + i] * vector[columnIdxs[n1 * rows + i]];
        }
    }
    double etime = getTime();
    printf("Serial: ");
    printElapsedTime(stime, etime);
    
    // Algorithm 2
    stime = getTime();
    //__mmask16 __mask2 = _mm512_kmov(0xFFFF);
    __mmask8 __mask = _mm512_int2mask(0xFF);
    __m512d buf0 = _mm512_setzero_pd();
    
    for (uint64_t n1 = 0; n1<cols; n1++) {
        for (uint64_t i = 0; i<rows; i+=8) {
            //results2[i] += values[n1 * rows + i] * vector[columnIdxs[n1 * rows + i]];
            
            __m512i __vindex0 = _mm512_loadu_si512((__m512i *)(&columnIdxs[n1 * rows + i]));
            //__m512d vec_vector = _mm512_i64gather_pd(__vindex0, vector, 8);
            __m512d vec_vector = _mm512_mask_i64gather_pd(buf0, __mask, __vindex0, vector, 8);
            
            __m512d vec1 = _mm512_loadu_pd(&results2[i]);
            __m512d vec_values = _mm512_loadu_pd(&values[n1 * rows + i]);
            
            __m512d vec2 = _mm512_mul_pd(vec_values, vec_vector);
            __m512d vec3 = _mm512_add_pd(vec1, vec2);
            
            _mm512_storeu_pd(&results2[i], vec3);
        }
    }
    etime = getTime();
    printf("Vector: ");
    printElapsedTime(stime, etime);
    
    // Algorithm 3
    stime = getTime();
    for (uint64_t n1 = 0; n1<cols; n1++) {
        #pragma omp simd
        for (uint64_t i = 0; i<rows; i++) {
            results3[i] += values[n1 * rows + i] * vector[columnIdxs[n1 * rows + i]];
        }
    }
    etime = getTime();
    printf("OpenMP: ");
    printElapsedTime(stime, etime);
    
    puts("========================");
    
    // Results 1
    for (size_t i = 0; i<30; i+=3) fprintf(stderr, "%.0lf,", results1[i]);
    fprintf(stderr, "\n");
    
    puts("------------------------");
    
    // Results 2
    for (size_t i = 0; i<30; i+=3) fprintf(stderr, "%.0lf,", results2[i]);
    fprintf(stderr, "\n");
    
    puts("------------------------");
    
    // Results 3
    for (size_t i = 0; i<30; i+=3) fprintf(stderr, "%.0lf,", results3[i]);
    fprintf(stderr, "\n");
    
    return 0;
}

