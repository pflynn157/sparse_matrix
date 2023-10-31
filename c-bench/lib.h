#pragma once

typedef struct {
    int start;
    int end;
    int *rows;
    int *cols;
    float *values;
} COO;

typedef struct {
    int rows;   // Dense -> A1 attribute
    int *colptr;
    int *colidx;
    float *values;
    
    // only for debug
    int colptr_len;
    int colidx_len;
} CSR;

typedef struct {
    int rows;
    int *colptr;
    int *colidx;
    float *values;
    int block_row;
    int block_col;
    
    // only for debug
    int colptr_len;
    int colidx_len;
    int val_len;
} BCSR;

typedef struct {
    int rows;
    int cols;
    int *colidx;
    float *values;
} ELL;

void fill_dense(float *matrix, int rows, int cols);
void fill_zero(float *matrix, int rows, int cols);
int check(float *C1, float *C2, int rows, int cols);
void print_matrix(char *label, float *matrix, int rows, int cols);

COO *create_coo(int rows, int cols);
void print_coo(char *label, COO *coo);
void copy_coo(COO *coo, float *matrix, int rows, int cols);

CSR *create_csr(int rows, int cols);
void print_csr(char *label, CSR *csr);
void copy_csr(CSR *csr, float *matrix, int rows, int cols);

BCSR *create_bcsr(int rows, int cols, float *sparse_matrix);
BCSR *create_bcsr1(int rows, int cols);
void print_bcsr(char *label, BCSR *csr);
void copy_bcsr(BCSR *csr, float *matrix, int rows, int cols);

ELL *create_ell(int rows, int cols);
void print_ell(char *label, ELL *ell);
void copy_ell(ELL *ell, float *matrix, int rows, int cols);

