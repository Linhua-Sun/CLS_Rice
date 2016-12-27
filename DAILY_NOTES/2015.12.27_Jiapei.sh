#!/bin/bash
## https://www.ncbi.nlm.nih.gov/Traces/study/?WebEnv=NCID_1_46581557_130.14.22.76_5555_1482809268_3684519043_0MetA0_S_HStore&query_key=2
#prefetch SRR3087771 &
#prefetch SRR3087772 &
prefetch SRR3087775 &
prefetch SRR3087776 &
prefetch SRR3087779 &
prefetch SRR3087780 &
prefetch SRR3087783 &
prefetch SRR3087784 &

##

ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087771.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087779.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087775.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087780.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087776.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087784.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087783.sra .
ln -s /data1/linhua/NCBI_DOWNLOAD/sra/SRR3087772.sra .


## 
fastq-dump --split-3 --gzip SRR2072473.sra & 
fastq-dump --split-3 --gzip SRR3087771.sra &
fastq-dump --split-3 --gzip SRR3087772.sra &
fastq-dump --split-3 --gzip SRR3087775.sra &
fastq-dump --split-3 --gzip SRR3087776.sra &
fastq-dump --split-3 --gzip SRR3087779.sra &
fastq-dump --split-3 --gzip SRR3087780.sra &
fastq-dump --split-3 --gzip SRR3087783.sra &
fastq-dump --split-3 --gzip SRR3087784.sra &




## SRR2072473 is single end reads (not now!)

##

fastqc -t 2 SRR3087771_1.fastq.gz &
fastqc -t 2 SRR3087771_2.fastq.gz &
fastqc -t 2 SRR3087772_1.fastq.gz &
fastqc -t 2 SRR3087772_2.fastq.gz &
fastqc -t 2 SRR3087775_1.fastq.gz &
fastqc -t 2 SRR3087775_2.fastq.gz &
fastqc -t 2 SRR3087776_1.fastq.gz &
fastqc -t 2 SRR3087776_2.fastq.gz &
fastqc -t 2 SRR3087779_1.fastq.gz &
fastqc -t 2 SRR3087779_2.fastq.gz &
fastqc -t 2 SRR3087780_1.fastq.gz &
fastqc -t 2 SRR3087780_2.fastq.gz &
fastqc -t 2 SRR3087783_1.fastq.gz &
fastqc -t 2 SRR3087783_2.fastq.gz &
fastqc -t 2 SRR3087784_1.fastq.gz &
fastqc -t 2 SRR3087784_2.fastq.gz &

##

SRR3087771_1.fastq.gz

#!/bin/bash

THREADS=10

GFF="/data1/linhua/QIANLAB/Araport_TOPHAT/TAIR10.tr/Araport11_GFF3_genes_transposons.201606"
REF="/data1/linhua/QIANLAB/Araport_TOPHAT/TAIR10"

ID=$(basename ${1} _1.fastq.gz)

tophat2 \
--min-intron-length 8 \
--max-intron-length 5000 \
-p ${THREADS} \
--library-type fr-firststrand \
-o ${ID}_tophat_align \
--transcriptome-index ${GFF} \
${REF} \
${ID}_1.fastq.gz ${ID}_2.fastq.gz


## -r -25 \


#!/bin/bash
sh mapping.sh SRR3087771_1.fastq.gz
sh mapping.sh SRR3087772_1.fastq.gz
sh mapping.sh SRR3087775_1.fastq.gz
sh mapping.sh SRR3087776_1.fastq.gz
sh mapping.sh SRR3087779_1.fastq.gz
sh mapping.sh SRR3087780_1.fastq.gz
sh mapping.sh SRR3087783_1.fastq.gz
sh mapping.sh SRR3087784_1.fastq.gz

