#!/usr/bin/env Rscript

library(magrittr)
library(stringr)
library(data.table)
Args<- commandArgs(trailingOnly = TRUE)

input<-Args[1]

fas_ID<-read.table(input,header = F)[c(T, F),] %>% str_replace_all(">","")
fas_Seq<-read.table(input,header = F)[c(F, T),] %>% str_replace_all(">","")
fas<-as.data.table(cbind(fas_ID,fas_Seq))

fas$fas_Seq %>% sort %>% unique() -> haps

mydf<-data.frame(matrix(NA, nrow = length(haps), ncol = 3))

j=1
for (i in haps) {
    mydf[j,1]<-i
    mydf[j,2]<-length(fas[fas_Seq==i]$fas_ID)
    mydf[j,3]<-paste(fas[fas_Seq==i]$fas_ID,collapse = ",")
    j<-j+1
}

colnames(mydf)<-c("Haplo_Seq","Haplo_Num","Haplo_Samples")
mydf<-as.data.table(mydf)
write.csv(mydf[order(Haplo_Num,decreasing = T)],paste(str_replace(basename(input),".fas",""),"_haplotype.csv",sep=""),row.names = F)