#include <stdio.h>
#include <stdint.h>

//@csr_test1(i64, i64, !llvm.ptr<i8>,   //columnPtr
//                i64, !llvm.ptr<i8>,   // columnIdx
//                i64, !llvm.ptr<i8>,   // values
//                i64, !llvm.ptr<i8>,   // B
//                i64, !llvm.ptr<i8>)   // C
void csr_test1(int64_t rows, int64_t columnPtr_len, void **_columnPtr,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *columnPtr = _columnPtr[0];
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (int64_t i = 0; i<rows; i++) {
        for (int64_t p = columnPtr[i]; p<columnPtr[i+1]; p++) {
            int64_t j = columnIdxs[p];
            C[i] += values[p] * B[j];
        }
    }
}

