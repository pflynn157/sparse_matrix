def print_matrix(mtx):
    for row in mtx:
        print(row)

def matrix_multiply(matrix, vector, m, n):
    mtx3 = [0 for _ in range(m)]
    for i in range(m):
        for j in range(m):
            mtx3[i] += matrix[i][j] * vector[j]
    return mtx3

def bcsr_multiply(bcsr_mtx, vector, m, n):
    # Review the comments
    A1_pos = bcsr_mtx[0][0]         # A1_pos
    A1_block_pos = bcsr_mtx[1][0]   # A1_block_pos
    A2_pos = bcsr_mtx[2]            # A2_pos
    A2_crd = bcsr_mtx[3]            # A2_crd
    A2_block_pos = bcsr_mtx[4][0]   # A2_block_pos
    Aval = bcsr_mtx[5]           # Values of A in BCSR format

    # Create an empty result matrix
    mtx3 = [0 for _ in range(m)]
    
    # Our matrix
    # Consider (note): A1 -> A2 -> A1_tile -> A2_tile
    for n1 in range(A1_pos):
        print(n1)
        for bi in range(A1_block_pos):
            print("  ", bi)
            for n2 in range(A2_pos[n1],A2_pos[n1+1]):
                print("    ", n2)
                for bj in range(A2_block_pos):
                    print("      ", bj)
                    i = n1 * A1_block_pos + bi
                    j = A2_crd[n2] * A2_block_pos + bj
                    index = n2*(A1_block_pos*A2_block_pos) + bi * A2_block_pos + bj
                    
                    print("          i: ", i)
                    print("          j: ", j)
                    print("          index: ", index)
                    print("          A2_crd[", n2, "]: ", A2_crd[n2])
                    
                    mtx3[i] += Aval[index] * vector[j];

    return mtx3

