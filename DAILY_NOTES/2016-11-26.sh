

## 2016.11.25
1. 使用rufipogon进行测试

Location： `/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/POST_Biallelic_SNP_QC/VCF/Rufipogon`

plink vcf 2 bed

```
#!/bin/bash
#SBATCH -J chr01_plink_vcf2ped
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o chr01_plink_vcf2ped_%j.out
#SBATCH -e chr01_plink_vcf2ped_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/LAST_/VCF2PLINK

plink  \
--vcf 6K_chr01.vcf.gz \
--make-bed \
--const-fid \
--biallelic-only strict \
--allow-no-sex \
--set-missing-var-ids @:#[IRGSP1.0]\$1,\$2 \
--keep-allele-order \
--out 6K_chr01_plink
```

```
#!/bin/bash
#SBATCH -J merge
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o merge_%j.out
#SBATCH -e merge_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/LAST_/VCF2PLINK

plink --bfile 6K_chr01_plink --merge-list 6K.list --make-bed --out merged_6K_all_chr
```


2. `/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW`



`seqtk trimfq  SRR1264538_1.fastq.gz > trimed_SRR1264538_1.fastq.gz`

seqtk trimfq SRR1264538_1.fastq.gz | gzip -c > trimed_SRR1264538_1.fastq.gz &
seqtk trimfq SRR1264538_2.fastq.gz | gzip -c > trimed_SRR1264538_2.fastq.gz &
seqtk trimfq SRR1712968_1.fastq.gz | gzip -c > trimed_SRR1712968_1.fastq.gz &
seqtk trimfq SRR1712968_2.fastq.gz | gzip -c > trimed_SRR1712968_2.fastq.gz &
seqtk trimfq SRR1712969_1.fastq.gz | gzip -c > trimed_SRR1712969_1.fastq.gz &
seqtk trimfq SRR1712969_2.fastq.gz | gzip -c > trimed_SRR1712969_2.fastq.gz &
seqtk trimfq SRR1712970_1.fastq.gz | gzip -c > trimed_SRR1712970_1.fastq.gz &
seqtk trimfq SRR1712970_2.fastq.gz | gzip -c > trimed_SRR1712970_2.fastq.gz &
seqtk trimfq SRR1997915_1.fastq.gz | gzip -c > trimed_SRR1997915_1.fastq.gz &
seqtk trimfq SRR1997915_2.fastq.gz | gzip -c > trimed_SRR1997915_2.fastq.gz &

#!/bin/bash

ID=$(basename ${1} _1.fastq.gz)

REF="/data1/linhua/Hang_Rice_Data/REFERENCE_GENOME/IRGSP-1.0_genome.fasta"

THREADS=20
MEMORY=64GB

bwa aln -t 20 ${REF} ${ID}_1.fastq.gz >  ${ID}_1.sai
bwa aln -t 20 ${REF} ${ID}_2.fastq.gz >  ${ID}_2.sai

bwa sampe -r "@RG\tID:${ID}\tSM:${ID}\tLB:${ID}\tPL:ILLUMINA\tPU:run" ${REF} ${ID}_1.sai ${ID}_2.sai ${ID}_1.fastq.gz ${ID}_2.fastq.gz > ${ID}.sam

samtools view -@ ${THREADS} -h ${ID}.sam | samtools view -@ ${THREADS} -bq 20 | sambamba sort -t ${THREADS} -m ${MEMORY} -o ${ID}_sorted_q20.bam /dev/stdin

##

SRR1712968_1.fastq.gz
SRR1712969_1.fastq.gz
SRR1712970_1.fastq.gz
trimed_SRR1264538_1.fastq.gz
trimed_SRR1997915_1.fastq.gz

## 
#!/bin/bash
#SBATCH -J bwa_aln
#SBATCH -p cn-short
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o bwa_aln_%j.out
#SBATCH -e bwa_aln_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcns

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/short_ends

sh mapping.sh SRR1712968_1.fastq.gz
sh mapping.sh SRR1712969_1.fastq.gz
sh mapping.sh SRR1712970_1.fastq.gz
sh mapping.sh trimed_SRR1264538_1.fastq.gz
sh mapping.sh trimed_SRR1997915_1.fastq.gz

sbatch 2.batch
sbatch 3.batch
sbatch 4.batch
sbatch 5.batch

## 
/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Long_reads

mv SRR1264536_1.fastq.gz SRR1264536
mv SRR1264536_2.fastq.gz SRR1264536
mv SRR1264537_1.fastq.gz SRR1264537
mv SRR1264537_2.fastq.gz SRR1264537
mv SRR1264539_1.fastq.gz SRR1264539
mv SRR1264539_2.fastq.gz SRR1264539
mv SRR1997912_1.fastq.gz SRR1997912
mv SRR1997912_2.fastq.gz SRR1997912

## model.batch 

```
#!/bin/bash
#SBATCH -J GATK
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o GATK_%j.out
#SBATCH -e GATK_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

sh /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Long_reads/3K_GATK_final_cns.sh /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Long_reads/SRR1264539
```

## 

/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/Long_reads

# 使用GATK call SNP（这些测序数据的reads长度较长）

## /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/EBI_NEW/short_ends/SRX809898

分散数据 合并数据 得到BAM files 之后 再进行GATK的流程


