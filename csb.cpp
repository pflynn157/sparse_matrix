#include <iostream>
#include <cstdlib>

// Flip for the dense matrix
#define N 4		// Rows
#define M 6 	// Columns

// Create the sparse array
int *create_sparse(int rows, int cols) {
	int *matrix = (int *)malloc(sizeof(int)*rows*cols);
	for (int i = 0; i<rows; i++) {
		for (int j = 0; j<cols; j++) {
			matrix[i*rows+j] = 0;
		}
	}
	
	// This matrix comes from the TACO paper
	matrix[0] = 5;
	matrix[1] = 1;
	matrix[1*cols+0] = 7;
	matrix[1*cols+1] = 3;
	matrix[3*cols+0] = 8;
	matrix[3*cols+3] = 4;
	matrix[3*cols+4] = 9;

	return matrix;
}

// Create the dense array
int *create_dense(int rows, int cols) {
	int *matrix = (int *)malloc(sizeof(int)*rows*cols);
	int index = 1;
	for (int i = 0; i<rows; i++) {
		for (int j = 0; j<cols; j++) {
			matrix[i*cols+j] = index;
			++index;
		}
	}
	return matrix;
}

// Print the array
void print(int *matrix, int rows, int cols) {
	for (int i = 0; i<rows; i++) {
		std::cout << "[";
		for (int j = 0; j<cols; j++) {
			int element = matrix[i*cols+j];
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
			C[i*M+j] = 0;
			for (int k = 0; k<M; k++) {
				//std::cout << "I: " << i << " | J: " << j << " | K: " << k
				//		<< " | A: " << A[i*N+k] << " | B: " << B[k*M+j] << " = " << A[i*N+k] * B[k*M+j] << std::endl;
				C[i*M+j] += A[i*M+k] * B[k*N+j];
			}
		}
	}
}

// CSB MM
void csb_mm(int n, int m, int *row_ptr, int *row_crd, int *col_crd, int *val, int *B, int *C) {
	const int Bb = sqrt(n*m);
	for (int x = 0; x<n; x++) {
		for (int y = 0; y<m; y++) {
			int z = x*m+y;
			for (int a = row_ptr[z]; a<row_ptr[z+1]; a++) {
				int i = x*Bb+row_crd[a];
				int j = y*Bb+col_crd[a]+y;		// This is the iffy part- we're adding padding, but there's not really a way to derive this yet
				std::cout << "I: " << i << " | J: " << j << " | A: " << a << std::endl;
				for (int k = 0; k<M; k++) {

					// C[i][k] += Aval[a] * B[j][k]
					C[i*M+k] += val[a] * B[j*N+k];
				}
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

	// Create the compressed sparse block format
	const int i_size = 2;
	const int j_size = 2;
	const int row_ptr[] = {0, 4, 4, 5, 7};
	const int row_crd[] = {0, 1, 1, 0, 1, 1, 1};
	const int col_crd[] = {0, 0, 1, 1, 0, 0, 1};
	const int val[] = {5, 7, 3, 1, 8, 4, 9};

	// Do the math
	matrix_multiply(A, B, C1);
	std::cout << std::endl;
	//ellpack_multiply(D1, D2, (int*)&col_crd[0], (int*)&val[0], B, C2);
	csb_mm(i_size, j_size, (int*)&row_ptr[0], (int*)&row_crd[0], (int*)&col_crd[0], (int*)&val[0], B, C2);

	// Print everything out
	print(A, N, M);
	std::cout << std::endl;
	print(B, M, N);
	std::cout << "---------" << std::endl;
	std::cout << "C1: With normal MM" << std::endl;
	print(C1, M, N);
	std::cout << std::endl;
	std::cout << "C2: With CSB" << std::endl;
	print(C2, M, N);
	std::cout << std::endl;

	free(A);
	free(B);
	free(C1);
	free(C2);

	return 0;
}
