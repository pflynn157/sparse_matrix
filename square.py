from multiply import *

sparse_matrix = [
    [1, 0, 0, 2, 0],
    [0, 3, 0, 0, 4],
    [0, 0, 5, 0, 0],
    [6, 0, 7, 0, 0],
    [0, 8, 0, 0, 9],
]

dense_matrix = [
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
]

csr_matrix = [
    [5],        # A1_pos Dense- number of rows
    [0, 2, 4, 5, 7, 9],             # A2_pos
    [0, 3, 1, 4, 2, 0, 2, 1, 4],    # A2_crd
    [1, 2, 3, 4, 5, 6, 7, 8, 9],    # A_val
]

##
## Initial printing
##
m = 5
n = 5

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
C2 = csr_multiply(csr_matrix, dense_matrix, m, n)

print_matrix(C2)
print("================================")

