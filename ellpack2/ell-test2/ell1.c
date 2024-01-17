#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "utils.h"

int main(int argc, char **argv) {
    void *alloc = malloc(sizeof(uint64_t)*13);
    read_input_sizes_2D_f64(0, 0, -1, 3, 0, 0, alloc, 1);
    return 0;
}

