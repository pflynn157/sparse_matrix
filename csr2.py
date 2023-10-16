from multiply import *

sparse_matrix = [
    [5, 1, 0, 0, 0, 0],
    [7, 3, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [8, 0, 0, 4, 9, 0],
]

dense_matrix = [
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
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
    [2],        # A1_pos (Dense- size)
    [0, 1, 3],  # A1_tile_pos (ptr)
    [0, 0, 1],  # A1_tile_crd (idx)
    [2],        # A2_pos      (block rows)
    [3],        # A2_tile_pos (block cols)
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
print_matrix(dense_matrix)

print("================================")

##
## Dense-dense matrix multplication
##
print("Dense-dense")
C1 = matrix_multiply(sparse_matrix, dense_matrix, m, n)

print_matrix(C1)
print("================================")

##
## BCSR matrix multplication
##
print("BCSR")
C2 = bcsr_multiply(bcsr_matrix, dense_matrix, m, n)

print_matrix(C2)
print("================================")

##
## BCSR2 matrix multplication
##
print("CSR2")
C3 = csr_multiply2(csr_matrix, dense_matrix, m, n)

print_matrix(C3)
print("================================")

##
## BCSR matrix multplication
##
#print("BCSR_CSR")
#C3 = bcsr_multiply(csr2_matrix, dense_matrix, m, n)
#
#print_matrix(C3)
#print("================================")

