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
// Generates and sorts random row and column indicies
//
void generate_random_coords(int *rows, int *cols, int max, int row_count, int col_count) {
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
     
    generate_random_coords(coo->rows, coo->cols, max, rows, cols);
    
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
    generate_random_coords(rows, cols, max, row_count, col_count);
    
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

//
// BCSR methods
//
typedef struct {
    int i;
    int j;
    float value;
} Coord;

int has_values(int i, int mi, int j, int mj, Coord coo[], int coo_len) {
    for (int bi = i; bi<mi; bi++) {
        for (int bj = j; bj<mj; bj++) {
            for (int p = 0; p<coo_len; p++) {
                if (coo[p].i == bi && coo[p].j == bj) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

BCSR *create_bcsr(int row_count, int col_count, float *sparse_matrix) {
    // First, generate a bunch of random COO coordinates
    // Bad practice... overallocate
    Coord coo[row_count * col_count];
    int coo_index = 0;
    
    int density = 10;
    for (int i = 0; i<row_count - 4; i++) {
        for (int j = 0; j<col_count - 4; j++) {
            if ((rand() % 1001) < density) {
                float value = (float)rand()/(float)(RAND_MAX/11);
                Coord c = {i, j, value};
                coo[coo_index] = c;
                ++coo_index;
            }
        }
    }
    
    // debug
    /*for (int i = 0; i<coo_index; i++) {
        printf("(%d, %d, %.0f)\n", coo[i].i, coo[i].j, coo[i].value);
    }
    printf("--Total: %d of %d\n", coo_index, row_count*col_count);*/
    
    // Step 1: Determine block size
    int block_rows = row_count / 32;
    int block_cols = col_count / 32;
    printf("Block_rows: %d | Block_cols: %d\n", block_rows, block_cols);
    
    // Step 2: Create some temporary structures to old intermediate data
    int A2pos_nc_buf[col_count];
    int A2crd_buf[col_count];
    int A2pos_nc_idx = 0;
    int A2crd_idx = 0;
    
    float Aval_buf[row_count*col_count];
    int Aval_buf_idx = 0;
    
    for (int i = 0; i<row_count; i+=block_rows) {
        for (int j = 0; j<col_count; j+=block_cols) {
            if (!has_values(i, i+block_rows, j, j+block_cols, coo, coo_index)) continue;
            A2pos_nc_buf[A2pos_nc_idx] = i / block_rows;
            A2crd_buf[A2crd_idx] = j / block_cols;
            ++A2pos_nc_idx;
            ++A2crd_idx;
            
            // Add all the values
            for (int bi = i; bi<(i+block_rows); bi++) {
                for (int bj = j; bj<(j+block_cols); bj++) {
                    int found = 0;
                    for (int p = 0; p<coo_index; p++) {
                        if (coo[p].i == bi && coo[p].j == bj) {
                            Aval_buf[Aval_buf_idx] = coo[p].value;
                            ++Aval_buf_idx;
                            found = 1;
                            break;
                        }
                    }
                    if (found == 0) {
                        Aval_buf[Aval_buf_idx] = 0;
                        ++Aval_buf_idx;
                    }
                }
            }
        }
    }
    
    // Compress the row coordinates
    int A2pos_buf[col_count];
    A2pos_buf[0] = 0;
    int A2pos_idx = 1;
    
    int current = A2pos_nc_buf[0];
    int current_end = 1;
    for (int i = 1; i<A2pos_nc_idx; i++) {
        if (A2pos_nc_buf[i] != current) {
            A2pos_buf[A2pos_idx] = current_end;
            ++A2pos_idx;
            current = A2pos_nc_buf[i];
        }
        current_end++;
    }
    A2pos_buf[A2pos_idx] = current_end;
    ++A2pos_idx;
    
    int A1pos = A2pos_idx - 1;
    
    // debug
    printf("A1pos: %d\n", A1pos);
    printf("A2pos: [");
    for (int i = 0; i<A2pos_idx; i++) {
        printf("%d ", A2pos_buf[i]);
    }
    puts("]");
    printf("A2crd: [");
    for (int i = 0; i<A2crd_idx; i++) {
        printf("%d ", A2crd_buf[i]);
    }
    puts("]");
    printf("Aval: [");
    for (int i = 0; i<Aval_buf_idx; i++) {
        printf("%.0f ", Aval_buf[i]);
    }
    puts("]");
    
    // Now, copy everything over
    BCSR *bcsr = malloc(sizeof(BCSR));
    bcsr->rows = A1pos;
    bcsr->colptr_len = A2pos_idx;
    bcsr->colidx_len = A2crd_idx;
    bcsr->val_len = Aval_buf_idx;
    bcsr->colptr = malloc(sizeof(int)*A2pos_idx);
    bcsr->colidx = malloc(sizeof(int)*A2crd_idx);
    bcsr->values = malloc(sizeof(float)*Aval_buf_idx);
    bcsr->block_row = block_rows;
    bcsr->block_col = block_cols;
    
    for (int i = 0; i<A2pos_idx; i++) {
        bcsr->colptr[i] = A2pos_buf[i];
    }
    
    for (int i = 0; i<A2crd_idx; i++) {
        bcsr->colidx[i] = A2crd_buf[i];
    }
    
    for (int i = 0; i<Aval_buf_idx; i++) {
        bcsr->values[i] = Aval_buf[i];
    }
    
    // Finally, copy to our test sparse array
    for (int p = 0; p<coo_index; p++) {
        Coord c = coo[p];
        sparse_matrix[c.i*col_count+c.j] = c.value;
    }
    
    return bcsr;    
}

BCSR *create_bcsr1(int rows, int cols) {
    CSR *csr = create_csr(rows, cols);
    
    BCSR *bcsr = malloc(sizeof(BCSR));
    bcsr->rows = csr->rows;
    bcsr->colptr_len = csr->colptr_len;
    bcsr->colidx_len = csr->colidx_len;
    bcsr->val_len = csr->colidx_len;
    bcsr->colptr = malloc(sizeof(int)*csr->colptr_len);
    bcsr->colidx = malloc(sizeof(int)*csr->colidx_len);
    bcsr->values = malloc(sizeof(int)*csr->colidx_len);
    bcsr->block_row = 1;
    bcsr->block_col = 1;
    for (int i = 0; i<csr->colptr_len; i++) bcsr->colptr[i] = csr->colptr[i];
    for (int i = 0; i<csr->colidx_len; i++) bcsr->colidx[i] = csr->colidx[i];
    for (int i = 0; i<csr->colidx_len; i++) bcsr->values[i] = csr->values[i];
    return bcsr;
}

void print_bcsr(char *label, BCSR *bcsr) {
    puts("---------------------------------------------------");
    printf("BCSR %s\n", label);
    printf("[%d]\n", bcsr->rows);
    printf("Colptr: [");
    for (int i = 0; i<bcsr->colptr_len; i++) printf("%d ", bcsr->colptr[i]);
    puts("]");
    printf("Colidx: [");
    for (int i = 0; i<bcsr->colidx_len; i++) printf("%d ", bcsr->colidx[i]);
    puts("]");
    printf("Block Row: %d\n", bcsr->block_row);
    printf("Block Col: %d\n", bcsr->block_col);
    printf("Vals: [");
    for (int i = 0; i<bcsr->val_len; i++) printf("%.0f ", bcsr->values[i]);
    puts("]");
    puts("---------------------------------------------------");
}

void copy_bcsr(BCSR *bcsr, float *matrix, int rows, int cols) {
    for (int n1 = 0; n1<bcsr->rows; n1++) {
        for (int bi = 0; bi<bcsr->block_row; bi++) {
            for (int n2 = bcsr->colptr[n1]; n2<bcsr->colptr[n1+1]; n2++) {
                for (int bj = 0; bj<bcsr->block_col; bj++) {
                    int i = n1 * bcsr->block_row + bi;
                    int j =  bcsr->colidx[n2] * bcsr->block_col + bj;
                    int p = n2*(bcsr->block_row*bcsr->block_col) + bi * bcsr->block_col + bj;
                    matrix[i*cols+j] = bcsr->values[p];
                }
            }
        }
    }               
}

//
// ELLPACK methods
//
void generate_valid_columns(int *valid_columns, int* rows, int *cols, int current_row, int total_cols, int max) {
    for (int i = 0; i<total_cols; i++) valid_columns[i] = i;
    
    for (int i = 0; i<max; i++) {
        if (rows[i] == current_row) {
            valid_columns[i] = -1;
        }
    }
}

ELL *create_ell(int row_count, int col_count) {
    int total_size = row_count * col_count;
    int max = total_size / 6;
    
    // Generate row and column indicies
    int rows[max];
    int cols[max];
    generate_random_coords(rows, cols, max, row_count, col_count);
    
    // Determine the block size (number of coordinates per block)
    int current = rows[0];
    int current_len = 1;
    int total_cols = 1;
    for (int i = 1; i<max; i++) {
        if (rows[i] != current) {
            current = rows[i];
            if (current_len > total_cols) {
                total_cols = current_len;
            }
            current_len = 1;
        } else {
            ++current_len;
        }
    }
    if (current_len > total_cols) total_cols = current_len;
    
    //debug
    /*printf("Rows: [");
    for (int i = 0; i<max; i++) printf("%d ", rows[i]);
    puts("]");
    printf("Cols: [");
    for (int i = 0; i<max; i++) printf("%d ", cols[i]);
    puts("]");*/
    
    // Setup the matrix
    ELL *ell = malloc(sizeof(ELL));
    ell->rows = row_count;
    ell->cols = total_cols;
    ell->colidx = malloc(sizeof(int)*(row_count*total_cols));
    ell->values = malloc(sizeof(int)*(row_count*total_cols));
    
    // Now, fill in the column indicies with appropriate padding
    current = rows[0];
    current_len = 1;
    
    int pos = 1;
    int col_pos = 1;
    ell->colidx[0] = cols[0];
    
    for (int i = 1; i<max; i++) {
        if (rows[i] != current) {
            if (current_len < total_cols) {
                int valid_cols[col_count];
                generate_valid_columns(valid_cols, rows, cols, current, col_count, max);
                int v = 0;
                
                for (int j = current_len; j<total_cols; j++) {
                    int vc = valid_cols[v];
                    while (vc == -1) {
                        ++v;
                        vc = valid_cols[v];
                    }
                    ++v;
                    
                    ell->colidx[col_pos] = vc;
                    ell->values[col_pos] = 0;
                    ++col_pos;
                }
            }
            
            current = rows[i];
            current_len = 1;
            
            ell->colidx[col_pos] = cols[pos];
            ++col_pos;
            ++pos; 
        } else {
            ++current_len;
            ell->colidx[col_pos] = cols[pos];
            ell->values[col_pos] = (float)rand()/(float)(RAND_MAX/11);
            ++col_pos;
            ++pos; 
        }
    }
    if (current_len < total_cols) {
        int valid_cols[col_count];
        generate_valid_columns(valid_cols, rows, cols, current, col_count, max);
        int v = 0;
        
        for (int j = current_len; j<total_cols; j++) {
            int vc = valid_cols[v];
            while (vc == -1) {
                ++v;
                vc = valid_cols[v];
            }
            ++v;
            
            ell->colidx[col_pos] = vc;
            ell->values[col_pos] = 0;
            ++col_pos;
        }
    }
    
    return ell;
}

void print_ell(char *label, ELL *ell) {
    puts("---------------------------------------------------");
    printf("ELL %s\n", label);
    printf("Rows: %d\n", ell->rows);
    printf("Cols: %d\n", ell->cols);
    printf("Colidx: [");
    for (int i = 0; i<(ell->rows * ell->cols); i++) printf("%d ", ell->colidx[i]);
    puts("]");
    printf("Vals:   [");
    for (int i = 0; i<(ell->rows * ell->cols); i++) printf("%.0f ", ell->values[i]);
    puts("]");
    puts("---------------------------------------------------");
}

void copy_ell(ELL *ell, float *matrix, int rows, int cols) {
    for (int i = 0; i<ell->rows; i++) {
        for (int c = 0; c<ell->cols; c++) {
            int n = i * ell->cols + c;
            int j = ell->colidx[n];
            matrix[i*cols+j] = ell->values[n];
        }
    }
}

