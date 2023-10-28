#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 512

// Forward declarations
void fill_dense(float *matrix, int rows, int cols);
void fill_zero(float *matrix, int rows, int cols);
int check(float *C1, float *C2, int rows, int cols);
void print_matrix(char *label, float *matrix, int rows, int cols);

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

void coo_multiply(float *A, float *B, float *C, int rows, int cols) {
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            C[i*cols+j] = 0;
            for (int k = 0; k<cols; k++) {
                C[i*cols+j] += A[i*cols+k] * B[j*cols+k];
            }
        }
    }
}

//
// Entry point
//
int main() {
    float *A = malloc(sizeof(float)*N*N);
    float *B = malloc(sizeof(float)*N*N);
    float *C1 = malloc(sizeof(float)*N*N);      // Serial
    float *C2 = malloc(sizeof(float)*N*N);
    
    // Time variables
    clock_t begin, end;
    double serial_time_spent = 0;
    double sparse_time_spent = 0;
    
    // Fill the matrices
    fill_dense(A, N, N);
    fill_dense(B, N, N);
    fill_zero(C1, N, N);
    fill_zero(C2, N, N);
    
    // Run
    begin = clock();
    multiply(A, B, C1, N, N);
    end = clock();
    serial_time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    
    begin = clock();
    multiply(A, B, C2, N, N);
    end = clock();
    sparse_time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    
    int correct = check(C1, C2, N, N);
    printf("Correct: %d\n", correct);
    printf("Serial Time: %lf\n", serial_time_spent);
    printf("Sparse Time: %lf\n", sparse_time_spent);

    return 0;
}

