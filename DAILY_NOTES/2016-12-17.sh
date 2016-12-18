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

#!/bin/bash
cut -f2 f_0.gtf_compare_ara_stats.tsv >   f_0_2.txxt
cut -f2 f_10.gtf_compare_ara_stats.tsv > f_10_2.txxt
cut -f2 f_20.gtf_compare_ara_stats.tsv > f_20_2.txxt
cut -f2 f_30.gtf_compare_ara_stats.tsv > f_30_2.txxt
cut -f2 f_40.gtf_compare_ara_stats.tsv > f_40_2.txxt
cut -f2 f_50.gtf_compare_ara_stats.tsv > f_50_2.txxt
cut -f2 f_60.gtf_compare_ara_stats.tsv > f_60_2.txxt
cut -f2 f_70.gtf_compare_ara_stats.tsv > f_70_2.txxt
cut -f2 f_80.gtf_compare_ara_stats.tsv > f_80_2.txxt
cut -f2 f_90.gtf_compare_ara_stats.tsv > f_90_2.txxt
cut -f2 f_95.gtf_compare_ara_stats.tsv > f_95_2.txxt

paste f_0_2.txxt \
f_10_2.txxt \
f_20_2.txxt \
f_30_2.txxt \
f_40_2.txxt \
f_50_2.txxt \
f_60_2.txxt \
f_70_2.txxt \
f_80_2.txxt \
f_90_2.txxt \
f_95_2.txxt > f_summary_stats.tsv

##

#!/bin/bash
sh string_tie_test.sh epi_merge.bam 
sh string_tie_test.sh uniqmap_0637.bam 
sh string_tie_test.sh uniqmap_0638.bam 
sh string_tie_test.sh uniqmap_0971.bam 
sh string_tie_test.sh uniqmap_0972.bam 
sh string_tie_test.sh uniqmap_0973.bam 
sh string_tie_test.sh uniqmap_1057.bam 
sh string_tie_test.sh uniqmap_1058.bam 
sh string_tie_test.sh uniqmap_1059.bam 
sh string_tie_test.sh uniqmap_1060.bam 


#!/bin/bash

CHROMSIZE="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-DATA-2016-09-28/ath.chrom.sizes"

BED="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-DATA-2016-09-28/RNA_Seq_rseqc/Araport11.bed"

CTRLBAM="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/QC_RNA_SEQ/Tophat_unstrand_Col-0.bam"

geneBody_coverage.py \
-r ${BED} \
-i \
${CTRLBAM}\
,uniqmap_0637.bam \
,uniqmap_0638.bam \
,uniqmap_0971.bam \
,uniqmap_0972.bam \
,uniqmap_0973.bam \
,uniqmap_1057.bam \
,uniqmap_1058.bam \
,uniqmap_1059.bam \
,uniqmap_1060.bam \
-o comparison_10_bams



#!/bin/bash

CTRLBAM="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/QC_RNA_SEQ/Tophat_unstrand_Col-0.bam"

rRNA="/data1/linhua/QIANLAB/TAIR10/TAIR10_rRNA.bed"

split_bam.py -i uniqmap_0637.bam -r ${rRNA} -o uniqmap_0637_split   &
split_bam.py -i uniqmap_0638.bam -r ${rRNA} -o uniqmap_0638_split   &
split_bam.py -i uniqmap_0971.bam -r ${rRNA} -o uniqmap_0971_split   &
split_bam.py -i uniqmap_0972.bam -r ${rRNA} -o uniqmap_0972_split   &
split_bam.py -i uniqmap_0973.bam -r ${rRNA} -o uniqmap_0973_split   &
split_bam.py -i uniqmap_1057.bam -r ${rRNA} -o uniqmap_1057_split   &
split_bam.py -i uniqmap_1058.bam -r ${rRNA} -o uniqmap_1058_split   &
split_bam.py -i uniqmap_1059.bam -r ${rRNA} -o uniqmap_1059_split   &
split_bam.py -i uniqmap_1060.bam -r ${rRNA} -o uniqmap_1060_split   &
split_bam.py -i ${CTRLBAM} 		 -r ${rRNA} -o ctrl_split &



##
#!/bin/bash

