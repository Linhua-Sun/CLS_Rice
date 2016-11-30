trimmed_modi_SRR350693_1.fastq.bz2.gz
trimmed_modi_SRR350693_2.fastq.bz2.gz
trimmed_modi_SRR350694_1.fastq.bz2.gz
trimmed_modi_SRR350694_2.fastq.bz2.gz
trimmed_modi_SRR350696_1.fastq.bz2.gz
trimmed_modi_SRR350696_2.fastq.bz2.gz
trimmed_modi_SRR350698_1.fastq.bz2.gz
trimmed_modi_SRR350698_2.fastq.bz2.gz
trimmed_modi_SRR350699_1.fastq.bz2.gz
trimmed_modi_SRR350699_2.fastq.bz2.gz
trimmed_modi_SRR350701_1.fastq.bz2.gz
trimmed_modi_SRR350701_2.fastq.bz2.gz
trimmed_modi_SRR350707_1.fastq.bz2.gz
trimmed_modi_SRR350707_2.fastq.bz2.gz
trimmed_modi_SRR350708_1.fastq.bz2.gz
trimmed_modi_SRR350708_2.fastq.bz2.gz
trimmed_modi_SRR350709_1.fastq.bz2.gz
trimmed_modi_SRR350709_2.fastq.bz2.gz

trimmed_modi_SRR350693_1.fastq.bz2.gz
trimmed_modi_SRR350694_1.fastq.bz2.gz
trimmed_modi_SRR350696_1.fastq.bz2.gz
trimmed_modi_SRR350698_1.fastq.bz2.gz
trimmed_modi_SRR350699_1.fastq.bz2.gz
trimmed_modi_SRR350701_1.fastq.bz2.gz
trimmed_modi_SRR350707_1.fastq.bz2.gz
trimmed_modi_SRR350708_1.fastq.bz2.gz
trimmed_modi_SRR350709_1.fastq.bz2.gz

repair.sh in=trimmed_modi_SRR350693_1.fastq.bz2.gz in2=trimmed_modi_SRR350693_2.fastq.bz2.gz out=repaired_SRR350693_1.fastq.bz2.gz out2=repaired_SRR350693_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350694_1.fastq.bz2.gz in2=trimmed_modi_SRR350694_2.fastq.bz2.gz out=repaired_SRR350694_1.fastq.bz2.gz out2=repaired_SRR350694_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350696_1.fastq.bz2.gz in2=trimmed_modi_SRR350696_2.fastq.bz2.gz out=repaired_SRR350696_1.fastq.bz2.gz out2=repaired_SRR350696_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350698_1.fastq.bz2.gz in2=trimmed_modi_SRR350698_2.fastq.bz2.gz out=repaired_SRR350698_1.fastq.bz2.gz out2=repaired_SRR350698_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350699_1.fastq.bz2.gz in2=trimmed_modi_SRR350699_2.fastq.bz2.gz out=repaired_SRR350699_1.fastq.bz2.gz out2=repaired_SRR350699_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350701_1.fastq.bz2.gz in2=trimmed_modi_SRR350701_2.fastq.bz2.gz out=repaired_SRR350701_1.fastq.bz2.gz out2=repaired_SRR350701_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350707_1.fastq.bz2.gz in2=trimmed_modi_SRR350707_2.fastq.bz2.gz out=repaired_SRR350707_1.fastq.bz2.gz out2=repaired_SRR350707_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350708_1.fastq.bz2.gz in2=trimmed_modi_SRR350708_2.fastq.bz2.gz out=repaired_SRR350708_1.fastq.bz2.gz out2=repaired_SRR350708_2.fastq.bz2.gz
repair.sh in=trimmed_modi_SRR350709_1.fastq.bz2.gz in2=trimmed_modi_SRR350709_2.fastq.bz2.gz out=repaired_SRR350709_1.fastq.bz2.gz out2=repaired_SRR350709_2.fastq.bz2.gz

#!/bin/bash
#SBATCH -J repair
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH -o repair_%j.out
#SBATCH -e repair_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Oryza_brachyanthaGenome_sequencing/BZ2/MMM/brachyantha

cat model.batch xaa > xaa_model.batch
cat model.batch xab > xab_model.batch
cat model.batch xac > xac_model.batch
cat model.batch xad > xad_model.batch
cat model.batch xae > xae_model.batch
cat model.batch xaf > xaf_model.batch
cat model.batch xag > xag_model.batch
cat model.batch xah > xah_model.batch
cat model.batch xai > xai_model.batch

pkubatch xaa_model.batch
pkubatch xab_model.batch
pkubatch xac_model.batch
pkubatch xad_model.batch
pkubatch xae_model.batch
pkubatch xaf_model.batch
pkubatch xag_model.batch
pkubatch xah_model.batch
pkubatch xai_model.batch

##

filter biallelic snps

