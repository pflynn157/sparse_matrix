// final.c
#include <stdio.h>
#include <stdlib.h>

#define N 4

//
// Fill arrays
//
void fill_A(float *A) {
	A[0*N+2] = 3;
	A[1*N+3] = 1;
	A[2*N+0] = 2;
}

void fill_B(float *B) {
	B[0*N+1] = 4; B[0*N+3] = 1;
	B[2*N+1] = 7;
	B[3*N+3] = 3;
}

void print_matrix(float *M) {
	for (int i = 0; i<N; i++) {
		printf("[");
		for (int j = 0; j<N; j++) {
			float c = M[i*N+j];
			if (c >= 10) {
				printf("%.0f  ", c);
			} else {
				printf("%.0f   ", c);
			}
		}
		puts("]");
	}
}
//
// Transposes a matrix for better calculation
//
void matrix_transpose(float *M, float *M1) {
	for (int n = 0; n<N; n++) {
		for (int m = 0; m<N; m++) {
			M1[m*N+n] = M[n*N+m];
		}
	}
}

//
// Build a coordinate list
//
typedef struct {
	int i;
	int j;
	float v;
} Coord;

void build_coord_list(float *M, Coord **list) {
	int index = 0;
	for (int i = 0; i<N; i++) {
		for (int j = 0; j<N; j++) {
			if (M[i*N+j] == 0) continue;
			Coord *coord = malloc(sizeof(Coord));
			coord->i = i;
			coord->j = j;
			coord->v = M[i*N+j];
			list[index] = coord;
			++index;
		}
	}
}

void print_coord_list(Coord **list) {
	printf("R  C | V\n");
	printf("--------\n");

	int index = 0;
	Coord *c = list[index];
	++index;
	while (c) {
		printf("%d  %d | %.0f\n", c->i, c->j, c->v);
		c = list[index];
		++index;
	}
}

//
// Entry point
//
int main(int argc, char *argv[]) {
	float *A = malloc(sizeof(float)*N*N);
	float *B = malloc(sizeof(float)*N*N);
	float *BT = malloc(sizeof(float)*N*N);
	float *C = malloc(sizeof(float)*N*N);
	fill_A(A);
	fill_B(B);
	matrix_transpose(B, BT);

	print_matrix(A);
	puts("");
	print_matrix(B);
	puts("->");
	print_matrix(BT);
	puts("---");

	// Now build the coordinate lists
	Coord **A_coo = malloc(sizeof(Coord*)*N*N);
	Coord **B_coo = malloc(sizeof(Coord*)*N*N);
	for (int i = 0; i<N*N; i++) {
		A_coo[i] = 0;
		B_coo[i] = 0;
	}
	build_coord_list(A, A_coo);
	build_coord_list(BT, B_coo);

	print_coord_list(A_coo);
	puts("");
	print_coord_list(B_coo);
	puts("---");
	puts("");

	// Build the vectors
	int A_max = 0;
	int B_max = 0;
	for (int i = 0; A_coo[i] != 0; i++) {
		++A_max;
	}
	for (int i = 0; B_coo[i] != 0; i++) {
		++B_max;
	}

	float *A_vec = malloc(sizeof(float)*N*N);
	float *B_vec = malloc(sizeof(float)*N*N);
	Coord **P_vec = malloc(sizeof(Coord*)*N*N);
	float *S_vec = malloc(sizeof(float)*N*N);
	int vec_idx = 0;

	for (int i = 0; i<A_max; i++) {
		Coord *A_item = A_coo[i];
		for (int j = 0; j<B_max; j++) {
			Coord *B_item = B_coo[j];
			if (A_item->j == B_item->j) {
				A_vec[vec_idx] = A_item->v;
				B_vec[vec_idx] = B_item->v;

				Coord *coord = malloc(sizeof(Coord));
				coord->i = A_item->i;
				coord->j = B_item->i;
				P_vec[vec_idx] = coord;

				++vec_idx;
			}
		}
	}

	// Print the vectors
	printf("A [");
	for (int i = 0; i<vec_idx; i++) printf("%.0f ", A_vec[i]);
	printf("]\n");

	printf("B [");
	for (int i = 0; i<vec_idx; i++) printf("%.0f ", B_vec[i]);
	printf("]\n");

	printf("P [");
	for (int i = 0; i<vec_idx; i++) {
		Coord *c = P_vec[i];
		printf("(%d, %d) ", c->i, c->j);
	}
	printf("]\n");

	//
	// Now do math
	//
	for (int i = 0; i<vec_idx; i++) {
		S_vec[i] = A_vec[i] * B_vec[i];
	}

	//
	// Put the matrix back together
	//
	for (int i = 0; i<vec_idx; i++) {
		Coord *c = P_vec[i];
		float s = S_vec[i];
		C[c->i*N+c->j] = s;
	}

	puts("");
	puts("===");
	print_matrix(C);

	return 0;
}
