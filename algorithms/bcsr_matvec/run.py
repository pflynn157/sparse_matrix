from multiply import *

sparse_matrix = [
    [5, 1, 0, 0, 0, 0],
    [7, 3, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [8, 0, 0, 4, 9, 0],
]

vector = [
    1, 1, 1, 1, 1, 1
]

coo_matrix = [
    [0, 7],                 # A1_pos
    [0, 0, 1, 1, 3, 3, 3],  # A1_crd = CU
    [0, 1, 0, 1, 0, 3, 4],  # A2_pos = S
    [5, 1, 7, 3, 8, 4, 9],  # Aval
]

ellpack_matrix = [
    [3],        # A1_pos
    [4],        # A1_tile_pos
    [0, 0, 0, 0, 1, 1, 1, 3, 2, 2, 2, 4],   # A2_pos
    [5, 7, 0, 8, 1, 3, 0, 4, 0, 0, 0, 9],   # Aval
]

csr_matrix = [
    [4],                # A1_pos
    [0, 2, 4, 4, 7],        # A2_pos
    [0, 1, 0, 1, 0, 3, 4],  # A2_crd
    [5, 1, 7, 3, 8, 4, 9],  # Aval
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
## Initial printing
##
m = 4
n = 6

print_matrix(sparse_matrix)
print("---------")
print(vector)

print("================================")

##
## Dense-dense matrix multplication
##
print("Dense-dense")
C1 = matrix_multiply(sparse_matrix, vector, m, n)

print(C1)
print("================================")

##
## BCSR matrix multplication
##
print("BCSR")
C5 = bcsr_multiply(bcsr_matrix, vector, m, n)

print(C5)
print("================================")

