#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>

//@ell_test1(i64, i64, !llvm.ptr<i8>,   //columnPtr
//                i64, !llvm.ptr<i8>,   // columnIdx
//                i64, !llvm.ptr<i8>,   // values
//                i64, !llvm.ptr<i8>,   // B
//                i64, !llvm.ptr<i8>)   // C
void ell_test1(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    for (uint64_t n1 = 0; n1<cols; n1++) {
        for (uint64_t i = 0; i<rows; i++) {
            C[i] += values[n1 * rows + i] * B[columnIdxs[n1 * rows + i]];
        }
    }
}

// Vectorization test
void ell_test2(int64_t rows, int64_t cols,
                int64_t columnIdxs_len, void **_columnIdxs,
                int64_t values_len, void **_values,
                int64_t B_len, void **_B,
                int64_t C_len, void **_C) {
    int64_t *columnIdxs = _columnIdxs[0];
    double *values = _values[0];
    double *B = _B[1];
    double *C = _C[1];
    
    //__mmask8 __mask = _mm512_int2mask(0xFF);
    __m256d buf0 = _mm256_setzero_pd();
    
    for (uint64_t n1 = 0; n1<cols; n1++) {
        for (uint64_t i = 0; i<rows; i+=8) {
            //results2[i] += values[n1 * rows + i] * vector[columnIdxs[n1 * rows + i]];
            
            __m256i __vindex0 = _mm256_loadu_si256((__m256i *)(&columnIdxs[n1 * rows + i]));
            __m256d vec_vector = _mm256_i64gather_pd(B, __vindex0, /*B,*/ 8);
            //__m512d vec_vector = _mm512_mask_i64gather_pd(buf0, __mask, __vindex0, B, 8);
            
            __m256d vec1 = _mm256_loadu_pd(&C[i]);
            __m256d vec_values = _mm256_loadu_pd(&values[n1 * rows + i]);
            
            __m256d vec2 = _mm256_mul_pd(vec_values, vec_vector);
            __m256d vec3 = _mm256_add_pd(vec1, vec2);
            
            _mm256_storeu_pd(&C[i], vec3);
        }
    }
}

