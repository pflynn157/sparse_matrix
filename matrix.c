#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "matrix.h"

//
// Utility function
//
void print_matrix(float *M) {
	for (int i = 0; i<N; i++) {
		printf("[");
		for (int j = 0; j<N; j++) {
			float c = M[i*N+j];
			if (c >= 100) {
				printf("%.0f ", c);
			} else if (c >= 10) {
				printf("%.0f  ", c);
			} else {
				printf("%.0f   ", c);
			}
		}
		puts("]");
	}
}

/*
Input: matrices A and B
Let C be a new matrix of the appropriate size
For i from 1 to n:
  For j from 1 to p:
    Let sum = 0
    For k from 1 to m:
      Set sum ← sum + Aik × Bkj
    Set Cij ← sum
Return C
*/
void add_mm(float *A, float *B, float *C) {
	for (int i = 0; i<N; i++) {
		for (int j = 0; j<N; j++) {
			float sum = 0;
			for (int k = 0; k<N; k++) {
				sum += A[i*N+k] * B[k*N+j];
			}
			C[i*N+j] = sum;
		}
	}
}

/*
Matrix multiplication on a transposed matrix
*/
// Multiply the transposed matrix together
// C(0,0) = [A(0,0) * B(0,0)] + [A(0,1) * B(0,1)]
// C(0,1) = [A(0,0) * B(1,0)] + [A(0,1) * B(1,1)]
//
// C(i) = A(i)
// C(j) = B(i)
// A(j) = B(j)
void matrix_mm_transposed(float *A, float *B, float *C) {
	for (int i = 0; i<N; i++) {
		for (int j = 0; j<N; j++) {
			float sum = 0;
			for (int k = 0; k<N; k++) {
				sum += A[i*N+k] * B[j*N+k];
			}
			C[i*N+j] = sum;
		}
	}
}

/* TRANSPOSE
for n = 0 to N
    for m = 0 to N
        swap A(n,m) with A(m,n)
*/
void matrix_transpose(float *M, float *M1) {
	for (int n = 0; n<N; n++) {
		for (int m = 0; m<N; m++) {
			M1[m*N+n] = M[n*N+m];
		}
	}
}

/*
 Fill a matrix
*/
void fill(float *A, float *B) {
	float n = 0;
	for (int i = 0; i<N; i++) {
		for (int j = 0; j<N; j++) {
			A[i*N+j] = n;
			B[i*N+j] = n * 2;
			n += 1;
		}
	}
}

void make_sparse(float *M) {
	srand(time(NULL));
	int max = N * N;
	int n = max - (max / 3 );
	for (int z = 0; z<2; z++) {
		for (int x = 0; x<n; x++) {
			int i = rand() % N;
			int j = rand() % N;
			M[i*N+j] = 0;
		}
	}
}
