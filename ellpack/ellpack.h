#pragma once

#include <vector>

//
// The structure
// Emulates the structure received from the load
//
struct Ellpack {
    int A1_pos;
    std::vector<int> A1_crd;
    
    int A1_tile_pos;
    std::vector<int> A1_tile_crd;
    
    int A2_pos;
    std::vector<int> A2_crd;
    
    std::vector<int> Aval;
    
    // Prints the matrix
    void print();
};

Ellpack *create_matrix();

//------------------------------------------

struct Matrix {
    int row;
    int col;
    int *A;
    
    explicit Matrix(int row, int col, bool zero = false);
    void print();
};

//------------------------------------------

Matrix *matrix_multiply(Matrix *A, Matrix *B);
Matrix *sparse_multiply(Ellpack *A, Matrix *B);

