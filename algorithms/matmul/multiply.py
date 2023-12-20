def print_matrix(mtx):
    for row in mtx:
        print(row)

def matrix_multiply(mtx1, mtx2, m, n):
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]
    for i in range(m):
        for j in range(m):
            mtx3[i][j] = 0
            for k in range(n):
                #print(f"i, j, k: ({i}, {j}, {k})")
                mtx3[i][j] += mtx1[i][k] * mtx2[k][j]
            #print("")
    return mtx3
    
def csr_multiply(csr_mtx, dense_mtx, m, n):
    A1_pos = csr_mtx[0][0]
    A2_pos = csr_mtx[1]
    A2_crd = csr_mtx[2]
    Aval = csr_mtx[3]
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]

    for i in range(A1_pos):
        for p in range(A2_pos[i], A2_pos[i + 1]):
            j = A2_crd[p]
            for k in range(m):
                mtx3[i][k] += Aval[p] * dense_mtx[j][k]
            
    return mtx3
    
def coo_multiply(coo_mtx, dense_mtx, m, n):
    A1_pos1 = coo_mtx[0][0]     # Range1
    A1_pos2 = coo_mtx[0][1]     # Range2
    A1_crd = coo_mtx[1]         # i
    A2_crd = coo_mtx[2]         # j
    Aval = coo_mtx[3]
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]

    for n in range(A1_pos1, A1_pos2):
        i = A1_crd[n]
        j = A2_crd[n]
        for k in range(m):
            mtx3[i][k] += Aval[n] * dense_mtx[j][k]
            
    return mtx3

def ellpack_multiply(ellpack_mtx, dense_mtx, m, n):
    A1_pos = ellpack_mtx[1][0]          # Columns [3]
    A1_tile_pos = ellpack_mtx[0][0]     # Rows    [4]
    A2_crd = ellpack_mtx[2]             # Singleton- col idx
    Aval = ellpack_mtx[3]
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]
    
    ##
    ## The idea behind this is when we have a Dense-Dense attribute,
    ## we generate code and incidies like this
    ##
    ## This generalizes for COO;
    ##
    '''
    for n1 in range(A1_pos):
        for n2 in range(A1_tile_pos):
            n = n1 * A1_tile_pos + n2
            i = n2
            j = A2_crd[n]
    
            for k in range(m):
                mtx3[i][k] += Aval[n] * dense_mtx[j][k]
    '''
    # A1 - Only dense
    print("A1_pos: ", A1_pos, " | A1_tile_pos: ", A1_tile_pos)
    print(A1_pos)
    print(A2_crd)
    print(A1_tile_pos)
    print(Aval)
    
    for i in range(A1_pos):
        # A2- D
        # A2_tile- S
        for n1 in range(A1_tile_pos):
            n = n1 * A1_pos + i
            j = A2_crd[n]
    
            for k in range(m):
                mtx3[i][k] += Aval[n] * dense_mtx[j][k]
            
    return mtx3

def bcsr_multiply(bcsr_mtx, dense_mtx, m, n):
    # Review the comments
    A1_pos = bcsr_mtx[0][0]         # A1_pos
    A1_block_pos = bcsr_mtx[1][0]   # A1_block_pos
    A2_pos = bcsr_mtx[2]            # A2_pos
    A2_crd = bcsr_mtx[3]            # A2_crd
    A2_block_pos = bcsr_mtx[4][0]   # A2_block_pos
    Aval = bcsr_mtx[5]           # Values of A in BCSR format

    # Create an empty result matrix
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]
    
    # Our matrix
    # Consider (note): A1 -> A2 -> A1_tile -> A2_tile
    for n1 in range(A1_pos):
        for bi in range(A1_block_pos):
            for n2 in range(A2_pos[n1],A2_pos[n1+1]):
                for bj in range(A2_block_pos):
                    i = n1 * A1_block_pos + bi
                    j = A2_crd[n2] * A2_block_pos + bj
                    index = n2*(A1_block_pos*A2_block_pos) + bi * A2_block_pos + bj
                    
                    #print(f"I: {i} | J: {j} | Value: {index}")
                    
                    for k in range(m):
                        mtx3[i][k] += Aval[index] * dense_mtx[j][k];
                #print("---")

    return mtx3

