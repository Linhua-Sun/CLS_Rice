## analysis the output of TEtranscripts\

## analysis date: Tue Jan 10 17:24:01 2017

## heatmap output
library(stringr)
library(ggpubr)
library(genefilter)
library(gplots)
library(pheatmap)
library(magrittr)
library(dplyr)
library(RColorBrewer)
## pheatmap xieti----
draw_colnames_45 <- function (coln, gaps, ...) {
    coord = pheatmap:::find_coordinates(length(coln), gaps)
    x = coord$coord - 0.5 * coord$size
    res = textGrob(
        coln,
        x = x,
        y = unit(1, "npc") - unit(3, "bigpts"),
        vjust = 0.5,
        hjust = 1,
        rot = 45,
        gp = gpar(...)
    )
    return(res)
}

## 'Overwrite' default draw_colnames with your own version
assignInNamespace(x = "draw_colnames",
                  value = "draw_colnames_45",
                  ns = asNamespace("pheatmap"))




setwd("/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RE_ANALYSIS_LNC_RNA_DATA_SET/TE_remapping_LncRNA-Seq/count")
## analysis the TE GTF files geneerated by TEtranscripts ----

TE<-import.gff("/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/TE_reanalysis/TAIR10_TE.gtf")
library(ballgown)

TE<-gffReadGR(gtf = "/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/TE_reanalysis/TAIR10_TE.gtf",splitByTranscript = T,identifier = "gene_id")
sum(width(TE$ATREP3))

unTE<-unlist(TE)


table(mcols(unTE)$class_id)
family_id
table(mcols(unTE)$family_id)
RETE<-lapply(TE,FUN = width)
lapply(RETE,FUN = sum)

REW<-unlist(lapply(lapply(TE,FUN = width),FUN = sum))
sum(as.data.frame(REW))



## 

cnt<-read.table("/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RE_ANALYSIS_LNC_RNA_DATA_SET/TE_remapping_LncRNA-Seq/count/names-1059_tophat_100.bam_TE.cntTable",header = T,row.names = 1)
#AtTE_ID<-as.character(cnt$gene.TE[!(str_detect(cnt$gene.TE,pattern = "AT\\dG|ATCG|ATMG"))]) ## At transposon element ID
head(cnt)
AtTE_ID<-readLines("AtTE_ID.txt")
round(cnt[AtTE_ID,]$names.1059_tophat_100.bam.T/114878979*1e6,digits = 4)


## import data and clean data ----
setwd("/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RE_ANALYSIS_LNC_RNA_DATA_SET/TE_remapping_LncRNA-Seq/count/")
cnt1057<-"names-1057_tophat_100.bam_TE.cntTable"
cnt1058<-"names-1058_tophat_100.bam_TE.cntTable"
cnt1059<-"names-1059_tophat_100.bam_TE.cntTable"
cnt1060<-"names-1060_tophat_100.bam_TE.cntTable"
cnt0638<-"names-638_tophat_100.bam_TE.cntTable"
cnt0971<-"names-971_tophat_100.bam_TE.cntTable"
cnt0972<-"names-972_tophat_100.bam_TE.cntTable"
cnt0973<-"names-973_tophat_100.bam_TE.cntTable"

count1057<-read.table(cnt1057,header = T,row.names = 1)
count1058<-read.table(cnt1058,header = T,row.names = 1)
count1059<-read.table(cnt1059,header = T,row.names = 1)
count1060<-read.table(cnt1060,header = T,row.names = 1)
count0638<-read.table(cnt0638,header = T,row.names = 1)
count0971<-read.table(cnt0971,header = T,row.names = 1)
count0972<-read.table(cnt0972,header = T,row.names = 1)
count0973<-read.table(cnt0973,header = T,row.names = 1)


TE_ex<-data.frame(
    AtTE_ID,
    count1057[AtTE_ID,2]/80026379*1e6,
    count0638[AtTE_ID,1]/85694994*1e6,
    count0971[AtTE_ID,1]/150924209*1e6,
    count0972[AtTE_ID,1]/162478034*1e6,
    count0973[AtTE_ID,1]/136211755*1e6,
    count1057[AtTE_ID,1]/106632022*1e6,
    count1058[AtTE_ID,1]/114222794*1e6,
    count1059[AtTE_ID,1]/114878979*1e6)

