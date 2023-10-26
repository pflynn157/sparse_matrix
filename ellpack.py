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

ellpack_matrix = [
    [3],        # A1_pos
    [4],        # A1_tile_pos
    [0, 0, 0, 0, 1, 1, 1, 3, 2, 2, 2, 4],   # A2_pos
    [5, 7, 0, 8, 1, 3, 0, 4, 0, 0, 0, 9],   # Aval
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
## ELLPACK matrix multplication
##
print("ELLPACK")
C2 = ellpack_multiply(ellpack_matrix, dense_matrix, m, n)

print_matrix(C2)
print("================================")

