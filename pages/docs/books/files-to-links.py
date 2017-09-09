import os
from os.path import isfile, join


mypath = os.getcwd()
onlyfiles = [f for f in os.listdir(mypath) if isfile(join(mypath, f))]


print(len(onlyfiles))

for aa in range(len(onlyfiles)):
	temp = "- [" + onlyfiles[aa] + "](https://github.com/Avkash/mldl/tree/master/pages/docs/books/" + onlyfiles[aa] + ")"
	print(temp)