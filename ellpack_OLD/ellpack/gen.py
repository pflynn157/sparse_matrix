#!/usr/bin/python3

# Generate 1024 x 1024 matrix
# 3 columns * 1024 = 3072

x = 10
y = 3
vals = x * y

writer = open("square.mtx", "w")
writer.write("%%MatrixMarket matrix coordinate real general\n")
writer.write("%\n")
writer.write("%\n")
writer.write("10 10 " + str(vals) + "\n")
for i in range(x):
    #writer.write(str(i+1) + " 10\n")
    for j in range(y):
        writer.write(str(i+1) + " " + str(j+1) + " " + str(i+j) + "\n")
writer.close()

