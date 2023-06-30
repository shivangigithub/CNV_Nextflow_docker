nextflow.enable.dsl=2
input1="/Nextflow_develop/sample-list-dummy.txt"
projectDir="/Nextflow_develop"

process CNV {
    output:
    path '*.wig'
    script:
    """
	bash CNV-I.sh
    """
}

process CNV_II {
   input:
    file x
   output:
    path 'ID-*'
    """
    bash CNV-IIT_docker.sh
    """
}

process CNV_III {
    input:
    file x
    output:
    path 'Mapping_*'
    """
    python3 CNV-III-2.py
    """
}


workflow {
    files = Channel.fromPath ("/Nextflow_develop/sample-list-dummy.txt")
    CNV | CNV_II | CNV_III
}
