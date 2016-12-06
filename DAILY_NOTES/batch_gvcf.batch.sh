#!/bin/bash
#SBATCH -J chr01_get
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o chr01_get_%j.out
#SBATCH -e chr01_get_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

WORKDIR="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/INDICA"

## ONLY PLACE NEED TO CHANGE

REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"
GATK="/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/GATK/GenomeAnalysisTK.jar"

cd ${WORKDIR}

GVCFS=`find ./ -name "*.g.vcf.gz" -print |xargs -I GVCF_FILE echo -n "-V GVCF_FILE "`

java -Djava.io.tmpdir=/lustre1/deng_pkuhpc/slh_RICE_data/TEMP \
	-jar ${GATK} \
	-R ${REF} \
	-T GenotypeGVCFs \
	-nt 20 \
	-L chr01 \
	-o chr01_joint_genotyping.vcf.gz \
	${GVCFS} \
	> chr01_joint_genotyping.vcf.gz.log 2>&1

echo "Joint Genotyping is finished!!!"

## extract_BIALLELIC_SNPs.sh == Only will extract biallelic snps from raw variants files. 
### output ${1}_BIALLELIC_SNPs.vcf.gz

/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/BIN/extract_BIALLELIC_SNPs.sh chr01_joint_genotyping.vcf.gz

echo "biallelic snps have been extracted!!!"

## Filter biallelic snps 
### output == ${1}_concordance_flt_snp_final_all.vcf.gz (New ${1})

/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/BIN/SNP_QC_Filter.sh chr01_joint_genotyping.vcf.gz_BIALLELIC_SNPs.vcf.gz

echo "biallelic snps have been filtered according to GATK Best practise!!!"
## VCF --- plink bed

plink  \
--vcf chr01_joint_genotyping.vcf.gz_BIALLELIC_SNPs.vcf.gz \
--make-bed \
--const-fid \
--biallelic-only strict \
--allow-no-sex \
--set-missing-var-ids @:#[IRGSP1.0]\$1,\$2 \
--keep-allele-order \
--out chr01_plink


plink --bfile chr01_plink --missing --out chr01_plink_miss

plink --bfile chr01_plink --freq    --out chr01_plink_freq

plink --bfile chr01_plink --geno 0.5 --make-bed --out chr01_plink_missing_0.5
plink --bfile chr01_plink_missing_0.5 --freq --out chr01_plink_missing_0.5_freq
plink --bfile chr01_plink_missing_0.5 --missing --out chr01_plink_missing_0.5_missing

plink --bfile chr01_plink --geno 0.2 --make-bed --out chr01_plink_missing_0.2
plink --bfile chr01_plink_missing_0.2 --freq --out chr01_plink_missing_0.2_freq
plink --bfile chr01_plink_missing_0.2 --missing --out chr01_plink_missing_0.2_missing

plink --bfile chr01_plink --geno 0.1 --make-bed --out chr01_plink_missing_0.1
plink --bfile chr01_plink_missing_0.1 --freq --out chr01_plink_missing_0.1_freq
plink --bfile chr01_plink_missing_0.1 --missing --out chr01_plink_missing_0.1_missing