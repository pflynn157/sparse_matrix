#!/usr/bin/python3
import random

N = 10

def create_matrix(make_sparse = True):
	matrix = []
	for _ in range(N*N): matrix.append(0)
	if make_sparse:
		indicies = []
		for _ in range(35):
			idx = random.randrange(N*N)
			indicies.append(idx)
		for idx in indicies:
			matrix[idx] = random.randrange(9)
	return matrix

def print_matrix(matrix):
	output = ""
	for i in range(N):
		output += "["
		for j in range(N):
			if matrix[i*N+j] == 0:
				output += "_ "
			else:
				output += str(matrix[i*N+j]) + " "
				if matrix[i*N+j] >= 10:
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
