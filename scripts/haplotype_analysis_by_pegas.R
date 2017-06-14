#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(ape))
suppressPackageStartupMessages(library(pegas))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(magrittr))
suppressPackageStartupMessages(library(stringr))
Args<- commandArgs(trailingOnly = TRUE)
input<-Args[1]

#input="/Users/sunlinhua/Downloads/little_test.fas"
## Import fas sequence ----

fas_ID<-read.table(input,header = F)[c(T, F),] %>% str_replace_all(">","")
fas_Seq<-read.table(input,header = F)[c(F, T),] %>% str_replace_all(">","")
fas<-as.data.table(cbind(fas_ID,fas_Seq))

## Haplotype analysis by Pegas ----
h <- pegas::haplotype(ape::read.dna(input, format='fasta'))
d <- ape::read.dna(input, format='fasta')
mydf<-data.frame(matrix(NA, nrow = length(attr(h, "index")), ncol = 4))

for (i in 1:length(attr(h, "index"))) {
  mydf[i,1]<-attr(h, "dimnames")[[1]][i]
  mydf[i,2]<-as.character(fas[fas_ID %in% dimnames(d)[[1]][attr(h, "index")[[i]]][1]][,2])
  mydf[i,3]<-length(fas[fas_ID %in% dimnames(d)[[1]][attr(h, "index")[[i]]] ]$fas_Seq)
  mydf[i,4]<-paste(dimnames(d)[[1]][attr(h, "index")[[i]]],collapse = ",")
}

colnames(mydf)<-c("Haplo_ID","Haplo_Seq","Haplo_Num","Haplo_Samples")
write.csv(mydf,paste(str_replace(basename(input),".fas",""),"_haplotype.csv",sep=""),row.names = F)

## Single haplotype check ----
## h
## print(attr(h, "dimnames")[[1]][3])
## print(dimnames(d)[[1]][attr(h, "index")[[3]]])
## print(as.character(fas[fas_ID %in% dimnames(d)[[1]][attr(h, "index")[[3]]][1]][,2]))
## cat(fas[fas_ID %in% dimnames(d)[[1]][attr(h, "index")[[3]]] ]$fas_Seq,sep = "\n")
## fas[fas_ID %in% dimnames(d)[[1]][attr(h, "index")[[1]]] ]$fas_Seq %>% sort %>% unique()