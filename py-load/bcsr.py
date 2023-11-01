#!/usr/bin/python3
import random

##
## The algorithm
##
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
                    
                    for k in range(m):
                        mtx3[i][k] += Aval[index] * dense_mtx[j][k]

    return mtx3

##
## Our script for loading
##
def load_to_coo(input_file):
    coo = list()
    with open(input_file, "r") as f:
        for line in f.readlines():
            entries = line.split()
            coo.append((int(entries[0]), int(entries[1]), int(entries[2])))
    size = coo[0]
    coo = coo[1:]
    coo = sorted(coo, key=lambda x: (x[0], x[1]))
    coo = [size] + coo
    return coo

def has_values(i, mi, j, mj, coo):
    for bi in range(i, mi):
        for bj in range(j, mj):
            
            for coord in coo:
                if coord[0] == bi and coord[1] == bj:
                    return True
    return False

def generate_bcsr(coo):
    size = coo[0]
    rows = size[0]
    cols = size[1]
    coo = coo[1:]
    #print(coo)
    
    A2pos_nc = list()
    A2crd = list()
    Aval = list()
    
    # Step 1: Determine block size
    # TODO: Let us think about this. For now, quick solution
    block_rows = int(rows / 100)
    block_cols = int(cols / 100)
    print("Block_rows: ", block_rows, " | Block_cols: ", block_cols)
    
    # Step 2: Examine the blocks
    # We only want the blocks with values
    #
    # From here, we can start building the A2 dimension
    #
    for i in range(0, rows, block_rows):
        for j in range(0, cols, block_cols):
            # Note: for A2_crd, corresponds to j, divide by "block_cols"
            # to get the block position
            
            # Check the block and see if it has values
            # If so, we use it
            if has_values(i, i+block_rows, j, j+block_cols, coo):
                A2pos_nc.append(int(i/block_rows))
                A2crd.append(int(j/block_cols))
                
                # Add all the values including the padded zeros
                #
                # To do this, we first search the COO array for a non-zero
                # value. If there is no such value, then we add the current
                # index with a zero.
                #
                for bi in range(i, i+block_rows):
                    for bj in range(j, j+block_cols):
                        found = False
                        for coord in coo:
                            if coord[0] == bi and coord[1] == bj:
                                Aval.append(coord[2])
                                found = True
                                break
                        if not found:
                            Aval.append(0)
    
    # Compress the row coordinates
    A2pos = [0]
    
    current = A2pos_nc[0]
    current_end = 1
    for i in range(1, len(A2pos_nc)):
        if A2pos_nc[i] != current:
            A2pos.append(current_end)
            current = A2pos_nc[i]
        current_end += 1
    A2pos.append(current_end)
    
    A1pos = len(A2pos) - 1
        
    # Print the final
    print("A1pos: ", A1pos)
    print("A1_tile_pos: ", block_rows)
    print("A2pos: ", A2pos)
    print("A2crd: ", A2crd)
    print("A2_tile_pos: ", block_cols)
    #print("Aval: ", Aval)
    
    return [
        [A1pos],             # A1_pos
        [block_rows],        # A1_block_pos
        A2pos,               # A2_pos
        A2crd,               # A2_crd
        [block_cols],        # A2_block_pos
        Aval                 # Aval
    ]
    
###
### Test portion of the program
###
def matrix_multiply(mtx1, mtx2, m, n):
    mtx3 = [[0 for _ in range(m)] for _ in range(n)]
    for i in range(m):
        for j in range(m):
            mtx3[i][j] = 0
            for k in range(n):
                mtx3[i][j] += mtx1[i][k] * mtx2[k][j]
    return mtx3

def generate_dense(m, n):
    return [[1 for _ in range(m)] for _ in range(n)]

def generate_sparse(coo, m, n):
    coo = coo[1:]
    mtx = [[0 for _ in range(n)] for _ in range(m)]
    for coord in coo:
        mtx[coord[0]][coord[1]] = coord[2]
    return mtx
    
def check(mtx1, mtx2, m, n):
    wrong = 0
    for i in range(m):
        for j in range(n):
            if mtx1[i][j] != mtx2[i][j]:
                wrong += 1
    return wrong

def generate_matrix(m, n):
    coo = [(m, n, 0)]
    density = 0.1
    for i in range(m):
        for j in range(n):
            if random.random() < density:
                value = random.randint(1, 9)
                coo.append((i, j, value))
    
    return coo
   
##
## Test 1
##
def run_test(coo, m, n):
    bcsr_matrix = generate_bcsr(coo)

    dense_matrix = generate_dense(m, n)
    sparse_matrix = generate_sparse(coo, m, n)
    
    mtx_serial = matrix_multiply(sparse_matrix, dense_matrix, m, n)
    mtx_test = bcsr_multiply(bcsr_matrix, dense_matrix, m, n)
    
    print(check(mtx_serial, mtx_test, n, m))

def test1():
    m = 4
    n = 6
    coo = load_to_coo("taco.mtx")
    run_test(coo, m, n)

def test2(n):
    coo = generate_matrix(n, n)
    run_test(coo, n, n)
    

#test1()
test2(500)

