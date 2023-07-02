import glob
import os
import subprocess
import re

f1 = open("/Nextflow_develop/sample-list-dummy.txt","r").read().split("\n")

List = f1
idarray=[]

for line in List:
	#print (line)
	ids = line.split("/")
	#print (ids[0])
	if ids[0] not in idarray:
            idarray.append(ids[0])

print (idarray)

for file in (idarray):
	cna_file = file+".cna.seg"
	#result = os.popen("sed s|'\(\n)'|\'\nchr'|" + cna_file)
	#result = os.popen("cut -f1 "+ cna_file)
	#result=result.read()
	#print (result)
	cna_file_2 = "Mapping_"+cna_file
	cna_file_3 = "Mapped_"+cna_file
	# cna_file_4 = "remove-mir_" + "Mapped_"+cna_file

	res=subprocess.call("Rscript symbols.R "  + cna_file_2 + " " + cna_file_3, shell=True)

	
	
	
	


