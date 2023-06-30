
FROM python:latest
FROM ubuntu
FROM rocker/r-ver:3.4.4
FROM bioconductor/bioconductor_docker:devel
FROM dqpham/ichorcna

RUN mkdir appfiless
COPY CNV-I.sh /appfiless
COPY CNV-IIT_docker.sh /appfiless
COPY CNV-III-2.sh /appfiless
COPY runIchorCNA.R /appfiless
COPY multiple-process-CNV_docker.nf /appfiless
WORKDIR /appfiless
RUN R -e "install.packages('optparse')"
RUN R -e 'BiocManager::install(ask = F)' && R -e 'BiocManager::install(c("GenomicRanges",  "HMMcopy", ask = F))'