#!/bin/bash
#SBATCH -J filter
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=2
#SBATCH -o filter_%j.out
#SBATCH -e filter_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl


source ~/.bash_profile

/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter

pkubatch VCFaa__filter.batch && sleep 10s 
pkubatch VCFab__filter.batch && sleep 10s 
pkubatch VCFac__filter.batch && sleep 10s 
pkubatch VCFad__filter.batch && sleep 10s 
pkubatch VCFae__filter.batch && sleep 10s 
pkubatch VCFaf__filter.batch && sleep 10s 
pkubatch VCFag__filter.batch && sleep 10s 
pkubatch VCFah__filter.batch && sleep 10s 
pkubatch VCFai__filter.batch && sleep 10s 
pkubatch VCFaj__filter.batch && sleep 10s 
pkubatch VCFak__filter.batch && sleep 10s 
pkubatch VCFal__filter.batch && sleep 10s 
pkubatch VCFam__filter.batch && sleep 10s 
pkubatch VCFan__filter.batch && sleep 10s 
pkubatch VCFao__filter.batch && sleep 10s 
pkubatch VCFap__filter.batch && sleep 10s 
pkubatch VCFaq__filter.batch && sleep 10s 
pkubatch VCFar__filter.batch && sleep 10s 
pkubatch VCFas__filter.batch && sleep 10s 
pkubatch VCFat__filter.batch && sleep 10s 
pkubatch VCFau__filter.batch && sleep 10s 
pkubatch VCFav__filter.batch && sleep 10s 
pkubatch VCFaw__filter.batch && sleep 10s 
pkubatch VCFax__filter.batch && sleep 10s 
pkubatch VCFay__filter.batch && sleep 10s 
pkubatch VCFaz__filter.batch && sleep 10s 
pkubatch VCFba__filter.batch && sleep 10s 
pkubatch VCFbb__filter.batch && sleep 10s 
pkubatch VCFbc__filter.batch && sleep 10s 
pkubatch VCFbd__filter.batch && sleep 10s 
pkubatch VCFbe__filter.batch && sleep 10s 
pkubatch VCFbf__filter.batch && sleep 10s 
pkubatch VCFbg__filter.batch && sleep 10s 
pkubatch VCFbh__filter.batch && sleep 10s 
pkubatch VCFbi__filter.batch && sleep 10s 
pkubatch VCFbj__filter.batch && sleep 10s 
pkubatch VCFbk__filter.batch && sleep 10s 
pkubatch VCFbl__filter.batch && sleep 10s 
pkubatch VCFbm__filter.batch && sleep 10s 
pkubatch VCFbn__filter.batch && sleep 10s 
pkubatch VCFbo__filter.batch && sleep 10s 
pkubatch VCFbp__filter.batch && sleep 10s 
pkubatch VCFbq__filter.batch && sleep 10s 
pkubatch VCFbr__filter.batch && sleep 10s 
pkubatch VCFbs__filter.batch && sleep 10s 
pkubatch VCFbt__filter.batch && sleep 10s 
pkubatch VCFbu__filter.batch && sleep 10s 
pkubatch VCFbv__filter.batch && sleep 10s 
pkubatch VCFbw__filter.batch && sleep 10s 
pkubatch VCFbx__filter.batch && sleep 10s 
pkubatch VCFby__filter.batch && sleep 10s 
pkubatch VCFbz__filter.batch && sleep 10s 
pkubatch VCFca__filter.batch && sleep 10s 
pkubatch VCFcb__filter.batch && sleep 10s 
pkubatch VCFcc__filter.batch && sleep 10s 
pkubatch VCFcd__filter.batch && sleep 10s 
pkubatch VCFce__filter.batch && sleep 10s 
pkubatch VCFcf__filter.batch && sleep 10s 
pkubatch VCFcg__filter.batch && sleep 10s 
pkubatch VCFch__filter.batch && sleep 10s 
pkubatch VCFci__filter.batch && sleep 10s 
pkubatch VCFcj__filter.batch && sleep 10s 
pkubatch VCFck__filter.batch && sleep 10s 
pkubatch VCFcl__filter.batch && sleep 10s 
pkubatch VCFcm__filter.batch && sleep 10s 
pkubatch VCFcn__filter.batch && sleep 10s 
pkubatch VCFco__filter.batch && sleep 10s 
pkubatch VCFcp__filter.batch && sleep 10s 
pkubatch VCFcq__filter.batch && sleep 10s 
pkubatch VCFcr__filter.batch && sleep 10s 
pkubatch VCFcs__filter.batch && sleep 10s 
pkubatch VCFct__filter.batch && sleep 10s 
pkubatch VCFcu__filter.batch && sleep 10s 
pkubatch VCFcv__filter.batch && sleep 10s 
pkubatch VCFcw__filter.batch && sleep 10s 
pkubatch VCFcx__filter.batch && sleep 10s 
pkubatch VCFcy__filter.batch && sleep 10s 
pkubatch VCFcz__filter.batch && sleep 10s 
pkubatch VCFda__filter.batch && sleep 10s 
pkubatch VCFdb__filter.batch && sleep 10s 
pkubatch VCFdc__filter.batch && sleep 10s 
pkubatch VCFdd__filter.batch && sleep 10s 
pkubatch VCFde__filter.batch && sleep 10s 
pkubatch VCFdf__filter.batch && sleep 10s 
pkubatch VCFdg__filter.batch && sleep 10s 
pkubatch VCFdh__filter.batch && sleep 10s 
pkubatch VCFdi__filter.batch && sleep 10s 
pkubatch VCFdj__filter.batch && sleep 10s 
pkubatch VCFdk__filter.batch && sleep 10s 
pkubatch VCFdl__filter.batch && sleep 10s 
pkubatch VCFdm__filter.batch && sleep 10s 
pkubatch VCFdn__filter.batch && sleep 10s 
pkubatch VCFdo__filter.batch && sleep 10s 
pkubatch VCFdp__filter.batch && sleep 10s 
pkubatch VCFdq__filter.batch && sleep 10s 
pkubatch VCFdr__filter.batch && sleep 10s 
pkubatch VCFds__filter.batch && sleep 10s 
pkubatch VCFdt__filter.batch && sleep 10s 
pkubatch VCFdu__filter.batch && sleep 10s 
pkubatch VCFdv__filter.batch && sleep 10s 
pkubatch VCFdw__filter.batch && sleep 10s 
pkubatch VCFdx__filter.batch && sleep 10s 
pkubatch VCFdy__filter.batch && sleep 10s 
pkubatch VCFdz__filter.batch && sleep 10s 
pkubatch VCFea__filter.batch && sleep 10s 
pkubatch VCFeb__filter.batch && sleep 10s 
pkubatch VCFec__filter.batch && sleep 10s 
pkubatch VCFed__filter.batch && sleep 10s 
pkubatch VCFee__filter.batch && sleep 10s 
pkubatch VCFef__filter.batch && sleep 10s 
pkubatch VCFeg__filter.batch && sleep 10s 
pkubatch VCFeh__filter.batch && sleep 10s 
pkubatch VCFei__filter.batch && sleep 10s 
pkubatch VCFej__filter.batch && sleep 10s 
pkubatch VCFek__filter.batch && sleep 10s 
pkubatch VCFel__filter.batch && sleep 10s 
pkubatch VCFem__filter.batch && sleep 10s 
pkubatch VCFen__filter.batch && sleep 10s 
pkubatch VCFeo__filter.batch && sleep 10s 
pkubatch VCFep__filter.batch && sleep 10s 
pkubatch VCFeq__filter.batch && sleep 10s 
pkubatch VCFer__filter.batch && sleep 10s 
pkubatch VCFes__filter.batch && sleep 10s 
pkubatch VCFet__filter.batch && sleep 10s 
pkubatch VCFeu__filter.batch && sleep 10s 
pkubatch VCFev__filter.batch && sleep 10s 
pkubatch VCFew__filter.batch && sleep 10s 
pkubatch VCFex__filter.batch && sleep 10s 
pkubatch VCFey__filter.batch && sleep 10s 
pkubatch VCFez__filter.batch && sleep 10s 
pkubatch VCFfa__filter.batch && sleep 10s 
pkubatch VCFfb__filter.batch && sleep 10s 
pkubatch VCFfc__filter.batch && sleep 10s 
pkubatch VCFfd__filter.batch && sleep 10s 


