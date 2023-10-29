#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "lib.h"

#define N 512

//
// Multiplication
//
void multiply(float *A, float *B, float *C, int rows, int cols) {
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            C[i*cols+j] = 0;
            for (int k = 0; k<cols; k++) {
                C[i*cols+j] += A[i*cols+k] * B[j*cols+k];
            }
        }
    }
}

void coo_multiply(COO *A, float *B, float *C, int rows, int cols) {
    for (int n = A->start; n<A->end; n++) {
        int i = A->rows[n];
        int j = A->cols[n];
        for (int k = 0; k<cols; k++) {
            C[i*cols+k] += A->values[n] * B[j*cols+k];
        }
    }
}

//
// Entry point
//
int main() {
    srand(time(NULL));
    
    COO *A1;
    float *A2 = malloc(sizeof(float)*N*N);
    float *B = malloc(sizeof(float)*N*N);
    float *C1 = malloc(sizeof(float)*N*N);      // Serial
    float *C2 = malloc(sizeof(float)*N*N);
    
    // Time variables
    clock_t begin, end;
    double serial_time_spent = 0;
    double sparse_time_spent = 0;
    
    // Fill the matrices
    A1 = create_coo(N, N);
    fill_zero(A2, N, N);
    copy_coo(A1, A2, N, N);
    fill_dense(B, N, N);
    fill_zero(C1, N, N);
    fill_zero(C2, N, N);
    
    //print_coo("A1", A1);
    //print_matrix("A2", A2, N, N);
    
    // Run
    begin = clock();
    multiply(A2, B, C1, N, N);
    end = clock();
    serial_time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    
    begin = clock();
    coo_multiply(A1, B, C2, N, N);
    end = clock();
    sparse_time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    
    //print_matrix("C1", C1, N, N);
    //print_matrix("C2", C2, N, N);
    
    int correct = check(C1, C2, N, N);
    printf("Correct: %d\n", correct);
    printf("Serial Time: %lf\n", serial_time_spent);
    printf("Sparse Time: %lf\n", sparse_time_spent);

    return 0;
}
