#include <cstdio>

#include "ellpack.h"

Matrix *matrix_multiply(Matrix *A, Matrix *B) {
    Matrix *C = new Matrix(A->row, B->col, true);
    const int row1 = A->row;
    const int col1 = A->col;
    const int row2 = B->row;
    const int col2 = B->col;
    
    for (int i = 0; i<row1; i++) {
        for (int j = 0; j<col2; j++) {
            C->A[i*col2+j] = 0;
            for (int k = 0; k<col1; k++) {
                C->A[i*col2+j] += A->A[i*col1+k] * B->A[k*col2+j];
            }
        }
    }
	
    return C;
}

Matrix *sparse_multiply(Ellpack *A, Matrix *B) {
    Matrix *C = new Matrix(B->col, B->col, true);
    const int N = A->A1_pos;
    
    // LOOP 1: Dense
    for (int i1 = 0; i1<A->A1_pos; i1++) {
        // LOOP1.1: Dense (A1_tile)
        for (int i2 = 0; i2<A->A1_tile_pos; i2++) {
            int i = i1;
            
            // Singleton
            int n2 = i1*A->A1_tile_pos+i2;
            int j = A->A2_crd[n2];
            
            // Inner dense loop
            for (int k = 0; k<N; k++) {
                C->A[i*N+k] += A->Aval[n2] * B->A[j*N+k];
            }
        }
    }
    
    return C;
}

