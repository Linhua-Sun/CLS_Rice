chr02_plink_missing_0.5
chr03_plink_missing_0.5
chr04_plink_missing_0.5
chr05_plink_missing_0.5
chr06_plink_missing_0.5
chr07_plink_missing_0.5
chr08_plink_missing_0.5
chr09_plink_missing_0.5
chr10_plink_missing_0.5
chr11_plink_missing_0.5
chr12_plink_missing_0.5

plink --bfile reference --merge-list merge_list.txt

#!/bin/bash
#SBATCH -J get
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o get_%j.out
#SBATCH -e get_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/137/PLINK_50

plink --bfile chr01_plink_missing_0.5 --merge-list m.list --make-bed --out merged_oryza

/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA/Old_samples_ID.txt
/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA/New_samples_ID.txt