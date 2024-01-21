#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <cstdlib>

#include "utils.h"

// Function to convert COO format to CSR format
void cooToCsr(COO &coo, std::vector<double> &values, std::vector<int> &columnIndices, std::vector<int> &rowPointers) {
    // Step 1: Sort the COO entries based on row indices
    //sort(cooEntries.begin(), cooEntries.end(), [](const COOEntry& a, const COOEntry& b) {
    //    return a.row < b.row || (a.row == b.row && a.col < b.col);
    //});

    // Step 2: Construct CSR arrays
    values.clear();
    columnIndices.clear();
    rowPointers.clear();
    
    rowPointers.push_back(0);
    
    int numRows = 0;
    for (const auto& entry : coo.items) {
        values.push_back(entry.value);
        columnIndices.push_back(entry.col);

        while (entry.row > numRows) {
            // New row starts, update rowPointer
            rowPointers.push_back(values.size() - 1);
            numRows++;
        }
    }

    // Add the last rowPointer
    rowPointers.push_back(values.size());
}

// CSR

int main(int argc, char **argv) {
    auto coo = loadCOO("square.mtx");
    
    /*for (auto item : coo) {
        std::cout << "(" << item.row << ", " << item.col << " = " << item.value << ")" << std::endl;
    }*/
    
    // CSR arrays
    std::vector<double> csrValues;
    std::vector<int> csrColumnIndices;
    std::vector<int> csrRowPointers;

    // Convert COO to CSR
    std::cout << "Rows: " << coo.num_rows << " | Cols: " << coo.num_cols << " | Vals: " << coo.num_vals << std::endl;
    
    cooToCsr(coo, csrValues, csrColumnIndices, csrRowPointers);
    
    std::cout << "csrRowPointers: ";
    std::cout << "[";
    for (auto rp : csrRowPointers) std::cout << rp << " ";
    std::cout << "]" << std::endl;
    
    std::cout << "csrColumnIndicies: ";
    std::cout << "[";
    for (auto rp : csrColumnIndices) std::cout << rp << " ";
    std::cout << "]" << std::endl;
    
    std::cout << "csrValues: ";
    std::cout << "[";
    for (auto rp : csrValues) std::cout << rp << " ";
    std::cout << "]" << std::endl;
    
    // Create the vector
    // TODO: Change this
    std::vector<double> Y;
    for (int i = 0; i<10; i++) {
        Y.push_back(1.0);
    }
    
    std::cout << "Y: [";
    for (auto v : Y) std::cout << v << " ";
    std::cout << "]" << std::endl;
    
    // Now multiply
    int numRows = csrRowPointers.size() - 1;
    std::vector<double> result(numRows, 0.0);

    for (int i = 0; i < numRows; ++i) {
        for (int j = csrRowPointers[i]; j < csrRowPointers[i + 1]; ++j) {
            int colIndex = csrColumnIndices[j];
            result[i] += csrValues[j] * Y[colIndex];
        }
    }
    
    std::cout << "Results: [";
    for (auto v : result) std::cout << v << " ";
    std::cout << "]" << std::endl;
    
    return 0;
}

