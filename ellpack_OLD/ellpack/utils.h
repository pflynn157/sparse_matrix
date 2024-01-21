#pragma once

struct COOItem {
    int row;
    int col;
    double value;
};

struct COO {
    int num_rows;
    int num_cols;
    int num_vals;
    std::vector<COOItem> items;
};

void splitString(std::string input, std::vector<std::string> &output);
COO loadCOO(std::string input);

