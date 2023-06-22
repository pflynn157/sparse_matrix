#!/usr/bin/python3

v = [5, 1, 0, 7, 3, 0,
	 0, 0, 0, 8, 0, 0,
	 0, 0, 0, 4, 9, 0]

row_pos = [2]
col_pos = [0, 1, 3]
col_crt = [0, 0, 1]

output = ""
for i in range(row_pos[0]):
	output += str(i) + " (" + str(col_pos[i]) + ", " + str(col_pos[i+1]) + ") ["
	for n in range(col_pos[i], col_pos[i+1]):
		output += str(col_crt[n]) + " "
		for ii in range(2):
			output += "{"
			for jj in range(3):
				output += "(" + str(ii) + ", " + str(jj) + ")["
				output += str(v[ii*2+jj]) + "] "
			output += "} "
	output += "]\n"
print(output)

'''
output = ""
for i in range(2):
	output += "["
	for j in range(3):
		output += str(v[i*2+j]) + " "
	output += "]\n"
print(output)
'''
