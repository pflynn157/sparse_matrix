#!/usr/bin/python3

coo = list()

with open("taco.mtx", "r") as f:
    for line in f.readlines():
        entries = line.split()
        coo.append((int(entries[0]), int(entries[1]), int(entries[2])))

##
## Generates valid column coordinates for padding
##
def generate_pad_cols(used_cols, col_max):
    cols = list()
    for i in range(col_max):
        cols.append(i)
    for u in used_cols:
        cols[u] = -1
    return cols

##
## Generate an ellpack format
##
def generate_ellpack(coo):
    size = coo[0]
    coo = coo[1:]
    print(coo)
    
    num_rows = size[0]
    num_cols = 0
    colidx = list()
    
    # Step 1: Figure out number of columns
    # Look at the rows, and figure out which row
    # has the most values.
    current = coo[0][0]
    current_len = 1
    max_len = 1
    
    for i in range(1, len(coo)):
        if coo[i][0] != current:
            current = coo[i][0]
            if current_len > max_len:
                max_len = current_len
            current_len = 1
        else:
            current_len += 1
    if current_len > max_len:
        max_len = current_len
    
    num_cols = max_len
    print("Num_cols: ", num_cols)
    
    # Step 2: Pad the rows which need extra values
    coo2 = list()
    current_cols = list()   # Holds existing column indicies
    
    current = coo[0][0]
    current_len = 1
    coo2.append(coo[0])
    
    # Go through and pad it
    for i in range(1, len(coo)):
        if coo[i][0] != current:
            print(f"Len for {current}: {current_len}")
            if current_len < num_cols:
                usable_cols = generate_pad_cols(current_cols, size[1])
                c_idx = 0
                while current_len < num_cols:
                    c = usable_cols[c_idx]
                    c_idx += 1
                    while c == -1:
                        c = usable_cols[c_idx]
                        c_idx += 1
                    coo2.append((current, c, 0))
                    current_len += 1
            
            current = coo[i][0]
            current_len = 1
            current_cols.clear()
        else:
            current_len += 1
        current_cols.append(coo[i][1])
        coo2.append(coo[i])
    
    # Check the final value
    if current_len < num_cols:
        usable_cols = generate_pad_cols(current_cols, size[1])
        c_idx = 0
        while current_len < num_cols:
            c = usable_cols[c_idx]
            c_idx += 1
            while c == -1:
                c = usable_cols[c_idx]
                c_idx += 1
            coo2.append((current, c, 0))
            current_len += 1
    
    # TODO: We need some kind of sorting still
    
    print(coo2)

##
## Generates a BCSR matrix and loads its
##
def generate_bcsr(coo):
    size = coo[0]
    rows = size[0]
    cols = size[1]
    coo = coo[1:]
    print(coo)
    
    coo2 = list()
    
    # Step 1: Determine block size
    # TODO: Let us think about this. For now, quick solution
    block_rows = int(rows / 2)
    block_cols = int(cols / 2)
    print("Block_rows: ", block_rows, " | Block_cols: ", block_cols)
    
    # Step 2: Examine the blocks
    # We only want the blocks with values
    #
    # From here, we can start building the A2 dimension
    #
    for i in range(0, rows, block_rows):
        for j in range(0, cols, block_cols):
        
            for bi in range(i, i+block_rows):
                print("-bi: ", bi)
            
            #for j in range(0, cols, block_cols):
                for bj in range(j, j+block_cols):
                    print("bj: ", bj)
                print("--")
            
        # Check and see if this area needs padding
        
        
            print("----")
        
    # Print the final
    print(coo2)

## Run the generator
#generate_ellpack(coo)
generate_bcsr(coo)

