#!/bin/bash
#SBATCH -J filter
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o filter_%j.out
#SBATCH -e filter_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl


source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA

less -S merged.vcf.gz |vcfbiallelic|bgzip -c > filtered_merged.vcf.gz

tabix -p vcf filtered_merged.vcf.gz

#!/bin/bash
#SBATCH -J plink
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o plink_%j.out
#SBATCH -e plink_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA

plink  \
--vcf filtered_merged.vcf.gz \
--make-bed \
--const-fid \
--biallelic-only strict \
--allow-no-sex \
--set-missing-var-ids @:#[IRGSP1.0]\$1,\$2 \
--keep-allele-order \
--out 128_rice

#!/bin/bash
#SBATCH -J plink
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o plink_%j.out
#SBATCH -e plink_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA

plink  \
--vcf merged.vcf.gz \
--make-bed \
--const-fid \
--biallelic-only strict \
--allow-no-sex \
--set-missing-var-ids @:#[IRGSP1.0]\$1,\$2 \
--keep-allele-order \
--out test

#!/bin/bash
#SBATCH -J plink0.5
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o plink_%j.out
#SBATCH -e plink_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/BAM/test_bam/VCF_filter/AA

plink --bfile test1 --geno 0.5 --make-bed --out test1_missing_0.5
plink --bfile test1_missing_0.5 --freq --out test1_missing_0.5_freq
plink --bfile test1_missing_0.5 --missing --out test1_missing_0.5_missing

plink --bfile test1 --geno 0.2 --make-bed --out test1_missing_0.2
plink --bfile test1_missing_0.2 --freq --out test1_missing_0.2_freq
plink --bfile test1_missing_0.2 --missing --out test1_missing_0.2_missing

plink --bfile test1 --geno 0.1 --make-bed --out test1_missing_0.1
plink --bfile test1_missing_0.1 --freq --out test1_missing_0.1_freq
plink --bfile test1_missing_0.1 --missing --out test1_missing_0.1_missing




plink --bfile test1 --missing --out test1_missing

bcftools index merged.vcf.gz

plink --bfile test --update-ids update-ids.txt --make-bed --out test1

plink --bfile test1 --freq --out test1_freq

plink --bfile test1 --missing --out test1_missing

Rscript single_density.R test1_missing.lmiss F_MISS

Rscript single_density.R test1_missing.lmiss N_MISS


meridionalis__ERR069045
longistaminata__ERR069041
punctata__SRR1264539
longistaminata__ERR069042
meridionalis__ERR069047
meridionalis__SRX809898
meridionalis__ERR069043
glumaepatula__SRX809892
meridionalis__ERR069044

barthii<-as.character(subset(label,label$V1=="barthii")$V2)
glaberrima<-as.character(subset(label,label$V1=="glaberrima")$V2)
glumaepatula<-as.character(subset(label,label$V1=="glumaepatula")$V2)
longistaminata<-as.character(subset(label,label$V1=="longistaminata")$V2)
meridionalis<-as.character(subset(label,label$V1=="meridionalis")$V2)
rufipogon-I<-as.character(subset(label,label$V1=="rufipogon-I")$V2)
rufipogon-II<-as.character(subset(label,label$V1=="rufipogon-II")$V2)
rufipogon-III<-as.character(subset(label,label$V1=="rufipogon-III")$V2)
sativa_ADM<-as.character(subset(label,label$V1=="sativa_ADM")$V2)
sativa_ARO<-as.character(subset(label,label$V1=="sativa_ARO")$V2)
sativa_AUS<-as.character(subset(label,label$V1=="sativa_AUS")$V2)
sativa_IND<-as.character(subset(label,label$V1=="sativa_IND")$V2)
sativa_JAP<-as.character(subset(label,label$V1=="sativa_JAP")$V2)
sativa_TEMP<-as.character(subset(label,label$V1=="sativa_TEMP")$V2)
sativa_TROP<-as.character(subset(label,label$V1=="sativa_TROP")$V2)
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15

