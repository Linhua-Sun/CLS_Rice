#!/bin/bash

ref.fasta="TAIR10.fasta"
qry.fasta="output.fasta"


nucmer --prefix=ref_qry ref.fasta qry.fasta

show-coords -rcl ref_qry.delta > ref_qry.coords

show-aligns ref_qry.delta refname qryname > ref_qry.aligns

show-tiling ref_qry.delta > ref_qry.tiling

delta-filter -q ref_qry.delta > ref_qry.filter

#!/bin/bash
fastqc -t 2 SRR2007490_1.fastq.gz &
fastqc -t 2 SRR2007490_2.fastq.gz &
fastqc -t 2 SRR3460276_1.fastq.gz &
fastqc -t 2 SRR3460277_1.fastq.gz &
fastqc -t 2 SRR3460278_1.fastq.gz &
fastqc -t 2 SRR3460279_1.fastq.gz &
fastqc -t 2 SRR3460280_1.fastq.gz &
fastqc -t 2 SRR3460281_1.fastq.gz &
fastqc -t 2 SRR3460282_1.fastq.gz &
fastqc -t 2 SRR3460283_1.fastq.gz &
fastqc -t 2 SRR3460284_1.fastq.gz &
fastqc -t 2 SRR3460285_1.fastq.gz &
fastqc -t 2 SRR3460287_1.fastq.gz &
fastqc -t 2 SRR3460288_1.fastq.gz &
fastqc -t 2 SRR3460289_1.fastq.gz &
fastqc -t 2 SRR3460290_1.fastq.gz &
fastqc -t 2 SRR3460291_1.fastq.gz &


/data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10

/data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10_splicesites.txt




#!/bin/bash

# usage: sh the_script.sh `pwd`(path)
# single end reads mapping pipeline
# time: Tue Jul 12 07:30:58 EDT 2016

cd ${1}

THREADS=12

OUTDIR="${1}/HISAT-$(date +%F)"

if [ ! -d ${OUTDIR} ]
       	then mkdir -p ${OUTDIR}
fi

       	for i in *.fastq.gz
       	do

       			ID=$(basename ${i} .fastq.gz)

       			echo ${ID}

       			hisat2 -p ${THREADS} \
       			--pen-noncansplice 1000000 \
       			-x  /data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10 \
       			--known-splicesite-infile /data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10_splicesites.txt \
       			${i} \
       			-S ${OUTDIR}/${ID}_hisat_$(date +%F).sam > ${OUTDIR}/${ID}_hisat_$(date +%F).log 2>&1

       			samtools view -@ ${THREADS} -b ${OUTDIR}/${ID}_hisat_$(date +%F).sam > ${OUTDIR}/${ID}_hisat_mapping_$(date +%F).bam
       			samtools sort -@ ${THREADS} ${OUTDIR}/${ID}_hisat_mapping_$(date +%F).bam > ${OUTDIR}/${ID}_hisat_mapping_$(date +%F)_sorted.bam
       			samtools index ${OUTDIR}/${ID}_hisat_mapping_$(date +%F)_sorted.bam

       			echo "${ID} is OK! "
       	done

       	## refer: http://www.ccb.jhu.edu/software/hisat/manual.shtml



# /data1/linhua/ncbi/public/sra/single_end_cvi/map
## RNA seq reads mapping to Col-0



#!/bin/bash

# Linhua Sun
# usage: sh the_script.sh `pwd`(path)

cd ${1}

THREADS=8

#OUTDIR="/sdd2/users/linhua/QIAN/RNA-seq-data-analysis/liqi-2016-05-30/Intermiddle-Data/Diff_Results/cuffdiff-$(date +%F)"
OUTDIR="./diffout"

Reference_Genome="/data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10.fa"

GFF="/data1/linhua/SECOND/linhua/QIAN_LAB/TAIR_10_Reference_genome/TAIR10_GFF3_genes_transposons.gff"

if [ ! -d ${OUTDIR} ]
       			then mkdir -p ${OUTDIR}
       	fi

       	cuffdiff \
       	-o ${OUTDIR} \
       	-u \
       	-label SRR924656,SRR924658,SRR924660 \
       	-p ${THREADS} \
       	-b ${Reference_Genome} ${GFF} \
		/data1/linhua/ncbi/public/sra/single_end_cvi/map/HISAT-2016-12-04/combined_hisat_mapping_2016-12-04_sorted.bam \
		/data1/linhua/ncbi/public/sra/single_end_cvi/map/HISAT-2016-12-04/SRR924656_hisat_mapping_2016-07-12_sorted.bam

bam2wig.py -s TAIR10.chrom.sizes -i SRR924656_hisat_mapping_2016-07-12_sorted.bam -u -o Col-0 --wigsum=1000000000 &



/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter

EBI_NEW//Long_reads/SRR1264539/SRR1264539_output_raw_snps_indels.g.vcf.gz
EBI_NEW//Long_reads/SRR1264537/SRR1264537_output_raw_snps_indels.g.vcf.gz
EBI_NEW//Long_reads/SRR1997912/SRR1997912_output_raw_snps_indels.g.vcf.gz
EBI_NEW//Long_reads/SRR1264536/SRR1264536_output_raw_snps_indels.g.vcf.gz
EBI_NEW//S_BAMS/SRR1997915/SRR1997915_output_raw_snps_indels.g.vcf.gz
EBI_NEW//S_BAMS/SRR1264538/SRR1264538_output_raw_snps_indels.g.vcf.gz
EBI_NEW//Oryza_brachyanthaGenome_sequencing/BZ2/MMM/brachyantha/brachyantha_output_raw_snps_indels.g.vcf.gz
EBI_NEW//ddbj/COM/longistaminata__DRR000464/longistaminata__DRR000464_output_raw_snps_indels.g.vcf.gz
EBI_NEW//ddbj/COM/BAM/longistaminata__DRR000464_raw.vcf_BIALLELIC_SNPs.vcf.gz
EBI_NEW//ddbj/COM/BAM/brachyantha/brachyantha_raw.vcf_BIALLELIC_SNPs.vcf.gz
EBI_NEW//ddbj/COM/BAM/longistaminata__DRR000463_raw.vcf_BIALLELIC_SNPs.vcf.gz
EBI_NEW//ddbj/COM/longistaminata__DRR000463/longistaminata__DRR000463_output_raw_snps_indels.g.vcf.gz
EBI_NEW//short_ends/LAST/SRX809898/SRX809898_output_raw_snps_indels.g.vcf.gz
EBI_NEW//short_ends/LAST/SRX809892/SRX809892_output_raw_snps_indels.g.vcf.gz

