#!/usr/bin/env Rscript

Args<- commandArgs(trailingOnly = TRUE)
input<-Args[1]

library(data.table)
library(ggpubr)
library(crayon)
colnames_info<-c("CHROM","POS","REF,ALT","AC","AF","AN","BaseQRankSum","ClippingRankSum","DP","DS","END","ExcessHet","FS","HaplotypeScore","InbreedingCoeff","MLEAC","MLEAF","MQ","MQRankSum","QD","RAW_MQ","ReadPosRankSum","SOR")

info_01<-fread(input,sep = "\t",header = F,na.strings = ".")
colnames(info_01)<-colnames_info
pathname<-paste("./png_",basename(input),"_DENSITY_PLOT_OUTPUT",sep = "")

cat(pathname,fill=T)

dir.create(path = pathname)

cat(red("Create a new dir!","\n\n"))

for (i in colnames(info_01)[4:length(colnames(info_01))]) {
    cat(green(i))
    pngfilepath<-paste(pathname,"/png_",basename(input), "_density_plot_",i,".png" ,sep="")
    cat(pngfilepath,fill=T)
    logout<-paste(i," png process is OK !",sep = "")
    tryCatch({
        p<-ggdensity(info_01, x = i,
                     add = "mean",
                     palette ="npg" ,rug = T)
        ggsave(filename = pngfilepath,plot = p,device = "png")
    },
    error=function(e){
       	cat(yellow("There are all NAs. ",
       	conditionMessage(e),"\n\n"))
       	},
    finally={cat(logout,fill=T)}
    )
}


