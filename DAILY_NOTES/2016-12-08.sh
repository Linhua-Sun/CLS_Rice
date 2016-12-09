m7: Chr.5 2.47MB-8.76MB
m115: Chr.3 1.96-5.96MB
m150: Chr5. 19.05-19.97MB

Chr5:2000000-9000000
Chr3:1000000-6000000
Chr5:19000000-20000000


bcftools view -r Chr3:1000000-6000000 annotated_biallelic_snps_intervaled_m115_freq.vcf.gz | bgzip -c > Chr3_1000000_6000000_annotated_biallelic_snps_intervaled_m115_freq.vcf.gz && tabix -p vcf Chr3_1000000_6000000_annotated_biallelic_snps_intervaled_m115_freq.vcf.gz


bcftools view -r Chr5:19000000-20000000 annotated_biallelic_snps_intervaled_m150_freq.vcf.gz|bgzip -c > Chr5_19000000_20000000_annotated_biallelic_snps_intervaled_m150_freq.vcf.gz && tabix -p vcf Chr5_19000000_20000000_annotated_biallelic_snps_intervaled_m150_freq.vcf.gz




#!/bin/bash
# 5.extract nice fields from VCF file

SnpSift="/sdd1/users/linhua/QIAN_LAB/PROJECT-2016/resequecning_data_process/snpEff/SnpSift.jar"
snpEff="/sdd1/users/linhua/QIAN_LAB/PROJECT-2016/resequecning_data_process/snpEff/snpEff.jar"

zcat ${1}| \
/sdd1/users/linhua/QIAN_LAB/PROJECT-2016/resequecning_data_process/snpEff/scripts/vcfEffOnePerLine.pl | \
java -jar ${SnpSift} extractFields - \
CHROM POS REF ALT DP RO AO \
"ANN[*].ALLELE" \
"ANN[*].EFFECT" \
"ANN[*].IMPACT" \
"ANN[*].FEATURE" \
"ANN[*].FEATUREID" \
"ANN[*].GENE" \
"ANN[*].GENEID" \
"ANN[*].BIOTYPE" \
"ANN[*].HGVS_C" \
"ANN[*].HGVS_P" |sed "s/#//g" > ${1}_multilines_results.tsv

tput setaf 3; echo -n  "@@@@@@ extract nice fields is finished! @@@@@@"

cat Chr3_1000000_6000000_annotated_biallelic_snps_intervaled_m115_freq.vcf.gz_multilines_results.tsv |awk '{if ($7 > 4) print $0}' > bigger_4_Chr3_1000000_6000000_annotated_biallelic_snps_intervaled_m115_freq.vcf.gz_multilines_results.tsv
cat Chr5_19000000_20000000_annotated_biallelic_snps_intervaled_m150_freq.vcf.gz_multilines_results.tsv |awk '{if ($7 > 4) print $0}' > bigger_4_Chr5_19000000_20000000_annotated_biallelic_snps_intervaled_m150_freq.vcf.gz_multilines_results.tsv
cat Chr5_2000000_9000000_annotated_biallelic_snps_intervaled_m7_freq.vcf.gz_multilines_results.tsv |awk '{if ($7 > 4) print $0}' > bigger_4_Chr5_2000000_9000000_annotated_biallelic_snps_intervaled_m7_freq.vcf.gz_multilines_results.tsv

##
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1057/BN2-1057_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1057/BN2-1057_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1058/BN2-1058_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1058/BN2-1058_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1059/BN2-1059_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1059/BN2-1059_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1060/BN2-1060_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-1060/BN2-1060_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-971/BN2-971_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-971/BN2-971_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-972/BN2-972_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-972/BN2-972_R2.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-973/BN2-973_R1.fq.gz .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-data-2016-12-07/xiaokang_lncRNA/Cleandata/BN2-973/BN2-973_R2.fq.gz .


## align stranded reads to TAIR10 genome
trimmed_BN2-971_R1.fq.gz



#!/bin/bash

THREADS=10
GFF="/data1/linhua/QIANLAB/TAIR10/TOPHAT2/TAIR10_annotation/TAIR10_GFF3_genes_transposons"
REF="/data1/linhua/QIANLAB/TAIR10/TOPHAT2/TAIR10"

ID=$(basename ${1} _R1.fq.gz)

tophat2 \
--min-intron-length 8 \
--max-intron-length 120000 \
-p ${THREADS} \
-r -25 \
--library-type fr-firststrand \
-o ${ID}_tophat_align \
--transcriptome-index ${GFF} \
${REF} \
${ID}_R1.fq.gz ${ID}_R2.fq.gz

sativa_single_copy_gene_list_clean.txt



#!/bin/bash
for line in $(cat sativa_single_copy_gene_list_clean.txt)
do 
grep -i "$line" Oryza_sativa.IRGSP-1.0.33.gtf|awk '{if($3=="gene") print $0}' 
done


cutadapt -u 10 -o trimmed_BN2-637_R1.fq.gz BN2-637_R1.fq.gz &

cutadapt -u 10 -o trimmed_BN2-1057_R1.fq.gz BN2-1057_R1.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1057_R2.fq.gz BN2-1057_R2.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1058_R1.fq.gz BN2-1058_R1.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1058_R2.fq.gz BN2-1058_R2.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1059_R1.fq.gz BN2-1059_R1.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1059_R2.fq.gz BN2-1059_R2.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1060_R1.fq.gz BN2-1060_R1.fq.gz &
cutadapt -u 10 -o trimmed_BN2-1060_R2.fq.gz BN2-1060_R2.fq.gz &
cutadapt -u 10 -o trimmed_BN2-971_R1.fq.gz 	BN2-971_R1.fq.gz  &
cutadapt -u 10 -o trimmed_BN2-971_R2.fq.gz 	BN2-971_R2.fq.gz  &
cutadapt -u 10 -o trimmed_BN2-972_R1.fq.gz 	BN2-972_R1.fq.gz  &
cutadapt -u 10 -o trimmed_BN2-972_R2.fq.gz 	BN2-972_R2.fq.gz  &
cutadapt -u 10 -o trimmed_BN2-973_R1.fq.gz 	BN2-973_R1.fq.gz  &
cutadapt -u 10 -o trimmed_BN2-973_R2.fq.gz 	BN2-973_R2.fq.gz  &


#!/bin/bash

sh align.sh trimmed_BN2-1057_R1.fq.gz &&
sh align.sh trimmed_BN2-1058_R1.fq.gz &&
sh align.sh trimmed_BN2-1059_R1.fq.gz &&
sh align.sh trimmed_BN2-1060_R1.fq.gz &&
sh align.sh trimmed_BN2-971_R1.fq.gz &&
sh align.sh trimmed_BN2-972_R1.fq.gz &&
sh align.sh trimmed_BN2-973_R1.fq.gz &&


paste(
new_chan_lu$Chromosome,
new_chan_lu$Transcript_start,
new_chan_lu$Transcript_end,
new_chan_lu$Locus_ID,
as.factor(rep("0",366)),
new_chan_lu$Strand,
new_chan_lu$Transcript_start,
new_chan_lu$Transcript_end,
as.factor(rep("255",366)),
new_chan_lu$Exon_number,
new_chan_lu$Exon_length,
new_chan_lu$Exon_starts)
