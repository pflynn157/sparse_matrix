#include <stdio.h>
#include <stdlib.h>

#include "matrix.h"

int main(int argc, char **argv) {
	// Init
	float *A = malloc(sizeof(float)*N*N);
	float *B = malloc(sizeof(float)*N*N);
	float *C_basic = malloc(sizeof(float)*N*N);

	float *B_trans = malloc(sizeof(float)*N*N);
	float *C_trans = malloc(sizeof(float)*N*N);

	fill(A, B);

	print_matrix(A);
	puts("----");
	print_matrix(B);
	puts("~~~~");
	matrix_transpose(B, B_trans);
	print_matrix(B_trans);
	puts("====");

	add_mm(A, B, C_basic);
	print_matrix(C_basic);

	matrix_mm_transposed(A, B_trans, C_trans);

	puts("");
	print_matrix(C_trans);

	return 0;
}