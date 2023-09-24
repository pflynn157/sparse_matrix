#include <iostream>
#include <cstdlib>
#include <vector>

#include "ellpack.h"

int main() {
    Ellpack *ell = create_matrix();
    ell->print();
    
    std::cout << "-----------------------------" << std::endl;
    
    Matrix *B = new Matrix(5, 5);
    B->print();
    
    std::cout << "-----------------------------" << std::endl;
    
    Matrix *mtx2 = new Matrix(5, 5, true);
    mtx2->A[0] = 1;
    mtx2->A[3] = 2;
    mtx2->A[1*5+1] = 3;
    mtx2->A[1*5+4] = 4;
    mtx2->A[1*5+0] = 0;
    mtx2->A[2*5+2] = 5;
    mtx2->A[3*5+0] = 6;
    mtx2->A[3*5+3] = 7;
    mtx2->A[4*5+1] = 8;
    mtx2->A[4*5+4] = 9;
    mtx2->print();
    
    std::cout << "-----------------------------" << std::endl;
    std::cout << "C (dense-dense multiplication)" << std::endl;
    
    Matrix *C1 = matrix_multiply(mtx2, B);
    C1->print();
    
    std::cout << "-----------------------------" << std::endl;
    std::cout << "C (sparse-dense multiplication)" << std::endl;
    
    Matrix *C2 = sparse_multiply(ell, B);
    C2->print();
    
    delete ell;
    delete B;
    delete mtx2;
    delete C1;
    delete C2;
    return 0;
}

