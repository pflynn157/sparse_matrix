#include <stdio.h>
#include <stdlib.h>

#include "matrix.h"

int main(int argc, char **argv) {
	// Init
	float *A = malloc(sizeof(float)*N*N);
	float *B = malloc(sizeof(float)*N*N);
	float *C_basic = malloc(sizeof(float)*N*N);

	fill(A, B);
	make_sparse(A);
	make_sparse(B);
	matrix_transpose(B, B);

	print_matrix(A);
	puts("----");
	print_matrix(B);
	//puts("~~~~");
	//matrix_transpose(B, B_trans);
	//print_matrix(B_trans);
	puts("====");

	return 0;
}