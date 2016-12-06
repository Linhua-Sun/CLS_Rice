freebayes -f ref.fa aln.bam >var.vcf

#Parallel operation (use 36 cores in this case):

freebayes-parallel <(fasta_generate_regions.py ref.fa.fai 100000) 36 \
    -f ref.fa aln.bam >var.vcf

    -L --bam-list

       --populations FILE
                   Each line of FILE should list a sample and a population which
                   it is part of.  The population-based bayesian inference model
                   will then be partitioned on the basis of the populations.

                   -v --vcf FILE   Output VCF-format results to FILE. (default: stdout)







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

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/New_CALL/FREE_recall

REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"

samtools mpileup -ugf ${REF} --bam-list BAM_LIST.txt -r chr01 | bcftools call -vmO z -o chr01_oryza.vcf.gz

sed "s/chr01/chr02/g" model.sh > chr02_get_samtools.batch
sed "s/chr01/chr03/g" model.sh > chr03_get_samtools.batch
sed "s/chr01/chr04/g" model.sh > chr04_get_samtools.batch
sed "s/chr01/chr05/g" model.sh > chr05_get_samtools.batch
sed "s/chr01/chr06/g" model.sh > chr06_get_samtools.batch
sed "s/chr01/chr07/g" model.sh > chr07_get_samtools.batch
sed "s/chr01/chr08/g" model.sh > chr08_get_samtools.batch
sed "s/chr01/chr09/g" model.sh > chr09_get_samtools.batch
sed "s/chr01/chr10/g" model.sh > chr10_get_samtools.batch
sed "s/chr01/chr11/g" model.sh > chr11_get_samtools.batch
sed "s/chr01/chr12/g" model.sh > chr12_get_samtools.batch

sbatch chr02_get_samtools.batch && sleep 5s
sbatch chr03_get_samtools.batch && sleep 5s
sbatch chr04_get_samtools.batch && sleep 5s
sbatch chr05_get_samtools.batch && sleep 5s
sbatch chr06_get_samtools.batch && sleep 5s
sbatch chr07_get_samtools.batch && sleep 5s
sbatch chr08_get_samtools.batch && sleep 5s
sbatch chr09_get_samtools.batch && sleep 5s
sbatch chr10_get_samtools.batch && sleep 5s
sbatch chr11_get_samtools.batch && sleep 5s
sbatch chr12_get_samtools.batch && sleep 5s

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

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/New_CALL/FREE_recall

REF="/lustre1/deng_pkuhpc/slh_RICE_data/REFERENCE_GENOME/REF/IRGSP-1.0_genome.fasta"
INPUT=$(cat BAM_LIST.txt | tr "\n" " ")
THREADS=20
TEMP="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/New_CALL/FREE_recall/TEMP"

sambamba mpileup \
       -t ${THREADS} --tmpdir=${TEMP}  -o oryza_sambamba.vcf \
       ${INPUT} \
       --samtools -ugf ${REF} \
       --bcftools call -vm \
       > oryza_sambamba.log 2>&1


bgzip oryza_sambamba.vcf && tabix -p vcf oryza_sambamba.vcf.gz



_output_raw_snps_indels.g.vcf.gz

#!/bin/bash
#SBATCH -J find
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -o find_%j.out
#SBATCH -e find_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06

sh find.sh > results_find_gvcf.txt
###############################################################################

#!/bin/bash
#SBATCH -J index
#SBATCH -p cn-long
#SBATCH -N 1
#SBATCH --ntasks-per-node=20
#SBATCH -o index_%j.out
#SBATCH -e index_%j.err
#SBATCH --no-requeue
#SBATCH -A deng_g1
#SBATCH --qos=dengcnl

source ~/.bash_profile

cd /lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/TEST

#!/bin/bash

PATH="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/TEST"
NODE="cn-long"
NODEX="dengcnl"
THREADS=1

for sample in *.g.vcf.gz
do
	echo "#!/bin/bash" 								> "$sample"_up.batch
	echo "#SBATCH -J ${sample}"						>>"$sample"_up.batch
	echo "#SBATCH -p ${NODE}" 						>>"$sample"_up.batch
	echo "#SBATCH -N 1" 							>>"$sample"_up.batch
	echo "#SBATCH --ntasks-per-node=${THREADS}" 	>>"$sample"_up.batch
	echo "#SBATCH -o ${sample}_%j.out" 				>>"$sample"_up.batch
	echo "#SBATCH -e ${sample}_%j.err" 				>>"$sample"_up.batch
	echo "#SBATCH --no-requeue" 					>>"$sample"_up.batch
	echo "#SBATCH -A deng_g1" 						>>"$sample"_up.batch
	echo "#SBATCH --qos=${NODEX}" 					>>"$sample"_up.batch
	echo "source ~/.bash_profile" 					>>"$sample"_up.batch
	echo "cd ${PATH}" 								>>"$sample"_up.batch
	echo "tabix -p vcf ${sample}"  >>"$sample"_up.batch
done	

for i in SRR*.batch;do echo pkubatch ${i} \&\& sleep 2s ;done > up.sh

## ----

cp chr01_batch_get_snp.batch chr02_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr03_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr04_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr05_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr06_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr07_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr08_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr09_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr10_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr11_batch_get_snp.batch
cp chr01_batch_get_snp.batch chr12_batch_get_snp.batch

sed -i "s/chr01/chr02/g" chr02_batch_get_snp.batch
sed -i "s/chr01/chr03/g" chr03_batch_get_snp.batch
sed -i "s/chr01/chr04/g" chr04_batch_get_snp.batch
sed -i "s/chr01/chr05/g" chr05_batch_get_snp.batch
sed -i "s/chr01/chr06/g" chr06_batch_get_snp.batch
sed -i "s/chr01/chr07/g" chr07_batch_get_snp.batch
sed -i "s/chr01/chr08/g" chr08_batch_get_snp.batch
sed -i "s/chr01/chr09/g" chr09_batch_get_snp.batch
sed -i "s/chr01/chr10/g" chr10_batch_get_snp.batch
sed -i "s/chr01/chr11/g" chr11_batch_get_snp.batch
sed -i "s/chr01/chr12/g" chr12_batch_get_snp.batch

sbatch chr02_batch_get_snp.batch && sleep 2s 
sbatch chr03_batch_get_snp.batch && sleep 2s
sbatch chr04_batch_get_snp.batch && sleep 2s
sbatch chr05_batch_get_snp.batch && sleep 2s
sbatch chr06_batch_get_snp.batch && sleep 2s
sbatch chr07_batch_get_snp.batch && sleep 2s
sbatch chr08_batch_get_snp.batch && sleep 2s
sbatch chr09_batch_get_snp.batch && sleep 2s
sbatch chr10_batch_get_snp.batch && sleep 2s

sed -i "s/dengcnl/dengcns/g;s/cn-long/cn-short/g" chr11_batch_get_snp.batch
sed -i "s/dengcnl/dengcns/g;s/cn-long/cn-short/g" chr12_batch_get_snp.batch
