#!/usr/bin/python3

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
                    
                    print(f"n1 * A1_block_pos + bi = {n1}*{A1_block_pos}+{bi} = {i}")
                    print(f"A2_crd[n2] * A2_block_pos + bj = {A2_crd[n2]}*{A2_block_pos}+{bj} = {j}")
                    print(f"n2*(A1_block_pos*A2_block_pos) + bi * A2_block_pos + bj = {n2}*{(A1_block_pos*A2_block_pos)}+{bi}*{A2_block_pos}+{bj} = {index}")
                    
                    #print(f"I: {i} | J: {j} | Value: {index}")
                    
                    for k in range(m):
                        mtx3[i][k] += Aval[index] * dense_mtx[j][k]
                    print("---")
                print("------")

    return mtx3
    
# BCSR matrix
m = 4
n = 6

dense_matrix = [
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
]

bcsr_matrix = [
    [2],        # A1_pos
    [2],        # A1_block_pos
    [0, 1, 3],  # A2_pos
    [0, 0, 1],  # A2_crd
    [3],        # A2_block_pos
    [5, 1, 0, 7, 3, 0,      # Aval
     0, 0, 0, 8, 0, 0,
     0, 0, 0, 4, 9, 0,]
]

##
## BCSR matrix multplication
##
print("BCSR")
mtx = bcsr_multiply(bcsr_matrix, dense_matrix, m, n)

for row in mtx:
    print(row)
print("================================")


