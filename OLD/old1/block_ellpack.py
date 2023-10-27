#!/usr/bin/python3
import random

N = 10

def create_matrix(make_sparse = True):
	matrix = []
	for _ in range(N*N): matrix.append(0)
	if make_sparse:
		indicies = []
		for _ in range(75):
			idx = random.randrange(N*N)
			indicies.append(idx)
		for idx in indicies:
			matrix[idx] = random.randrange(9)
	return matrix

def print_matrix(matrix, NN = N):
	output = ""
	for i in range(NN):
		output += "["
		for j in range(NN):
			if matrix[i*NN+j] == 0:
				output += "_ "
			else:
				output += str(matrix[i*NN+j]) + " "
				if matrix[i*NN+j] >= 10:
					output += " "
		output += "]\n"
	print(output)

matrix = create_matrix()
print_matrix(matrix)

# Create the ellpack format
# This pretty much just means shifting everything left
ell_matrix = create_matrix(False)

for i in range(N):
	idx = 0
	for j in range(N):
		if matrix[i*N+j] == 0: continue
		ell_matrix[i*N+idx] = matrix[i*N+j]
		idx += 1

print("")
print_matrix(ell_matrix)
print("")

# Now create the blocks
# Block size: 5 x 5
block_size = int(N / 2)
block_count = int(N / block_size)
blocks = list()
for i in range(block_count * block_count):
	zeros = [0] * (block_size * block_size)
	blocks.append(zeros)

#indicies = create_matrix(False)
#idx = 1
#for i in range(0, N, block_size):
#	for j in range(0, N, block_size):
#		for r in range(i, i+block_size):
#			for c in range(j, j+block_size):
#				indicies[r*N+c] = idx
#		idx += 1
#print_matrix(indicies)

idx = 0
for i in range(0, N, block_size):
	for j in range(0, N, block_size):
		for r in range(i, i+block_size):
			for c in range(j, j+block_size):
				print("IDX: ",idx," | R: ",r," | C: ",c)
				#blocks[idx][r*block_size+c] = ell_matrix[r*N+c]
		idx += 1

print("{")
for block in blocks:
	print_matrix(block, block_size)
print("}")
