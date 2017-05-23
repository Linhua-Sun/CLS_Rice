#!/usr/bin/env Rscript
## library packages and define several fucntions ----
## CX_report.txt ====>>>> BIGWIG
suppressPackageStartupMessages(library(BSgenome.Athaliana.TAIR.TAIR9))
suppressPackageStartupMessages(library(GenomicRanges))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(crayon))
Args<-commandArgs(trailingOnly = T)

cat(yellow("### Start import CX_report.txt!"),sep = "\n")
CX<-fread(Args[1])
colnames(CX)<-c("seqnames","start","strand","M","UM","context","tricontext")
CX<-CX[!(seqnames %in% c("ChrC","ChrM"))][order(seqnames)]
CX$direction<-0
CX[strand=="+"]$direction<-1
CX[strand=="-"]$direction<-(-1)
CX$score<-round(CX$M/(CX$M+CX$UM)*CX$direction,digits = 3)
CX_dp4<-CX[(M+UM)>4]
CX_dp4$end<-CX_dp4$start

Outnames<-paste(str_replace(Args[1],".txt",""),"_dp4",sep = "")

cat(yellow("### Exporting WIG files!"),sep = "\n")
export.wig(GRanges(
    CX_dp4[context == "CG"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CG.wig",sep = ""))
export.wig(GRanges(
    CX_dp4[context == "CHG"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CHG.wig",sep = ""))
export.wig(GRanges(
    CX_dp4[context == "CHH"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CHH.wig",sep = ""))


cat(yellow("### Exporting BIGWIG files!"),sep = "\n")
export.bw(GRanges(
    CX_dp4[context == "CG"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CG.bw",sep = ""))
export.bw(GRanges(
    CX_dp4[context == "CHG"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CHG.bw",sep = ""))
export.bw(GRanges(
    CX_dp4[context == "CHH"][, c("seqnames", "start", "end", "score"), with =F],
    seqinfo = seqinfo(BSgenome.Athaliana.TAIR.TAIR9)), 
    con = paste(Outnames,"_CHH.bw",sep = ""))

cat(yellow("### Finished!"),sep = "\n")
## <chromosome> <position> <strand> <count methylated> <count unmethylated> <C-context> <trinucleotide context>
