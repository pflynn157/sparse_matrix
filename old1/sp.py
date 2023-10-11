N = 4

def print_matrix(M):
	out = ""
	for i in range(N):
		out += "["
		for j in range(N):
			out += str(M[i][j]) + " "
		out += "]\n"
	print(out)

A = [
	[0, 0, 3, 0],
	[4, 0, 1, 0],
	[1, 0, 0, 5],
	[0, 7, 8, 0]
]

B = [
	[7, 0, 4, 0],
	[9, 0, 0, 0],
	[0, 3, 0, 1],
	[0, 5, 0, 2]
]

C = [
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]
]

print_matrix(A)
print("---")
print_matrix(B)
print("===")

###
### Build COO lists
###
A_coo = [
	(0, 2, 3),
	(1, 0, 4),
	(1, 2, 1),
	(2, 0, 1),
	(2, 3, 5),
	(3, 1, 7),
	(3, 2, 8),
]

B_coo = [
	(0, 0, 7),
	(0, 2, 4),
	(1, 0, 9),
	(2, 1, 3),
	(2, 3, 1),
	(3, 1, 5),
	(3, 3, 2),
]

##
## Calculate
##
# C(i,j) += A(_, j) + B(i, _)
for (i, j, v) in B_coo:
	for coo in A_coo:
		if coo[1] == i:
			C[coo[0]][j] += v * coo[2]

##
## Print
##
print_matrix(C)
