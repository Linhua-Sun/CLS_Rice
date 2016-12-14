ddm1/cCol_0
met1/cCol_0
mom1/cCol_0
morc6/cCol_0
nCol_0/cCol_0
nrpd1/cCol_0
nrpe1/cCol_0
rdd/cCol_0

ddm1
met1
mom1
morc6
nCol_0
nrpd1
nrpe1
rdd

awk '{print $1}' 0638_tophat2_name.bam_TEtx.cntTable > features_counts.txt
awk '{print $2}' 0638_tophat2_name.bam_TEtx.cntTable > 0638_counts.txt
awk '{print $2}' 0971_tophat2_name.bam_TEtx.cntTable > 0971_counts.txt
awk '{print $2}' 0972_tophat2_name.bam_TEtx.cntTable > 0972_counts.txt
awk '{print $2}' 0973_tophat2_name.bam_TEtx.cntTable > 0973_counts.txt
awk '{print $2}' 1057_tophat2_name.bam_TEtx.cntTable > 1057_counts.txt
awk '{print $2}' 1058_tophat2_name.bam_TEtx.cntTable > 1058_counts.txt
awk '{print $2}' 1059_tophat2_name.bam_TEtx.cntTable > 1059_counts.txt
awk '{print $2}' 1060_tophat2_name.bam_TEtx.cntTable > 1060_counts.txt

paste features_counts.txt \
0638_counts.txt \
0971_counts.txt \
0972_counts.txt \
0973_counts.txt \
1057_counts.txt \
1058_counts.txt \
1059_counts.txt \
1060_counts.txt > 8_samples_ncol_counts.txt

#!/bin/bash

GTF="/data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gtf"

ID=$(basename ${1} .bam)

echo "Note: the bam file must be sorted by name!"
echo "GTF files downloaded from Araport11"

verse -T 10 --multithreadDecompress -Q 20 -a ${GTF} \
-t 'exon' \
-g gene_id \
-z 2 \
-s 2 \
-o ${ID}_exon_z2_s2_$(date +%F) \
${ID}.bam \
> ${ID}_exon_z2_s2_$(date +%F).log 2>&1

#http://kim.bio.upenn.edu/software/verse_manual.html
#-t <input>  Specify the feature type. Only rows which have the matched
#            feature type in the provided GTF annotation file will be included
#            for read counting. 'exon' by default.
#            Providing a list of feature types (e.g., -t 'exon;intron;mito')
#            will automatically enter hierarchical_assign mode. If the user
#            wants to assign independently for each feature type, please
#            specify '--assignIndependently'. Use -Z to check the details.
#
#-g <input>  Specify the gene_identifier attribute, which is normally 'gene_id'
#-z <int>    The Running Mode: 0 by default (featureCounts), 1 (HTSeq-Union),
#             2 (HTSeq-Intersection_strict), 3 (HTSeq-Intersection_nonempty),
#             4 (Union_strict), 5 (Cover_length).
#            Please refer to the manual or use '-Z' to check the details of
#            each mode.
#-s <int>    Indicate if strand-specific read counting should be performed.
#			 It has three possible values:  0 (unstranded), 1 (stranded) and
#			 2 (reversely stranded). 0 by default.
#            or 'gene_name'. 'gene_id' by default.



#!/bin/sh

sh verse_batch.sh 0637_tophat2_name.bam 
sh verse_batch.sh 0638_tophat2_name.bam 
sh verse_batch.sh 0971_tophat2_name.bam 
sh verse_batch.sh 0972_tophat2_name.bam 
sh verse_batch.sh 0973_tophat2_name.bam 
sh verse_batch.sh 1057_tophat2_name.bam 
sh verse_batch.sh 1058_tophat2_name.bam 
sh verse_batch.sh 1059_tophat2_name.bam 
sh verse_batch.sh 1060_tophat2_name.bam 


#
#!/bin/bash

GTF="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/DIFF/versr_quant-2016-12-14/gene_Arabidopsis_thaliana.TAIR10.34.gtf"

ID=$(basename ${1} .bam)

echo "Note: the bam file must be sorted by name!"
echo "GTF files downloaded from Araport11"

verse -T 4 --multithreadDecompress -Q 20 -a ${GTF} \
-t 'gene' \
-g gene_id \
-z 2 \
-s 2 \
-o ${ID}_gene_z2_s2_$(date +%F) \
${ID}.bam \
> ${ID}_gene_z2_s2_$(date +%F).log 2>&1

