#include <iostream>

int main() {
	int num_rows = 5;
	int elements_in_rows = 2;
	int values[] = {
		1, 2,
		3, 4,
		0, 0,
		0, 5,
		6, 7
	};

	int col_idx[] = {
		0, 3,
		0, 1,
		0, 1,
		0, 1,
		2, 3
	};

	int sparse[] = {
		1, 0, 0, 2,
		3, 4, 0, 0,
		0, 0, 0, 0,
		0, 5, 0, 0,
		0, 0, 6, 7
	};

	int dense[] = {
		1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16,
		17, 18, 19, 20
	};

	int matrix1[] = {
		0, 0, 0, 0,    0, 0, 0, 0,    0, 0, 0, 0,
		0, 0, 0, 0,    0, 0, 0, 0
	};

	int empty[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	int matrix2[] = {
		0, 0, 0, 0,    0, 0, 0, 0,    0, 0, 0, 0,
		0, 0, 0, 0,    0, 0, 0, 0
	};

	// Conventional multiplication
	for (int i = 0; i<num_rows; i++) {
		for (int j = 0; j<4; j++) {
			matrix1[i*num_rows+j] = 0;
			for (int k = 0; k<num_rows; k++) {
				matrix1[i*num_rows+j] += dense[i*num_rows+k] * sparse[k*num_rows+j];
			}
		}
	}

	// print
	for (int i = 0; i<num_rows; i++) {
		std::cout << "[";
		for (int j = 0; j<4; j++) {
			int element = matrix1[i*num_rows+j];
			std::cout << element;
			if (element >= 100) {
				std::cout << " ";
			} else if (element >= 10) {
				std::cout << "  ";
			} else {
				std::cout << "   ";
			}
		}
		std::cout << "]" << std::endl;
	}

	
	for (int i = 0; i<num_rows; i++) {
		for (int j = 0; j<elements_in_rows; j++) {
			//int element_offset = i + j * num_rows;
			int element_offset = i*num_rows+j;
			std::cout << col_idx[element_offset] << " ";
		}
		std::cout << std::endl;
	}

	// print
	std::cout << std::endl;
	for (int i = 0; i<num_rows; i++) {
		std::cout << "[";
		for (int j = 0; j<4; j++) {
			int element = matrix2[i*num_rows+j];
			std::cout << element;
			if (element >= 100) {
				std::cout << " ";
			} else if (element >= 10) {
				std::cout << "  ";
			} else {
				std::cout << "   ";
			}
		}
		std::cout << "]" << std::endl;
	}

	return 0;
}