barthii<-paste("barthii",barthii,sep="__")
glaberrima<-paste("glaberrima",glaberrima,sep="__")
glumaepatula<-paste("glumaepatula",glumaepatula,sep="__")
longistaminata<-paste("longistaminata",longistaminata,sep="__")
meridionalis<-paste("meridionalis",meridionalis,sep="__")
rufipogon-I<-paste("rufipogon-I",rufipogon-I,sep="__")
rufipogon-II<-paste("rufipogon-II",rufipogon-II,sep="__")
rufipogon-III<-paste("rufipogon-III",rufipogon-III,sep="__")
sativa_ADM<-paste("sativa_ADM",sativa_ADM,sep="__")
sativa_ARO<-paste("sativa_ARO",sativa_ARO,sep="__")
sativa_AUS<-paste("sativa_AUS",sativa_AUS,sep="__")
sativa_IND<-paste("sativa_IND",sativa_IND,sep="__")
sativa_JAP<-paste("sativa_JAP",sativa_JAP,sep="__")
sativa_TEMP<-paste("sativa_TEMP",sativa_TEMP,sep="__")
sativa_TROP<-paste("sativa_TROP",sativa_TROP,sep="__")



barthii    	  <-  str_subset(string = test$tip.label,pattern = "barthii")
glaberrima    <-  str_subset(string = test$tip.label,pattern = "glaberrima")
glumaepatula  <-  str_subset(string = test$tip.label,pattern = "glumaepatula")
longistaminata<-  str_subset(string = test$tip.label,pattern = "longistaminata")
meridionalis  <-  str_subset(string = test$tip.label,pattern = "meridionalis")
rufipogon-I   <-  str_subset(string = test$tip.label,pattern = "rufipogon-I")
rufipogon-II  <-  str_subset(string = test$tip.label,pattern = "rufipogon-II")
rufipogon-III <-  str_subset(string = test$tip.label,pattern = "rufipogon-III")
sativa_ADM    <-  str_subset(string = test$tip.label,pattern = "sativa_ADM")
sativa_ARO    <-  str_subset(string = test$tip.label,pattern = "sativa_ARO")
sativa_AUS    <-  str_subset(string = test$tip.label,pattern = "sativa_AUS")
sativa_IND    <-  str_subset(string = test$tip.label,pattern = "sativa_IND")
sativa_JAP    <-  str_subset(string = test$tip.label,pattern = "sativa_JAP")
sativa_TEMP   <-  str_subset(string = test$tip.label,pattern = "sativa_TEMP")
sativa_TROP   <-  str_subset(string = test$tip.label,pattern = "sativa_TROP")

barthii
glaberrima
glumaepatula
longistaminata
meridionalis
rufipogon-I
rufipogon-II
rufipogon-III
sativa_ADM
sativa_ARO
sativa_AUS
sativa_IND
sativa_JAP
sativa_TEMP
sativa_TROP

gr<-list(
    barthii,
    glaberrima,
    glumaepatula,
    longistaminata,
    meridionalis,
    rufipogon_I,
    rufipogon_II,
    rufipogon_III,
    sativa_ADM,
    sativa_ARO,
    sativa_AUS,
    sativa_IND,
    sativa_JAP,
    sativa_TEMP,
    sativa_TROP)


/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW//ddbj/COM/longistaminata__DRR000463/longistaminata__DRR000463_sorted_dedup_reads_realigned.bam.recal.bam
/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW//ddbj/COM/longistaminata__DRR000464/longistaminata__DRR000464_sorted_dedup_reads_realigned.bam.recal.bam
/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW//Oryza_brachyanthaGenome_sequencing/BZ2/MMM/brachyantha/brachyantha_sorted_dedup_reads_realigned.bam.recal.bam


#!/bin/bash

THREADS=20
REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"
GATK="/lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/GATK/GenomeAnalysisTK.jar"
TEMP="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/New_CALL/TEMP"
INPUT=$(cat input.txt)
#===========================================================================================================


java -Djava.io.tmpdir=${TEMP} -Xmx48G -jar ${GATK} \
       	-R ${REF} \
       	-nct ${THREADS} \
       	-T HaplotypeCaller \
       	--genotyping_mode DISCOVERY \
       	${INPUT} \
       	-L chr01 \
       	-o chr01_oryza_raw.vcf \
       	--read_filter BadCigar \
       	-stand_call_conf 30.0 \
       	-stand_emit_conf 10 \
       	> chr01_raw.log 2>&1

sh /lustre1/deng_pkuhpc/slh_RICE_data/SOFTWARE/BIN/extract_BIALLELIC_SNPs.sh chr01_oryza_raw.vcf


#!/bin/bash
#SBATCH -J get
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o get_%j.out
#SBATCH -e get_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl


source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/New_CALL




