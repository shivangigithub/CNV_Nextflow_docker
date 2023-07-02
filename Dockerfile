FROM dqpham/ichorcna

RUN mkdir appfiless
COPY my-env.yaml /appfiless
COPY CNV-IIT_docker.sh /appfiless
COPY runIchorCNA.R /appfiless
COPY multiple-process-CNV_docker.nf /appfiless
WORKDIR /appfiless
RUN R -e "install.packages('optparse')"
RUN R -e 'BiocManager::install(ask = F)' && R -e 'BiocManager::install(c("GenomicRanges",  "HMMcopy", ask = F))'

FROM python:latest
COPY CNV-III-2.py /appfiless
COPY CNV-IV.py /appfiless
CMD ["python3", "CNV-III-2.py"]
CMD ["python3", "CNV-IV.py"]

FROM rocker/r-ver:3.4.4
COPY symbols.R /appfiless
CMD ["Rscript", "symbols.R"]