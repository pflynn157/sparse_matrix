from multiply import *

sparse_matrix = [
    [1, 2, 0, 0, 0, 0, 0, 0],
    [0, 0, 3, 4, 0, 0, 0, 0],
    [0, 0, 0, 0, 5, 0, 7, 0],
    [0, 0, 0, 0, 0, 6, 0, 8],
    [9, 10, 0, 0, 0, 0, 12, 0],
    [11, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 13, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
]

dense_matrix = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
]

#csr_matrix = [
#    [4],                # A1_pos
#    [0, 2, 4, 4, 7],        # A2_pos
#    [0, 1, 0, 1, 0, 3, 4],  # A2_crd
#    [5, 1, 7, 3, 8, 4, 9],  # Aval
#]

bcsr_matrix = [
    [4],                        # A1_pos
    [0, 2, 4, 6, 7],            # A1_tile_pos
    #[0, 1, 2, 3, 4],
    [0, 1, 2, 3, 0, 3, 1],      # A1_tile_crd
    [2],                        # A2_pos
    [2],                        # A2_tile_pos
    [
        1, 2, 0, 0,
        0, 0, 3, 4,
        5, 0, 6, 0,
        7, 0, 8, 0,
        9, 10, 11, 0,
        12, 0, 0, 0,
        13, 0, 0, 0,
    ]
]

##
## Initial printing
##
m = 8
n = 8

print_matrix(sparse_matrix)
print("---------")
print_matrix(dense_matrix)

print("================================")

##
## Dense-dense matrix multplication
##
C1 = matrix_multiply(sparse_matrix, dense_matrix, m, n)

print_matrix(C1)
print("================================")

##
## CSR matrix multplication
##
#C2 = csr_multiply(csr_matrix, dense_matrix, m, n)
#
#print_matrix(C2)
#print("================================")

##
## BCSR matrix multplication
##
C3 = bcsr_multiply2(bcsr_matrix, dense_matrix, m, n)

print_matrix(C3)
print("================================")

##
## BCSR matrix multplication (second variation)
##
C4 = bcsr_multiply(bcsr_matrix, dense_matrix, m, n)

print_matrix(C4)
print("================================")

