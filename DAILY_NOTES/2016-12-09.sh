plink --bfile renamed_merged_oryza_maf_05 --maf 0.05 --geno 0.2 --remove remove_list.txt --make-bed --out oryza_OK

single_copy_gene.txt

#!/bin/bash
for i in $(cat sgaa)
do
	Rscript extract_gene_snps.R oryza_OK ${i}
done


sed "s/sgaa/sgab/g" aa.batch > ab.batch
sed "s/sgaa/sgac/g" aa.batch > ac.batch
sed "s/sgaa/sgad/g" aa.batch > ad.batch
sed "s/sgaa/sgae/g" aa.batch > ae.batch
sed "s/sgaa/sgaf/g" aa.batch > af.batch
sed "s/sgaa/sgag/g" aa.batch > ag.batch
sed "s/sgaa/sgah/g" aa.batch > ah.batch
sed "s/sgaa/sgai/g" aa.batch > ai.batch
sed "s/sgaa/sgaj/g" aa.batch > aj.batch
sed "s/sgaa/sgak/g" aa.batch > ak.batch
sed "s/sgaa/sgal/g" aa.batch > al.batch
sed "s/sgaa/sgam/g" aa.batch > am.batch
sed "s/sgaa/sgan/g" aa.batch > an.batch

nohup sh ab.batch &
nohup sh ac.batch &
nohup sh ad.batch &
nohup sh ae.batch &
nohup sh af.batch &
nohup sh ag.batch &
nohup sh ah.batch &
nohup sh ai.batch &
nohup sh aj.batch &
nohup sh ak.batch &
nohup sh al.batch &
nohup sh am.batch &
nohup sh an.batch &

mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1057_tophat_align/accepted_hits.bam	1057_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1059_tophat_align/accepted_hits.bam	1059_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1060_tophat_align/accepted_hits.bam	1060_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-972_tophat_align/accepted_hits.bam	0972_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-973_tophat_align/accepted_hits.bam	0973_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-971_tophat_align/accepted_hits.bam	0971_tophat2.bam
mv /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1058_tophat_align/accepted_hits.bam	1058_tophat2.bam

sambamba index -t 10 1057_tophat2.bam
sambamba index -t 10 1059_tophat2.bam
sambamba index -t 10 1060_tophat2.bam
sambamba index -t 10 0972_tophat2.bam
sambamba index -t 10 0973_tophat2.bam
sambamba index -t 10 0971_tophat2.bam
sambamba index -t 10 1058_tophat2.bam

ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/637_align_accepted_hits.bam  .
ln -s /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/638_align_accepted_hits.bam .

637_align_accepted_hits.bam
637_align_accepted_hits.bam.bai
638_align_accepted_hits.bam
638_align_accepted_hits.bam.bai

mv 637_tophat2.bam 0637_tophat2.bam
mv 637_tophat2.bam.bai 0637_tophat2.bam.bai
mv 638_tophat2.bam 0638_tophat2.bam
mv 638_tophat2.bam.bai 0638_tophat2.bam.bai




0637_tophat2.bam
0637_tophat2.bam.bai
0638_tophat2.bam
0638_tophat2.bam.bai

cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1057_tophat_align/align_summary.txt    1057_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1058_tophat_align/align_summary.txt    1058_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1059_tophat_align/align_summary.txt    1059_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-1060_tophat_align/align_summary.txt    1060_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-971_tophat_align/align_summary.txt      971_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-972_tophat_align/align_summary.txt      972_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/QC/trimmed_BN2-973_tophat_align/align_summary.txt      973_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/637_align/align_summary.txt    				  637_align_summary.txt
cp /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/638_align/align_summary.txt    				  638_align_summary.txt

#!/bin/bash

# Linhua Sun
# usage: sh the_script.sh `pwd`(path)

if [ $# -ne 1 ]
then
       	echo "Please add a vcf.gz file!"
       	exit 0
fi

cd ${1}

THREADS=12


OUTDIR="./diffout-$(date +%F)"

Reference_Genome="/data1/linhua/QIANLAB/TAIR10/1/Arabidopsis_thaliana/Ensembl/TAIR10/Sequence/Bowtie2Index/genome.fa"

GFF="/data1/linhua/QIANLAB/TAIR10/1/Arabidopsis_thaliana/Ensembl/TAIR10/Annotation/Archives/archive-2015-07-17-14-28-46/Genes/genes_known.gff"

if [ ! -d ${OUTDIR} ]
       	then mkdir -p ${OUTDIR}
fi

       	cuffdiff \
       	-o ${OUTDIR} \
       	-u \
       	-label nCol-0,ddm1,nrpd1,nrpe1,morc6,rdd,met1,mom1,cCol-0 \
       	-p ${THREADS} \
       	-b ${Reference_Genome} ${GFF} \
       	0637_tophat2.bam \
		0638_tophat2.bam \
		0971_tophat2.bam \
		0972_tophat2.bam \
		0973_tophat2.bam \
		1057_tophat2.bam \
		1058_tophat2.bam \
		1059_tophat2.bam \
		1060_tophat2.bam  



0637_tophat2.bam \	nCol-0
0638_tophat2.bam \	ddm1
0971_tophat2.bam \	nrpd1 	
0972_tophat2.bam \	nrpe1
0973_tophat2.bam \	morc6
1057_tophat2.bam \	rdd
1058_tophat2.bam \	met1
1059_tophat2.bam \	mom1
1060_tophat2.bam  	cCol-0

0637
0638
0971
0972
0973
1057
1058
1059
1060

nCol-0,ddm1,nrpd1,nrpe1,morc6,rdd,met1,mom1,cCol-0

#!/bin/bash
#https://github.com/mhammell-laboratory/tetoolkit

GENE="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/TE_reanalysis/TAIR10_protein_coding.gff"
TE="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/TOPHAT_MAPPING_TEST/TOPHAT2_POST/DENOVO/TE_reanalysis/TAIR10_TE.gtf"

TEtranscripts --format BAM \
--stranded reverse \
--mode multi \
-t 638_name.bam \
-c 637_name.bam \
--GTF ${GENE} \
--TE ${TE} \
--project sample_nosort_test_strand_3

