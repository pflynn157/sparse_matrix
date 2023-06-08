#include <stdio.h>
#include <stdlib.h>

#include "matrix.h"

int main(int argc, char **argv) {
	// Init
	float *A = malloc(sizeof(float)*N*N);
	float *B = malloc(sizeof(float)*N*N);
	float *C_basic = malloc(sizeof(float)*N*N);

	// Load A
	A[0*N+2] = 3;
	A[1*N+0] = 4; A[1*N+2] = 1;
	A[2*N+0] = 1; A[2*N+3] = 5;
	A[3*N+1] = 7; A[3*N+2] = 8;

	// Load B
	B[0] = 7; B[0*N+2] = 4;
	B[1*N+0] = 9;
	B[2*N+1] = 3; B[2*N+3] = 1;
	B[3*N+1] = 5; B[3*N+3] = 2;

	// Print
	print_matrix(A);
	puts("----");
	print_matrix(B);
	//puts("~~~~");
	//matrix_transpose(B, B_trans);
	//print_matrix(B_trans);
	puts("====");

	return 0;
}