ARA="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/DIFF/reassembley_by_stringtie/CHOOSE_TWO/Test_Novel_tx/Araport11_ara_R.gff"
TAIR10="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/DIFF/reassembley_by_stringtie/CHOOSE_TWO/Test_Novel_tx/TAIR10_GFF3_genes_transposons_chr.gff"

bedtools intersect -a ${1} -b ${ARA} -v > ${1}_1
bedtools intersect -a ${1}_1 -b ${TAIR10} -v > ${1}_rmAra_rmTAIR.gff
rm -rf ${1}_1

######
ving.R -R 300 -i -l -r gene -v heatmap -a /data1/linhua/QIANLAB/TAIR10/TOPHAT2/TAIR10_annotation/TAIR10_GFF3_genes_transposons.gff \
-c Chr3 -S 23297911 -E 23300111 \
-o AT3G63052_extended.png \
-t "Col-0 nuclear" uniqmap_0637.bam \
-t "Col-0 cytoplasm" uniqmap_1060.bam


ving.R -R 300 -i -l -r transcript,mRNA -v heatmap -a /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/DIFF/reassembley_by_stringtie/BAM_plot_lncRNA/high_cov_epi.gff -a /data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gff \
-c Chr2 -S 3462329 -E 3466645 -o STRG.18202.1.png \
-t "Merge" epi_merge.bam \
-t "cCol-0" uniqmap_1060.bam \
-t "nCol-0" uniqmap_0637.bam \
-t "ddm1" uniqmap_0638.bam \
-t "nrpd1 " uniqmap_0971.bam \
-t "nrpe1" uniqmap_0972.bam \
-t "morc6" uniqmap_0973.bam \
-t "rdd" uniqmap_1057.bam \
-t "met1" uniqmap_1058.bam \
-t "mom1" uniqmap_1059.bam


#!/bin/bash

for i in $(cat 86.txt) 
do
	echo ving.R -R 300 -i -l -r transcript,mRNA -v heatmap -a /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/DIFF/reassembley_by_stringtie/BAM_plot_lncRNA/high_cov_epi.gff -a /data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gff \
${i} \
-t "Merge" epi_merge.bam \
-t "cCol-0" uniqmap_1060.bam \
-t "nCol-0" uniqmap_0637.bam \
-t "ddm1" uniqmap_0638.bam \
-t "nrpd1 " uniqmap_0971.bam \
-t "nrpe1" uniqmap_0972.bam \
-t "morc6" uniqmap_0973.bam \
-t "rdd" uniqmap_1057.bam \
-t "met1" uniqmap_1058.bam \
-t "mom1" uniqmap_1059.bam
done


-t "Merge" epi_merge.bam -t "cCol-0" uniqmap_1060.bam -t "nCol-0" uniqmap_0637.bam -t "ddm1" uniqmap_0638.bam -t "nrpd1 " uniqmap_0971.bam -t "nrpe1" uniqmap_0972.bam -t "morc6" uniqmap_0973.bam -t "rdd" uniqmap_1057.bam -t "met1" uniqmap_1058.bam -t "mom1" uniqmap_1059.bam




#!/bin/bash

CTRLBAM="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/QC_RNA_SEQ/Tophat_unstrand_Col-0.bam"

BED="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-DATA-2016-09-28/RNA_Seq_rseqc/Araport11.bed"

tin.py \
-r ${BED} \
-i ${CTRLBAM},uniqmap_0637.bam,uniqmap_0638.bam,uniqmap_0971.bam,uniqmap_0972.bam,uniqmap_0973.bam,uniqmap_1057.bam,uniqmap_1058.bam,uniqmap_1059.bam,uniqmap_1060.bam -s

f_0_2.txxt  f_10_2.txxt  f_20_2.txxt  f_30_2.txxt  f_40_2.txxt  f_50_2.txxt  f_60_2.txxt  f_70_2.txxt  f_80_2.txxt  f_90_2.txxt  f_95_2.txxt

sh tt.sh Col-0_without_guide.gtf
sh tt.sh f_10.gtf
sh tt.sh f_20.gtf
sh tt.sh f_30.gtf
sh tt.sh f_40.gtf
sh tt.sh f_50.gtf
sh tt.sh f_60.gtf
sh tt.sh f_70.gtf
sh tt.sh f_80.gtf
sh tt.sh f_90.gtf
sh tt.sh f_95.gtf