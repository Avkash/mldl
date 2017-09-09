import os
from os.path import isfile, join


mypath = os.getcwd()
onlyfiles = [f for f in os.listdir(mypath) if isfile(join(mypath, f))]


print(len(onlyfiles))

for aa in range(len(onlyfiles)):
	if ' ' in onlyfiles[aa]:
		file_string = onlyfiles[aa].replace(" ", "_")
	else:
		file_string = onlyfiles[aa]
	temp = "- [" + file_string + "](https://github.com/Avkash/mldl/tree/master/pages/docs/industry/" + file_string + ")"
	print(temp)
