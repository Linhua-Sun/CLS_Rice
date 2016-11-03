#!/bin/bash
#SBATCH -J chr11_Geno
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o chr11_Geno_%j.out
#SBATCH -e chr11_Geno_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/LAST_/combine_6K

GVCFS=`find ./ -name "*.g.vcf.gz" -print |xargs -I GVCF_FILE echo -n "-V GVCF_FILE "`

java -Djava.io.tmpdir=/lustre1/deng_pkuhpc/slh_RICE_data/Genotyping_GVCFs/LAST/TEMP/ -jar /lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/GATK/GenomeAnalysisTK.jar \
	-R /lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta \
	-T GenotypeGVCFs \
	-nt 20 \
	-L chr11 \
	-o 6K_chr11.vcf.gz \
	${GVCFS} \
	> 6K_chr11.log 2>&1
