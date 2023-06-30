projectDir="/Nextflow_develop"
file=${projectDir}/sample-list-dummy.txt
array=($(<"$file"))
len=${#array[@]}

for ((i=0; i<1;i+=1))
do
	gcCounter --window 1000000 --chromosome "chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY" ${projectDir}/hg19.fasta > gc.wig
done

for ((i=0; i<${#array[@]};i+=1))
do
		str1=$(cut -d $'/' -f2 <<< ${array[$i]})
		readCounter --window 1000000 --quality 20 --chromosome "chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY" ${projectDir}/$str1\.bam > ${str1}\.wig
done
