
args = commandArgs(trailingOnly=TRUE)
library(GenomicRanges)
library(Homo.sapiens)
#df = read.csv("CNV-analysis/mapping/P.cna.seg", sep = "\t")
#df
df = read.csv(args[1], header=TRUE, sep = "\t")
cnv = makeGRangesFromDataFrame(df)
cnv
###CAution: run {} [line: 12-20 and line: 25-32] together in one selection; otherwise it will not be stored
geneRanges <- 
  function(db, column="ENTREZID")
  {
    g <- genes(db, columns=column)
    col <- mcols(g)[[column]]
    genes <- granges(g)[rep(seq_along(g), elementNROWS(col))]
    mcols(genes)[[column]] <- as.character(unlist(col))
    genes
  }

gns = geneRanges(Homo.sapiens, column="SYMBOL")
gns

splitColumnByOverlap <-
  function(query, subject, column="ENTREZID", ...)
  {
    olaps <- findOverlaps(query, subject, ...)
    f1 <- factor(subjectHits(olaps),
                 levels=seq_len(subjectLength(olaps)))
    splitAsList(mcols(query)[[column]][queryHits(olaps)], f1)
  }

symInCnv = splitColumnByOverlap(gns, cnv, "SYMBOL")
out <- unstrsplit(symInCnv, sep="; ")
x <- list(df, col2 = out)
write.csv (x,file=args[2],row.names=FALSE)  ###comma separated file