from sys import argv
from re import search

if len(argv) != 4:
	print(f"Usage: {argv[0]} left right output")
	exit(1)

with open(argv[1], "r") as left:
	left_lines = left.readlines()

with open(argv[2], "r") as right:
	right_lines = right.readlines()

output_lines = []
for line in left_lines:
	if "define" in line or "declare" in line:
		name = search(r"@([^(]+)", line).group()
		print(name)
		output_lines.append([l for l in right_lines if search(f"(define|declare).+{name}\\(", l)][0])
	else:
		output_lines.append(line)

with open(argv[3], "w") as output:
	output.writelines(output_lines)