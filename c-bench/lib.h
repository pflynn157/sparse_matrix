#pragma once

typedef struct {
    int start;
    int end;
    int *rows;
    int *cols;
    float *values;
} COO;

void fill_dense(float *matrix, int rows, int cols);
void fill_zero(float *matrix, int rows, int cols);
int check(float *C1, float *C2, int rows, int cols);
void print_matrix(char *label, float *matrix, int rows, int cols);

COO *create_coo(int rows, int cols);
void print_coo(char *label, COO *coo);
void copy_coo(COO *coo, float *matrix, int rows, int cols);