colnames(TE_ex)<-c("TE","nCol-0","ddm1","nrpd1","nrpe1","morc6","rdd","met1","mom1")

## clean the data.frame
rownames(TE_ex)<-TE_ex$TE
TE_ex$TE<-NULL

## remove Unassigned:Unassigned:Unassigned TE from the data.frame
TE_ex<-TE_ex[-(which(rownames(TE_ex)=="Unassigned:Unassigned:Unassigned")),]

head(TE_ex)

TE_ex<-TE_ex %>% select(`nCol-0`,ddm1,met1,nrpd1,nrpe1,morc6,mom1,rdd) 

#write(AtTE_ID,file = "AtTE_ID.txt")
AtTE_ID<-readLines("AtTE_ID.txt")
TE_all_df<-read.table("New_At.txt",row.names = 1) 

head(TE_all_df)

TE_all_df$V2<-NULL

TE_all_df<-TE_all_df[-(which(rownames(TE_all_df)=="Unassigned:Unassigned:Unassigned")),]
colnames(TE_all_df)<-c("Family","Class")

## total scaled expression heatmap -----
sorted_TE_ex<-TE_ex[order(rowSums(TE_ex),decreasing = T),]

sd_sorted_TE_ex<-TE_ex[order(rowSds(TE_ex),decreasing = T),]

df_Total <- TE_all_df[rownames(sd_sorted_TE_ex), ]

df_Total$Family <- NULL

pheatmap(
    sd_sorted_TE_ex,
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = F,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "row",
    fontsize_col = 12,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white",
    annotation_row = df_Total
)


## total rpm without scaled (corr or not)---- 

pheatmap(
    log2(sd_sorted_TE_ex+1e-4),
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = F,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "none",
    fontsize_col = 12,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)


### Euclidean distance
pheatmap(
    log2(sd_sorted_TE_ex+1e-4),
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = F,
    scale = "none",
    fontsize_col = 12,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)

## partial TE expression heatmap
head(sorted_TE_ex)

partial_TE_ex<-TE_ex[rowSums(TE_ex)>20,]
head(partial_TE_ex)

sorted_partial_TE_ex<-partial_TE_ex[order(rowSums(partial_TE_ex),decreasing = T),]
head(sorted_partial_TE_ex)
TE_all_df$Family<-NULL
head(TE_all_df)
## from big to small
pheatmap(
    log2(sorted_partial_TE_ex[1:50,] + 0.001),
    cluster_rows = F,
    cluster_cols = F,
    show_rownames = T,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "none",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)

## from SD big to small

SD_sorted_partial_TE_ex<-partial_TE_ex[order(rowSds(partial_TE_ex),decreasing = T),]

pheatmap(
    log2(SD_sorted_partial_TE_ex[1:50,] + 0.001),
    cluster_rows = F,
    cluster_cols = F,
    show_rownames = T,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "none",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)


## from big to small scaled

pheatmap(
    log2(sorted_partial_TE_ex[1:50,] + 0.001),
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = T,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "row",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)


## from SD big to small scaled

SD_sorted_partial_TE_ex<-partial_TE_ex[order(rowSds(partial_TE_ex),decreasing = T),]

pheatmap(
    SD_sorted_partial_TE_ex[1:50,],
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = T,
    clustering_distance_rows = "correlation",
    clustering_distance_cols = "correlation",
    scale = "row",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)


## DE (deseq) scaled and raw rpm ----

sigID<-read.table("sig_ID.txt")

as.character(sigID$V1[!(str_detect(sigID$V1,pattern = "AT\\dG|ATCG|ATMG"))]) %>% sort %>% unique() -> sigTEID

sig_TEex<-TE_ex[sigTEID,]


pheatmap(
    sig_TEex,
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = F,
    scale = "row",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)

pheatmap(
    log2(sig_TEex+1e-4),
    cluster_rows = T,
    cluster_cols = F,
    show_rownames = F,
    scale = "none",
    fontsize_col = 10,
    cellwidth = 20,
    fontsize_row = 8,
    color = colorRampPalette((brewer.pal(
        n = 9, name = "YlGnBu"
    )))(50),
    border_color = "white"
)