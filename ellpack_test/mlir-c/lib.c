#include <stdio.h>
#include <stdint.h>

extern double getTime();
extern void printElapsedTime(double t1, double t2);

//@ell_test1(i64, i64, !llvm.ptr<i8>,   //columnPtr
//                i64, !llvm.ptr<i8>,   // columnIdx
//                i64, !llvm.ptr<i8>,   // values
//                i64, !llvm.ptr<i8>,   // B
//                i64, !llvm.ptr<i8>)   // C
void ell_mv_test1(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        for (uint64_t i = 0; i<rows; i++) {
            for (uint64_t n1 = 0; n1<cols; n1++) {
                C[i] += values[n1 * rows + i] * B[columnIdxs[n1 * rows + i]];
            }
        }
        double end = getTime();
        printElapsedTime(start, end);
    }
}

//
// With the loops switched
//
void ell_mv_test2(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        for (uint64_t n1 = 0; n1<cols; n1++) {
            for (uint64_t i = 0; i<rows; i++) {
                C[i] += values[n1 * rows + i] * B[columnIdxs[n1 * rows + i]];
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
void ell_mm_test1(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C,
                int64_t k_len) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        for (uint64_t i = 0; i<rows; i++) {
            for (uint64_t n1 = 0; n1<cols; n1++) {
                for (uint64_t k = 0; k<k_len; k++) {
                    C[i*cols+k] += values[n1 * rows + i] * B[i*cols+columnIdxs[n1 * rows + i]];
                }
            }
        }
        double end = getTime();
        printElapsedTime(start, end);
    }
}

//
// Matrix-matrix multiplication
// Reversed loops
//
void ell_mm_test2(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C,
                int64_t k_len) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int ttt = 0; ttt<10; ttt++) {
        double start = getTime();
        for (uint64_t n1 = 0; n1<cols; n1++) {
            for (uint64_t i = 0; i<rows; i++) {
                for (uint64_t k = 0; k<k_len; k++) {
                    C[i*cols+k] += values[n1 * rows + i] * B[i*cols+columnIdxs[n1 * rows + i]];
                }
            }
        }
        double end = getTime();
        printElapsedTime(start, end);
    }
}

