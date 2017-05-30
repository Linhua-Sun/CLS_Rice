#!/usr/bin/RScript
# verse-combine_all.R
# copy this code to RStudio and adapt file locations to match yours

## REFER TO ::: https://sbamin.com/blog/2016/02/merge_multiple_tables_r_data_table/
## http://wiki.bits.vib.be/index.php/NGS_RNASeq_DE_Exercise.4#Combine_individual_HTSeq_files_from_the_.27all.27_mapping_series



# where are we?
#basedir <- "/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/Yuxin-Cao/Auxin"
basedir<-"/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/lncRNA_public/Nelson_G3/RNA-Seq/BAM"
setwd(basedir)

cntdir <- paste(basedir, "EXON", sep="/")
#pat <- "_sortbyname_GENES_z2_2017-05-30.exon.txt"
pat<-"_sortbyname_lincRNA_s2_2017-05-03.tx.txt"
tophat.all <- list.files(path = cntdir,
                         pattern = pat,
                         all.files = TRUE,
                         recursive = FALSE,
                         ignore.case = FALSE,
                         include.dirs = FALSE)

# we choose the 'all' series
myfiles <- tophat.all
DT <- list()

# read each file as array element of DT and rename the last 2 cols
# we created a list of single sample tables
for (i in 1:length(myfiles) ) {
    infile = paste(cntdir, myfiles[i], sep = "/")
    DT[[myfiles[i]]] <- read.table(infile, header = T, stringsAsFactors = FALSE)
    cnts <- gsub("(.*)_sortbyname_lincRNA_s2_2017-05-03.tx.txt", "\\1", myfiles[i])
    colnames(DT[[myfiles[i]]]) <- c("ID", cnts)
}

# merge all elements based on first ID columns
data <- DT[[myfiles[1]]]
# we now add each other table with the ID column as key
for (i in 2:length(myfiles)) {
    y <- DT[[myfiles[i]]]
    z <- data.table:::merge.data.table(data, y, by = c("ID"))
    data <- z
}
write.csv(data,"merged_verse_table.csv",row.names = F)
