#pragma once

typedef struct {
    int start;
    int end;
    int *rows;
    int *cols;
    float *values;
} COO;

COO *create_coo(int rows, int cols);
void print_coo(char *label, COO *coo);
void copy_coo(COO *coo, float *matrix, int rows, int cols);

