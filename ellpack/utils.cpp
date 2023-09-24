#include <iostream>

#include "ellpack.h"

Ellpack *create_matrix() {
    Ellpack *matrix = new Ellpack;
    
    matrix->A1_pos = 5;
    matrix->A1_tile_pos = 2;
    
    matrix->A2_pos = -1;
    matrix->A2_crd.push_back(0); matrix->A2_crd.push_back(3);   // Row 0
    matrix->A2_crd.push_back(1); matrix->A2_crd.push_back(4);   // Row 1
    matrix->A2_crd.push_back(0); matrix->A2_crd.push_back(2);   // Row 2
    matrix->A2_crd.push_back(0); matrix->A2_crd.push_back(3);   // Row 3
    matrix->A2_crd.push_back(1); matrix->A2_crd.push_back(4);   // Row 4
    
    matrix->Aval.push_back(1); matrix->Aval.push_back(2);   // Row 0
    matrix->Aval.push_back(3); matrix->Aval.push_back(4);   // Row 1
    matrix->Aval.push_back(0); matrix->Aval.push_back(5);   // Row 2
    matrix->Aval.push_back(6); matrix->Aval.push_back(7);   // Row 3
    matrix->Aval.push_back(8); matrix->Aval.push_back(9);   // Row 4
    
    return matrix;
}

void Ellpack::print() {
    std::cout << "A1_pos: " << A1_pos << std::endl;
    std::cout << "A1_tile_pos: " << A1_tile_pos << std::endl;
    std::cout << "A2_pos: " << A2_pos << std::endl;
    std::cout << "A2_crd: ";
    for (auto crd : A2_crd) {
        std::cout << crd << " ";
    }
    std::cout << std::endl;
    std::cout << "Aval: ";
    for (auto val : Aval) {
        std::cout << val << " ";
    }
    std::cout << std::endl;
}

//----------------------------------------------------------

Matrix::Matrix(int row, int col, bool zero) {
    this->row = row;
    this->col = col;
    A = (int *)malloc(sizeof(int)*row*col*2);
	for (int i = 0; i<row*col; i++) {
	    if (zero) A[i] = 0;
		else A[i] = 1;
	}
}

void Matrix::print() {
    for (int i = 0; i<row; i++) {
        std::cout << "[";
        for (int j = 0; j<col; j++) {
            int val = A[i*col+j];
            if (val < 10) std::cout << " ";
            std::cout << val << " ";
        }
        std::cout << "]" << std::endl;
    }
}

