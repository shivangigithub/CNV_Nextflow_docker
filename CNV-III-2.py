import glob
import os
import subprocess
import re

f1 = open("/Nextflow_develop/sample-list-dummy.txt","r").read().split("\n")
List = f1
idarray=[]

for line in List:
	ids = line.split("/")
	if ids[0] not in idarray:
            idarray.append(ids[0])

print (idarray)

for file in (idarray):
	cna_file = file+".cna.seg"
	cna_file_2 = "Mapping_"+cna_file
	f1 = open(cna_file,"r").read().split("\n")
	f2 = open(cna_file_2,"w")
	list1=f1
	for line1 in list1:
		if line1.startswith("chr"):
			f2.write(line1)
			f2.write("\n")
			print ("chrrr")
		else:
			words = "chr"+line1
			f2.write(words)
			f2.write("\n")
	f2.close()
