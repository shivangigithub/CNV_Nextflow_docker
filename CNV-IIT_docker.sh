projectDir="/Nextflow_develop"
file=${projectDir}/sample-list-dummy.txt
array=($(<"$file"))
len=${#array[@]}
for ((i=0; i<${#array[@]};i+=2))
do
	str1=$(cut -d $'/' -f1 <<< ${array[$i]})
	str2=$(cut -d $'/' -f2 <<< ${array[$i+1]})
	str3=$(cut -d $'/' -f2 <<< ${array[$i]})
	
	Rscript runIchorCNA.R --id $str1 --WIG ${projectDir}/$str2.wig --NORMWIG=${projectDir}/$str3.wig --ploidy "2" --maxCN 5 --gcWig ${projectDir}/gc.wig
done
