#!/usr/bin/python3
import random

# Generate 1024 x 1024 matrix
# 3 columns * 1024 = 3072

rows = 10
cols = 10

vals = 3
make_dense = False

data = list()

# Makes a fully dense matrix
if make_dense:
    vals = rows * cols
    for r in range(rows):
        for c in range(cols):
            v = float(random.uniform(0.1, 10.0))
            s = '{:.1f}'.format(v)
            line = str(r + 1) + " " + str(c + 1) + " " + str(s)
            data.append(line)

# Make a sparse ellpack matrix with a defined number of columns
else:
    ell_cols = vals
    vals = rows * ell_cols
    for r in range(rows):
        local_cols = list()
        for c in range(ell_cols):
            col = random.randint(1, cols)
            local_cols.append(col)
        local_cols.sort()
        for col in local_cols:
            v = float(random.uniform(0.1, 10.0))
            s = '{:.1f}'.format(v)
            line = str(r + 1) + " " + str(col) + " " + str(s)
            data.append(line)

writer = open("square.mtx", "w")
writer.write("%%MatrixMarket matrix coordinate real general\n")
writer.write("%\n")
writer.write("%\n")
writer.write(str(rows) + " " + str(cols) + " " + str(vals) + "\n")
for ln in data:
    writer.write(ln)
    writer.write("\n")
writer.close()

