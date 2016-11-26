#!/bin/bash

# set several traps
set -e
set -u
set -o pipefail

#####################################################################################
# Linhua Sun (jshaslh@163.com)
# Last modified: Sun Apr  3 09:28:47 CST 2016 $$ Mon Apr  4 21:34:05 CST 2016 $$ Fri Apr  8 20:52:59 CST 2016 
# Change log : change the temp and memeory limitation(error based)! Remove the unnecessary files.
# Change log : change the annotation symbol
# Usage: sh script.sh path_to_sample

#####################################################################################
# parameters required to change (based to different machines' limitation)

THREADS="20"

MEMORY="64G" # memory at least = 15GB (Markdup error since the little memeory)

#TOTAL_OUTPUT="/lustre1/deng_pkuhpc/slh_RICE_data/test_data/try"
#TOTAL_OUTPUT="/lustre1/deng_pkuhpc/slh_RICE_data/OUTPUT_4_1_DATA_IMPORTANT/unsuccessful_samples"

TOTAL_OUTPUT="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Long_reads"

#####################################################################################
# Locations require to change (based to different computers)

# assign reference genome of the species

REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"

# GATK software location

GATK="/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/GATK/GenomeAnalysisTK.jar"

# PICARD software location (the directory)

PICARD_LOC="/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/picard-tools-2.1.1"

#####################################################################################
# Assign the I/O variables

INPUTDIR="${1}"

SAMPLE_NAME="$(basename ${1})"

OUTPUT="${TOTAL_OUTPUT}/${SAMPLE_NAME}"

LOG="${OUTPUT}/LOG"

TEMP="${OUTPUT}/TEMP"

#####################################################################################

# mkdir new directories

if [ ! -d $TOTAL_OUTPUT ]
		then mkdir -p $TOTAL_OUTPUT
fi

if [ ! -d ${OUTPUT} ]
		then mkdir -p ${OUTPUT}
fi

if [ ! -d $TEMP ]
		then mkdir -p $TEMP
fi

if [ ! -d ${LOG} ]
		then mkdir -p ${LOG}
fi

#####################################################################################

cd ${INPUTDIR}

java  -jar ${PICARD_LOC}/picard.jar MarkDuplicates \
	I=${TEMP}/${SAMPLE_NAME}_merge.bam \
	O=${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam \
	M=${OUTPUT}/${SAMPLE_NAME}_metrics.txt \
	ASSUME_SORTED=TRUE \
	CREATE_INDEX=TRUE \
	> ${LOG}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.log 2>&1

#echo "PICARD Markdup is done"

sambamba index -t ${THREADS} ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam

echo "sambamba index is done"

#######################################################################################

java  -jar ${GATK} \
	-nt ${THREADS} \
	-T RealignerTargetCreator \
	-R ${REF} \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.intervals \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads.bam.intervals.log 2>&1

java  -jar ${GATK} \
	-T IndelRealigner \
	-R ${REF} \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam \
	-targetIntervals ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.intervals \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.log 2>&1

echo "GATK_realign_1 is done"

######################################################################################
## INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam
## OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf

java  -jar ${GATK} \
	-R ${REF} \
	-T HaplotypeCaller \
	-nct ${THREADS} \
	--genotyping_mode DISCOVERY \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf \
	--read_filter BadCigar \
	-stand_call_conf 30.0 \
	-stand_emit_conf 10 \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf.log 2>&1 &

## INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam
## OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf

echo "${OUTPUT}/${SAMPLE_NAME}"

#sambamba mpileup \
#	-t 5  --tmpdir=${TEMP}  -o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf \
#	${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam \
#	--samtools -ugf ${REF} \
#	--bcftools call -vm \
#	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf.log 2>&1

samtools mpileup -ugf $REF ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam | bcftools call -vmO v -o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf &


wait && echo "GATK HC and samtools+bcftools is done"

#####################################################################################

# INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf #${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf
# OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf

java  -jar ${GATK} \
	-R ${REF} \
	-T SelectVariants \
	--variant ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf \
	--concordance ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf.log 2>&1

MEANQUAL=`awk '{ if ($1 !~ /#/) { total += $6; count++ } } END { print total/count }' ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf `

java  -jar ${GATK} \
	-R ${REF} \
	-T VariantFiltration \
	--filterExpression "QD < 2.0 || ReadPosRankSum < -8.0 || FS > 60.0 || QUAL < $MEANQUAL" \
	--filterName LowQualFilter \
	--variant ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf \
	--missingValuesInExpressionsShouldEvaluateAsFailing \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.vcf \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.vcf.log 2>&1

grep -v "LowQual" \
${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.vcf > \
${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.confidence.rawlow.vcf
grep -v "Filter" \
${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.confidence.rawlow.vcf > \
${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf

echo "VCF prepation is done"

#####################################################################################
# INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam
# OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.realn.intervals  ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam

java  -jar ${GATK} \
	-nt ${THREADS} \
	-R ${REF} \
	-T RealignerTargetCreator \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam \
	-known ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.realn.intervals \
	> ${LOG}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.realn.intervals.log 2>&1

java  -jar ${GATK} \
	-R ${REF} \
	-T IndelRealigner \
	-targetIntervals ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.realn.intervals \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam \
	-known ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.log 2>&1

echo "GATK_realign_2 is done"

#####################################################################################

# INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam
# OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.recal_data.grp
# OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.recal.bam

java  -jar ${GATK} \
	-nct ${THREADS} \
	-R ${REF} \
	-T BaseRecalibrator \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.recal_data.grp \
	-knownSites ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf \
	> ${LOG}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.recal_data.grp.log 2>&1

java  -jar ${GATK} \
	-nct ${THREADS} \
	-R ${REF} \
	-T PrintReads \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam \
	-o ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.recal.bam \
	-BQSR ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.recal_data.grp \
	> ${LOG}/${SAMPLE_NAME}_PrintReads.log 2>&1

echo "GATK_BQSR is done"

#####################################################################################

# INPUT: ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.recal.bam
# OUTPUT: ${OUTPUT}/${SAMPLE_NAME}_output_raw_snps_indels.g.vcf

java  -jar ${GATK} \
	-nct ${THREADS} \
	-R ${REF} \
	-T HaplotypeCaller \
	-I ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.recal.bam \
	--emitRefConfidence GVCF \
	-o ${OUTPUT}/${SAMPLE_NAME}_output_raw_snps_indels.g.vcf \
	> ${LOG}/${SAMPLE_NAME}_GVCF_MODE.log 2>&1

bgzip ${OUTPUT}/${SAMPLE_NAME}_output_raw_snps_indels.g.vcf

echo "GATK_HC_2 is OK"

###################################################################################
#rm -rf ${TEMP}/p33*
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.bai
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bai
rm -rf ${OUTPUT}/${SAMPLE_NAME}_metrics.txt
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.intervals
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bai
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf.idx
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.gatk.raw1.vcf
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.samtools.raw1.vcf.idx
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf.idx
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.vcf
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.vcf.idx
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.vcf
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads.bam.concordance.raw.flt1.confidence.rawlow.vcf
#rm -rf ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf
rm -rf ${OUTPUT}/${SAMPLE_NAME}_final_raw.vcf.idx
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_q1_dedup_reads.bam.realn.intervals
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bai
rm -rf ${OUTPUT}/${SAMPLE_NAME}_sorted_dedup_reads_realigned.bam.realn.bam.recal_data.grp

echo "remove unneccssary files is done"
echo "${SAMPLE_NAME} snp calling is successful "

#####################################################################################


