#!/usr/bin/python3

coo = list()

with open("taco.mtx", "r") as f:
    for line in f.readlines():
        entries = line.split()
        coo.append((int(entries[0]), int(entries[1]), int(entries[2])))

print(coo)

##
## Generate an ellpack format
##
def generate_ellpack(coo):
    size = coo[0]
    coo = coo[1:]  
    
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
    
    # Step 2: Pad the rows which need extra values
    coo2 = list()
    current_cols = list()   # Holds existing column indicies
    
    current = coo[0][0]
    current_len = 1
    for i in range(1, len(coo)):
        if coo[i][0] != current:
            if current_len < num_cols:
                for j in range(0, size[1]):
                    if j not in current_cols:
                        coo2.append((current, j, 0))
                        current_len += 1
                    if current_len >= num_cols:
                        break
                
            current = coo[i][0]
            current_len = 1
            current_cols.clear()
            current_cols.append(coo[i][1])
            coo2.append(coo[1])
        else:
            current_len += 1
            current_cols.append(coo[i][1])
            coo2.append(coo[i])
    
    print(coo2)

## Run the generator
generate_ellpack(coo)

