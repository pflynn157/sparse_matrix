//
// This contains the common functions for our simulations
//
#include <stdio.h>
#include <stdlib.h>

#include "lib.h"

void fill_dense(float *matrix, int rows, int cols) {
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            //matrix[i*cols+j] = (float)rand()/(float)(RAND_MAX/11);
            matrix[i*cols+j] = 1;
        }
    }
}

void fill_zero(float *matrix, int rows, int cols) {
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            matrix[i*cols+j] = 0.0f;
        }
    }
}

int check(float *C1, float *C2, int rows, int cols) {
    int correct = 0;
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            if (((int)C1[i*cols+j]) != ((int)C2[i*cols+j])) ++correct;
        }
    }
    return correct;
}

void print_matrix(char *label, float *matrix, int rows, int cols) {
    puts("---------------------------------------------------");
    printf("%s\n", label);
    for (int i = 0; i<rows; i++) {
        printf("[");
        for (int j = 0; j<cols; j++) {
            printf("%.0f ", matrix[i*cols+j]);
        }
        puts("]");
    }
    puts("---------------------------------------------------");
}

//
// COO methods
//
COO *create_coo(int rows, int cols) {
    int total_size = rows * cols;
    int max = total_size / 6;
    
    COO *coo = malloc(sizeof(COO));
    coo->start = 0;
    coo->end = max;
    coo->rows = malloc(sizeof(int)*max);
    coo->cols = malloc(sizeof(int)*max);
    coo->values = malloc(sizeof(float)*max);
    
    for (int i = 0; i<max; i++) {
        while (1) {
            int good = 1;
            int r = rand() % rows;
            int c = rand() % cols;
            for (int j = 0; j<i; j++) {
                if (coo->rows[j] == r && coo->cols[j] == c) {
                //puts("IN");
                    good = 0;
                    break;
                }
            }
            
            if (good == 1) {
                coo->rows[i] = r;
                coo->cols[i] = c;
                break;
            }
        }
        coo->values[i] = (float)rand()/(float)(RAND_MAX/11);
    }
    
    // Sort rows and cols
    while (1) {
        int swapped = 0;
        
        for (int i = 1; i<max; i++) {
            if (coo->rows[i] < coo->rows[i-1]) {
                int t1 = coo->rows[i-1];
                coo->rows[i-1] = coo->rows[i];
                coo->rows[i] = t1;
                
                int t2 = coo->cols[i-1];
                coo->cols[i-1] = coo->cols[i];
                coo->cols[i] = t2;
                
                swapped = 1;
            }
        }
        
        if (!swapped) break;
    }
    
    return coo;
}

void copy_coo(COO *coo, float *matrix, int rows, int cols) {
    for (int i = 0; i<coo->end; i++) {
        int r = coo->rows[i];
        int c = coo->cols[i];
        matrix[r*cols+c] = coo->values[i];
    }
}

void print_coo(char *label, COO *coo) {
    puts("---------------------------------------------------");
    printf("COO %s\n", label);
    printf("[%d, %d]\n", coo->start, coo->end);
    printf("Rows: [");
    for (int i = 0; i<coo->end; i++) printf("%d ", coo->rows[i]);
    puts("]");
    printf("Cols: [");
    for (int i = 0; i<coo->end; i++) printf("%d ", coo->cols[i]);
    puts("]");
    printf("Vals: [");
    for (int i = 0; i<coo->end; i++) printf("%.0f ", coo->values[i]);
    puts("]");
    puts("---------------------------------------------------");
}

//
// CSR methods
//
CSR *create_csr(int row_count, int col_count) {
    int total_size = row_count * col_count;
    int max = total_size / 6;
    
    // Generate row and column indicies
    int rows[max];
    int cols[max];
    for (int i = 0; i<max; i++) {
        while (1) {
            int good = 1;
            int r = rand() % row_count;
            int c = rand() % col_count;
            for (int j = 0; j<i; j++) {
                if (rows[j] == r && cols[j] == c) {
                    good = 0;
                    break;
                }
            }
            
            if (good == 1) {
                rows[i] = r;
                cols[i] = c;
                break;
            }
        }
    }
    
    // Sort rows and cols
    while (1) {
        int swapped = 0;
        
        for (int i = 1; i<max; i++) {
            if (rows[i] < rows[i-1]) {
                int t1 = rows[i-1];
                rows[i-1] = rows[i];
                rows[i] = t1;
                
                int t2 = cols[i-1];
                cols[i-1] = cols[i];
                cols[i] = t2;
                
                swapped = 1;
            }
        }
        
        if (!swapped) break;
    }
    
    //debug
    /*printf("Rows: [");
    for (int i = 0; i<max; i++) printf("%d ", rows[i]);
    puts("]");
    printf("Cols: [");
    for (int i = 0; i<max; i++) printf("%d ", cols[i]);
    puts("]");*/
    
    // Build the matrix
    CSR *csr = malloc(sizeof(CSR));
    csr->rows = row_count;
    csr->colptr = malloc(sizeof(int)*(row_count+1));
    csr->colidx = malloc(sizeof(int)*max);
    csr->values = malloc(sizeof(float)*max);
    csr->colptr_len = row_count + 1;
    csr->colidx_len = max;
    
    // Generate a column index
    int current = rows[0];
    csr->colptr[0] = 0;
    int colptr_index = 1;
    int colptr_bound = 1;
    
    csr->colidx[0] = cols[0];
    csr->values[0] = (float)rand()/(float)(RAND_MAX/11);
    
    for (int i = 1; i<max; i++) {
        //printf("Current: %d | Rows[%d]: %d\n", current, i, rows[i]);
        if (rows[i] != current) {
            //puts("\t->");
            csr->colptr[colptr_index] = colptr_bound;
            ++colptr_index;
            ++colptr_bound;
            current = rows[i];
        } else {
            ++colptr_bound;
        }
        
        csr->colidx[i] = cols[i];
        csr->values[i] = (float)rand()/(float)(RAND_MAX/11);
    }
    
    return csr;
}

void copy_csr(CSR *csr, float *matrix, int rows, int cols) {
    for (int i = 0; i<csr->rows; i++) {
        for (int p = csr->colptr[i]; p<csr->colptr[i+1]; p++) {
            int j = csr->colidx[p];
            matrix[i*cols+j] = csr->values[p];
        }
    }
}

void print_csr(char *label, CSR *csr) {
    puts("---------------------------------------------------");
    printf("CSR %s\n", label);
    printf("[%d]\n", csr->rows);
    printf("Colptr: [");
    for (int i = 0; i<csr->colptr_len; i++) printf("%d ", csr->colptr[i]);
    puts("]");
    printf("Colidx: [");
    for (int i = 0; i<csr->colidx_len; i++) printf("%d ", csr->colidx[i]);
    puts("]");
    printf("Vals: [");
    for (int i = 0; i<csr->colidx_len; i++) printf("%.0f ", csr->values[i]);
    puts("]");
    puts("---------------------------------------------------");
}

