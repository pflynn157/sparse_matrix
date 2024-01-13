#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <map>
#include <cstdlib>
#include <algorithm>

#include "utils.h"

void cooToEll(COO &coo, int *out_rows, int *out_cols, std::vector<uint64_t> &out_col_crd, std::vector<double> &out_vals) {
    *out_rows = coo.num_rows;
    
    /// Calculate the column count
    uint64_t max = 0;
    uint64_t buffer = 0;
    uint64_t current = 0;
    for (uint64_t i = 0; i < coo.num_vals; i++)
    {
      if (coo.items[i].row == current)
      {
        ++buffer;
      }
      else
      {
        if (buffer > max)
          max = buffer;
        buffer = 1;
        current = coo.items[i].row;
      }
    }
    if (buffer > max)
      max = buffer;
    *out_cols = max;
    
    int num_rows = *out_rows;
    int num_cols = *out_cols;
    
    // Create a map to make padding more efficient
    current = coo.items[0].row;
    std::map<uint64_t, std::vector<uint64_t>> rows;
    std::map<uint64_t, std::vector<double>> vals;
    rows[current] = std::vector<uint64_t>();
    vals[current] = std::vector<double>();
    
    for (uint64_t i = 0; i < coo.num_vals; i++) {
      uint64_t cur_row = coo.items[i].row;
      if (cur_row != current)
      {
        current = cur_row;
        rows[current] = std::vector<uint64_t>();
        vals[current] = std::vector<double>();
      }
      rows[cur_row].push_back(coo.items[i].col);
      vals[cur_row].push_back(coo.items[i].value);
    }
    
    /*for (auto it = rows.begin(); it != rows.end(); it++)
    {
        std::cout << it->first    // string (key)
                  << ": [";
        for (auto v : it->second) std::cout << v << " ";
        std::cout << "]" << std::endl;
    }*/
    
    /// Create the column coordinate list
    uint64_t *col_crd1 = new uint64_t[num_rows * num_cols];
    double* Aval1 = new double[num_rows * num_cols];
    uint64_t index = 0;
    
    // Iterate over each row, and add the non-zero elements
    //printf("[Debug] Begin looping...\n");
    for (uint64_t i = 0; i<num_rows; i++) {
        uint64_t cols = 0;
        auto current_cols = rows[i];
        auto current_vals = vals[i];
        for (uint64_t j = 0; j<current_cols.size(); j++) {
          col_crd1[index] = current_cols[j];
          Aval1[index] = current_vals[j];
          ++index;
          ++cols;
        }
        
        if (cols < num_cols) {
            // Loop while cols < num_cols
            // - set col = 0
            // - check if col is non-zero
            // -- advance col
            // -- repeat
            int col = 0;
            while (cols < num_cols) {
                while (col < num_cols) {
                    if (std::find(current_cols.begin(), current_cols.end(), col) == current_cols.end()) {
                      //Not Found
                      break;
                    }
                    ++col;
                }
                
                col_crd1[index] = col;
                Aval1[index] = 0;
                ++index;
                ++cols;
                ++col;
            }

        }
    }
    
    // Now arrange by column
    uint64_t *col_crd = new uint64_t[num_rows * num_cols];
    double *Aval = new double[num_rows * num_cols];
    index = 0;
    
    for (uint64_t i = 0; i<num_rows; i++) {
        if (index >= num_rows*num_cols) break;
        for (uint64_t j = i; j<num_rows*num_cols; j += num_cols) {
            if (index >= num_rows*num_cols) break;
            col_crd[index] = col_crd1[j];
            Aval[index] = Aval1[j];
            ++index;
        }
    }
    
    // Finally, output
    for (uint64_t i = 0; i<num_rows*num_cols; i++) {
        out_col_crd.push_back(col_crd[i]);
        out_vals.push_back(Aval[i]);
    }
}

int main(int argc, char **argv) {
    auto coo = loadCOO("square.mtx");
    
    /*for (auto item : coo) {
        std::cout << "(" << item.row << ", " << item.col << " = " << item.value << ")" << std::endl;
    }*/
    
    // ELL arrays
    int rows = 0;
    int cols = 0;
    std::vector<uint64_t> col_idx;
    std::vector<double> vals;
    cooToEll(coo, &rows, &cols, col_idx, vals);
    std::vector<double> result(rows, 0.0);

    // Convert COO to CSR
    //std::cout << "Rows: " << coo.num_rows << " | Cols: " << coo.num_cols << " | Vals: " << coo.num_vals << std::endl;
    std::cout << "Rows: " << rows << std::endl;
    std::cout << "Cols: " << cols << std::endl;
    
    std::cout << "Col_Idx: [";
    for (auto col : col_idx) std::cout << col << " ";
    std::cout << "]" << std::endl;
    
    std::cout << "Vals: [";
    for (auto v : vals) std::cout << v << " ";
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
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j <cols; ++j) {
            int n = i*cols+j;
            int colIndex = col_idx[n];
            printf("(%d, %d) (%d -> %lf) %d\n", i, j, n, vals[n], colIndex);
            result[i] += vals[n] * Y[colIndex];
        }
    }
    
    // Print results
    std::cout << "Results: [";
    for (auto v : result) std::cout << v << " ";
    std::cout << "]" << std::endl;
    
    return 0;
}

