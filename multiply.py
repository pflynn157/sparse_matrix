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
        #print("Range: " + str(A2_pos[i]) + ", " + str(A2_pos[i+1]))
        for p in range(A2_pos[i], A2_pos[i + 1]):
            j = A2_crd[p]
            #print("--> " + str(j))
            for k in range(m):
                #print(f"i: {i}, j: {j}, k: {k}, val: {Aval[p]}")
                mtx3[i][k] += Aval[p] * dense_mtx[j][k]
            #print("---")
    return mtx3

def bcsr_multiply(bcsr_mtx, dense_mtx, m, n):
    A1_pos = bcsr_mtx[0][0]      # Rows -> A1_pos
    A1_tile_pos = bcsr_mtx[1]    # Col idx ptr -> A1_tile_pos
    A1_tile_crd = bcsr_mtx[2]    # Column idxs -> A1_tile_crd
    A2_pos = bcsr_mtx[3][0]      # Block row count -> A2_pos
    A2_tile_pos = bcsr_mtx[4][0] # Block col count -> A2_tile_pos
    Aval = bcsr_mtx[5]           # Values of A in BCSR format

    # Create an empty result matrix
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]
    
    # Our matrix
    val_idx = 0
    for n1 in range(A1_pos):
        for n2 in range(A1_tile_pos[n1], A1_tile_pos[n1 + 1]):
            bi = A1_tile_pos[n1]
            bj = A1_tile_crd[n2] * A2_tile_pos
            
            print(f"bi, bj: ({bi}, {bj})")
            
            for row in range(A2_pos):
                for col in range(A2_tile_pos):
                    i = row + bi
                    j = col + bj
                    print(f"-- i, j: ({i}, {j}) = {Aval[val_idx]}")
                    for k in range(m):
                        mtx3[i][k] += Aval[val_idx] * dense_mtx[j][k]
                    val_idx += 1
            
            print("")

    return mtx3

