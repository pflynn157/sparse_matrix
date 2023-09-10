#include <iostream>
#include <cstdlib>

// Flip for the dense matrix
#define N 5		// Rows
#define M 4		// Columns

// Create the sparse array
int *create_sparse(int rows, int cols) {
	int *matrix = (int *)malloc(sizeof(int)*rows*cols*2);
	for (int i = 0; i<N*M; i++) matrix[i] = 0;

	// This matrix comes from the COMET paper
	matrix[0] = 1;
	matrix[3] = 2;
	matrix[1*rows+0] = 3;
	matrix[1*rows+1] = 4;
	matrix[3*rows+1] = 5;
	matrix[4*rows+2] = 6;
	matrix[4*rows+3] = 7;
	return matrix;
}

// Create the dense array
int *create_dense(int rows, int cols) {
	int *matrix = (int *)malloc(sizeof(int)*rows*cols*2);
	for (int i = 0; i<N*M; i++) {
		matrix[i] = i + 1;
	}
	return matrix;
}

// Print the array
void print(int *matrix, int rows, int cols) {
	for (int i = 0; i<rows; i++) {
		std::cout << "[";
		for (int j = 0; j<cols; j++) {
			int element = matrix[i*rows+j];
			std::cout << element;
			if (element >= 100) {
				std::cout << " ";
			} else if (element >= 10) {
				std::cout << "  ";
			} else {
				std::cout << "   ";
			}
		}
		std::cout << "]" << std::endl;
	}
}

// Conventional MM
void matrix_multiply(int *A, int *B, int *C) {
    for (int i = 0; i<N; i++) {
		for (int j = 0; j<M; j++) {
			C[i*N+j] = 0;
			for (int k = 0; k<M; k++) {
				C[i*N+j] += A[i*N+k] * B[k*M+j];
			}
		}
	}
}

// ELLPACK MM
void ellpack_multiply(int D1, int D2, int *col_crd, int *Aval, int *B, int *C) {
	for (int i = 0; i<D1; i++) {
		for (int n = 0; n<D2; n++) {
			int n2 = i*D2+n;
			int j = col_crd[n2];
			for (int k = 0; k<M; k++) {
				C[i*N+k] += Aval[n2] * B[j*M+k];
			}
		}
	}
}

// Main function
int main() {
	// Create the arrays
	int *A = create_sparse(N, M);
	int *B = create_dense(M, N);
	int *C1 = (int *)malloc(sizeof(int)*N*M*2);
	int *C2 = (int *)malloc(sizeof(int)*N*M*2);

	// Create the ellpack format
	const int D1 = 5;	// Number of rows
	const int D2 = 2;	// Number of columns per rows
	const int col_crd[] = {0, 3, 0, 1, 0, 1, 0, 1, 2, 3};
	const int val[] = {1, 2, 3, 4, 0, 0, 0, 5, 6, 7};

	// Do the math
	matrix_multiply(A, B, C1);
	std::cout << std::endl;
	ellpack_multiply(D1, D2, (int*)&col_crd[0], (int*)&val[0], B, C2);

	// Print everything out
	print(A, N, M);
	std::cout << std::endl;
	print(B, M, N);
	std::cout << "---------" << std::endl;
	std::cout << "C1: With normal MM" << std::endl;
	print(C1, M, N);
	std::cout << std::endl;
	std::cout << "C2: With ellpack" << std::endl;
	print(C2, M, N);
	std::cout << std::endl;

	free(A);
	free(B);
	free(C1);
	free(C2);

	return 0;
}
