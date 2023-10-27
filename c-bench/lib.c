//
// This contains the common functions for our simulations
//
#include <stdio.h>
#include <stdlib.h>

void fill_dense(float *matrix, int rows, int cols) {
    for (int i = 0; i<rows; i++) {
        for (int j = 0; j<cols; j++) {
            matrix[i*cols+j] = (float)rand()/(float)(RAND_MAX/11);
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
            if (C1[i*cols+j] != C2[i*cols+j]) ++correct;
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

