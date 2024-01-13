// run:
// g++ test2.cpp -o test2 -march=native -O3 -fopenmp && ./test2 2> actual.txt && diff actual.txt expected.txt
#include <iostream>
#include <string>
#include <vector>
#include <cstdint>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>

extern "C" double getTime()
{
  struct timeval tp;
  int stat = gettimeofday(&tp, NULL);
  return (tp.tv_sec + tp.tv_usec * 1.0e-6);
}

extern "C" void printElapsedTime(double stime, double etime)
{
  fprintf(stdout, "ELAPSED_TIME = %lf\n", etime - stime);
}

int main(int argc, char **argv) {
    uint64_t rows = 512;
    uint64_t cols = 30;
    std::vector<uint64_t> v_columnIdxs = {
        #include "cols.txt"
    };
    std::vector<double> v_values = {
        #include "vals.txt"
    };
    std::vector<double> v_vector(rows, 1.7);
    std::vector<double> v_results(rows, 0.0);
    
    uint64_t *columnIdxs = new uint64_t[v_columnIdxs.size()];
    for (size_t i = 0; i<v_columnIdxs.size(); i++) columnIdxs[i] = v_columnIdxs[i];
    
    double *values = new double[v_values.size()];
    for (size_t i = 0; i<v_values.size(); i++) values[i] = v_values[i];
    
    double *vector = new double[rows];
    for (size_t i = 0; i<v_vector.size(); i++) vector[i] = 1.7;
    double *results = new double[rows];
    for (size_t i = 0; i<v_results.size(); i++) results[i] = 0.0;
    
    // Measure time
    double stime = getTime();
    for (uint64_t i = 0; i<rows; i++) {
        for (uint64_t nn1 = 0; nn1<cols; nn1+=1) {
            uint64_t n1 = nn1 * rows + i;
            uint64_t j1 = columnIdxs[n1];
            results[i] += values[n1] * vector[j1];
        }
    }
    double etime = getTime();
    printElapsedTime(stime, etime);
    
    for (size_t i = 0; i<rows; i++) std::cerr << results[i] << ",";
    std::cerr << std::endl;
    
    return 0;
}

