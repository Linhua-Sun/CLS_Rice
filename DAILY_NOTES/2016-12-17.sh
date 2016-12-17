 							stringtie Araport11
antisense_lncRNA              1175      1424
antisense_RNA                   79        91
gene                           460     33341
lnc_RNA                       1451      2455
miRNA_primary_transcript       263       325
miRNA                          346       427
mRNA                         43988     52270
ncRNA                          234       286
pseudogenic_transcript         713      1100
pseudogenic_tRNA                10        27
rRNA                             4        15
snoRNA                         283       287
snRNA                           67        82
transcript_region              484       726
tRNA                           332       689



("mRNA",
"gene",
"lnc_RNA",
"ncRNA",
"antisense_lncRNA",
"antisense_RNA",
"transcript_region",
"pseudogenic_transcript",
"pseudogenic_tRNA",
"miRNA_primary_transcript",
"miRNA",
"rRNA",
"tRNA",
"snoRNA",
"snRNA")
                    


stat_gff$Ratio<-(as.numeric(stat_gff$Stringtie))/(as.numeric(stat_gff$Araport11))
stat_gff$Ratio<-round(stat_gff$Ratio,digits = 3)

nohup changed_tx_qual.R  Col-0_without_guide.gtf &
nohup changed_tx_qual.R  f_0.gtf &
nohup changed_tx_qual.R  f_10.gtf &
nohup changed_tx_qual.R  f_20.gtf &
nohup changed_tx_qual.R  f_30.gtf &
nohup changed_tx_qual.R  f_40.gtf &
nohup changed_tx_qual.R  f_50.gtf &
nohup changed_tx_qual.R  f_60.gtf &
nohup changed_tx_qual.R  f_70.gtf &
nohup changed_tx_qual.R  f_80.gtf &
nohup changed_tx_qual.R  f_90.gtf &
nohup changed_tx_qual.R  f_95.gtf &



