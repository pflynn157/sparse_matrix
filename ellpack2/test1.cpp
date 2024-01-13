#include <iostream>
#include <string>
#include <vector>
#include <cstdint>

int main(int argc, char **argv) {
    uint64_t rows = 5;
    uint64_t cols = 2;
    std::vector<uint64_t> columnIdxs = {
        0, 1, 2, 0, 1, 3, 4, 0, 3, 4
    };
    std::vector<double> values = {
        1, 2, 3, 4.1, 5.2, 1.4, 2.5, 0, 4, 5
    };
    std::vector<double> vector(rows, 1.7);
    std::vector<double> results(rows, 0.0);
    
    for (uint64_t i = 0; i<rows; i++) {
        for (uint64_t n1 = 0; n1<cols; n1++) {
            uint64_t n = n1 * rows + i;
            uint64_t j = columnIdxs[n];
            
            results[i] += values[n] * vector[j];
        }
    }
    
    for (auto v : results) std::cout << v << ",";
    std::cout << std::endl;
    
    return 0;
}

