#include <stdio.h>
#include <stdint.h>

extern double getTime();
extern void printElapsedTime(double t1, double t2);

//@ell_test1(i64, i64, !llvm.ptr<i8>,   //columnPtr
//                i64, !llvm.ptr<i8>,   // columnIdx
//                i64, !llvm.ptr<i8>,   // values
//                i64, !llvm.ptr<i8>,   // B
//                i64, !llvm.ptr<i8>)   // C
void bcsr_mv_test(int64_t dense, int64_t rows, int64_t cols,
                int64_t idxptr_len, void **_idxptr,
                int64_t idx_len, void **_idx,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *idxptr = _idxptr[0];
    int64_t *idx = _idx[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        
        int64_t n2, bj;
        #pragma omp parallel
        for (int64_t n1 = 0; n1<dense; n1++) {
            for (int64_t bi = 0; bi<rows; bi++) {
                #pragma omp parallel for private(n2, bj)
                for (n2 = idxptr[n1]; n2<idxptr[n1+1]; n2++) {
                    for (bj = 0; bj<cols; bj++) {
                        int64_t i = n1 * rows + bi;
                        int64_t j = idx[n2] * cols + bj;
                        int64_t index = n2*(rows*cols) + bi * cols + bj;
                        
                        #pragma omp atomic
                        C[i] += values[index] * B[j];
                    }
                }
            }
        }
        
        double end = getTime();
        printElapsedTime(start, end);
    }
}

//-------------------------------------------------------------------------------

//
// Matrix-matrix multiplication
//
void bcsr_mm_test(int64_t dense, int64_t rows, int64_t cols,
                int64_t idxptr_len, void **_idxptr,
                int64_t idx_len, void **_idx,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C,
                int64_t k_len) {
    int64_t *idxptr = _idxptr[0];
    int64_t *idx = _idx[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        
        int64_t n2, bj, k;
        for (int64_t n1 = 0; n1<dense; n1++) {
            for (int64_t bi = 0; bi<rows; bi++) {
                for (n2 = idxptr[n1]; n2<idxptr[n1+1]; n2++) {
                    #pragma omp parallel for
                    for (bj = 0; bj<cols; bj++) {
                        for (k = 0; k<k_len; k++) {
                            int64_t i = n1 * rows + bi;
                            int64_t j = idx[n2] * cols + bj;
                            int64_t index = n2*(rows*cols) + bi * cols + bj;
                            
                            #pragma omp atomic
                            C[i*cols+k] += values[index] * B[i*cols+j];
                        }
                    }
                }
            }
        }
        
        double end = getTime();
        printElapsedTime(start, end);
    }
}