##

ERR069043


/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/longistaminata__DRR000464_raw.vcf_BIALLELIC_SNPs.vcf.gz
/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/longistaminata__DRR000463_raw.vcf_BIALLELIC_SNPs.vcf.gz



## /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/brachyantha


/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Oryza_brachyanthaGenome_sequencing/BZ2/MMM/brachyantha/brachyantha_sorted_dedup_reads_realigned.bam.recal.bam


ln -s /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/longistaminata__DRR000464_raw.vcf_BIALLELIC_SNPs.vcf.gz* .
ln -s /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/brachyantha/brachyantha_raw.vcf_BIALLELIC_SNPs.vcf.gz* .
ln -s /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/ddbj/COM/BAM/longistaminata__DRR000463_raw.vcf_BIALLELIC_SNPs.vcf.gz* .

#!/bin/bash
#SBATCH -J filter
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=2
#SBATCH -o filter_%j.out
#SBATCH -e filter_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl


source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter
SNP_QC_Filter.sh brachyantha_raw.vcf_BIALLELIC_SNPs.vcf.gz

SNP_QC_Filter.sh longistaminata__DRR000464_raw.vcf_BIALLELIC_SNPs.vcf.gz
SNP_QC_Filter.sh longistaminata__DRR000463_raw.vcf_BIALLELIC_SNPs.vcf.gz


