#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <cstdlib>

#include "utils.h"

void splitString(std::string input, std::vector<std::string> &output) {
    std::string buf = "";
    for (char c : input) {
        if (c == ' ') {
            output.push_back(buf);
            buf = "";
        } else {
            buf += c;
        }
    }
    if (buf.length() > 0) output.push_back(buf);
}

COO loadCOO(std::string input) {
    COO coo;
    
    std::ifstream reader(input);
    if (!reader.is_open()) return coo;
    
    std::string line = "";
    std::vector<std::string> lines;
    
    while (std::getline(reader, line)) {
        if (line[0] == '%') continue;
        lines.push_back(line);
    }
    
    // First line contains dimensions
    // Not needed right now
    std::vector<std::string> dims;
    splitString(lines[0], dims);
    coo.num_rows = std::stoi(dims[0]);
    coo.num_cols = std::stoi(dims[1]);
    coo.num_vals = std::stoi(dims[2]);
    
    // Second line onward is the data
    for (int i = 1; i<lines.size(); i++) {
        std::vector<std::string> words;
        splitString(lines[i], words);
        
        int x = std::stoi(words[0]);
        int y = std::stoi(words[1]);
        double val = std::stof(words[2]);
        COOItem item { x-1, y-1, val };
        coo.items.push_back(item);
    }
    
    return coo;
}

