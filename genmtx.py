#!/usr/bin/python
from random import randrange

##
## Calculate needed parameters
##
row_count = 2048
col_count = 2048
d = 6

max_items = int((row_count * col_count) / d)
print((max_items / (row_count * col_count)) * 100)

##
## Setup COO and fill it
##
rows = [0 for _ in range(max_items)]
cols = [0 for _ in range(max_items)]
vals = [float(randrange(10)) for _ in range(max_items)]

for i in range(0, max_items):
    while True:
        good = True
        r = randrange(row_count)
        c = randrange(col_count)
        for j in range(0, i):
            if rows[j] == r and cols[j] == c:
                good = False
                break
        
        if good:
            rows[i] = r
            cols[i] = c
            break

##
## Sort
##
while True:
    swapped = False
    for i in range(1, max_items):
        if rows[i] < rows[i-1]:
            t1 = rows[i-1]
            rows[i-1] = rows[i]
            rows[i] = t1
            
            t2 = cols[i-1]
            cols[i-1] = cols[i]
            cols[i] = t2
            
            swapped = True
    if not swapped:
        break

##
## Write to the file
##
writer = open("test_bench.mtx", "w")
writer.write("%%MatrixMarket matrix coordinate real general\n")
writer.write("%\n")
writer.write("% This is a test sparse matrix in Matrix Market Exchange Format.\n")
writer.write("% see https://math.nist.gov/MatrixMarket\n")
writer.write("%\n")
writer.write(str(row_count) + " " + str(col_count) + " " + str(len(vals)) + "\n")
for i in range(0, max_items):
    writer.write(str(rows[i] + 1) + " " + str(cols[i] + 1) + " " + str(vals[i]) + "\n")

##
## Debug
##
#print(rows)
#print(cols)
#print(vals)

