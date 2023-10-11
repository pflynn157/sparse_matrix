A = [
	#R  C  V
	(0, 2, 3),
	(1, 3, 1),
	(2, 0, 2),
]

B = [
	#R C V
	(1, 0, 4),
	(1, 2, 7),
	(3, 0, 1),
	(3, 3, 3),
]

A_vec = []
B_vec = []
S_vec = []
P_vec = []

C = [
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
]

for (A_i, A_j, A_v) in A:
	for (B_i, B_j, B_v) in B:
		if A_j == B_j:
			A_vec.append(A_v)
			B_vec.append(B_v)
			S_vec.append(0)
			P_vec.append((A_i, B_i))

for i in range(len(A_vec)):
	S_vec[i] = A_vec[i] * B_vec[i]

print("A: ",A_vec)
print("B: ",B_vec)
print("S: ",S_vec)
print("P: ",P_vec)

index = 0
for (i,j) in P_vec:
	C[i][j] = S_vec[index]
	index += 1

##
## Print
##
print("")
for row in C:
	print(row)

