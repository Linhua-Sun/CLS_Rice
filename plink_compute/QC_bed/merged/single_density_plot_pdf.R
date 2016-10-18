#!/usr/bin/env Rscript

Args<- commandArgs(trailingOnly = TRUE)
input<-Args[1]
terms<-Args[2]

library(data.table)
library(ggpubr)
library(crayon)

t1<-fread(input,header = T)

colnames(t1)
print(head(t1))

p<-ggdensity(t1, x =terms,
             add = "mean",
             palette ="npg" ,rug = T)
ggsave(filename = paste(basename(input),".pdf",sep = ""),plot = p,device = "pdf")

cat(yellow("ggdensity is finished"))
