#pragma once

#define N 4

void print_matrix(float *M);
void add_mm(float *A, float *B, float *C);
void matrix_mm_transposed(float *A, float *B, float *C);
void matrix_transpose(float *M, float *M1);
void fill(float *A, float *B);
void make_sparse(float *M);
