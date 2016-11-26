#!/bin/bash

ID=$(basename ${1} _1.fastq.gz)

REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"

THREADS=20
MEMORY=64GB

bwa aln -t 20 ${REF} ${ID}_1.fastq.gz >  ${ID}_1.sai
bwa aln -t 20 ${REF} ${ID}_2.fastq.gz >  ${ID}_2.sai

bwa sampe -r "@RG\tID:${ID}\tSM:${ID}\tLB:${ID}\tPL:ILLUMINA\tPU:run" ${REF} ${ID}_1.sai ${ID}_2.sai ${ID}_1.fastq.gz ${ID}_2.fastq.gz > ${ID}.sam

# -r STR       	Specify the read group in a format like ‘@RG\tID:foo\tSM:bar’. [null]

samtools view -@ ${THREADS} -h ${ID}.sam | samtools view -@ ${THREADS} -bq 20 | sambamba sort -t ${THREADS} -m ${MEMORY} -o ${ID}_sorted_q20.bam /dev/stdin
