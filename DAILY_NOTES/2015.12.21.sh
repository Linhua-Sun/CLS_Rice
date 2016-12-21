mv Tophat_unstrand_Col-0.bam.bai Col-0.bam.bai
mv uniqmap_0637.bam.bai          nCol-0.bam.bai
mv uniqmap_0638.bam.bai          ddm1.bam.bai
mv uniqmap_0971.bam.bai          nrpd1.bam.bai
mv uniqmap_0972.bam.bai          nrpe1.bam.bai
mv uniqmap_0973.bam.bai          morc6.bam.bai
mv uniqmap_1057.bam.bai          rdd.bam.bai
mv uniqmap_1058.bam.bai          met1.bam.bai
mv uniqmap_1059.bam.bai          mom1.bam.bai
mv uniqmap_1060.bam.bai          cCol-0.bam.bai


mv Tophat_unstrand_Col-0.bam.bai Col-0.bam.bai
mv uniqmap_0637.bam.bai          nCol-0.bam.bai
mv uniqmap_0638.bam.bai          ddm1.bam.bai
mv uniqmap_0971.bam.bai          nrpd1.bam.bai
mv uniqmap_0972.bam.bai          nrpe1.bam.bai
mv uniqmap_0973.bam.bai          morc6.bam.bai
mv uniqmap_1057.bam.bai          rdd.bam.bai
mv uniqmap_1058.bam.bai          met1.bam.bai
mv uniqmap_1059.bam.bai          mom1.bam.bai
mv uniqmap_1060.bam.bai          cCol-0.bam.bai

mv Tophat_unstrand_Col-0.bam Col-0.bam
mv uniqmap_0637.bam          nCol-0.bam
mv uniqmap_0638.bam          ddm1.bam
mv uniqmap_0971.bam          nrpd1.bam
mv uniqmap_0972.bam          nrpe1.bam
mv uniqmap_0973.bam          morc6.bam
mv uniqmap_1057.bam          rdd.bam
mv uniqmap_1058.bam          met1.bam
mv uniqmap_1059.bam          mom1.bam
mv uniqmap_1060.bam          cCol-0.bam









nohup bamTobw.sh -b   Col-0.bam_file  -d   &
nohup bamTobw.sh -b    nCol-0.bam_file  -d   &
nohup bamTobw.sh -b  ddm1.bam_file  -d   &
nohup bamTobw.sh -b   nrpd1.bam_file  -d   &
nohup bamTobw.sh -b   nrpe1.bam_file  -d   &
nohup bamTobw.sh -b   morc6.bam_file  -d   &
nohup bamTobw.sh -b rdd.bam_file  -d   &
nohup bamTobw.sh -b  met1.bam_file  -d   &
nohup bamTobw.sh -b  mom1.bam_file  -d   &
nohup bamTobw.sh -b    cCol-0.bam_file  -d   &

echo "Col-0.bam" >      Col-0.bam_file
echo "nCol-0.bam" >      nCol-0.bam_file
echo "ddm1.bam" >      ddm1.bam_file
echo "nrpd1.bam" >      nrpd1.bam_file
echo "nrpe1.bam" >      nrpe1.bam_file
echo "morc6.bam" >      morc6.bam_file
echo "rdd.bam" >      rdd.bam_file
echo "met1.bam" >      met1.bam_file
echo "mom1.bam" >      mom1.bam_file
echo "cCol-0.bam" >      cCol-0.bam_file



##

#/bin/bash

## http://cutadapt.readthedocs.io/en/stable/guide.html
#cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -o

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627951.fastq.gz SRR627951.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627952.fastq.gz SRR627952.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627953.fastq.gz SRR627953.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627954.fastq.gz SRR627954.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627955.fastq.gz SRR627955.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627956.fastq.gz SRR627956.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627957.fastq.gz SRR627957.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627958.fastq.gz SRR627958.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627959.fastq.gz SRR627959.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627960.fastq.gz SRR627960.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627961.fastq.gz SRR627961.fastq.gz &
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -0 trimm_adapt_SRR627962.fastq.gz SRR627962.fastq.gz &
AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT

GSM1048068	polyA+ RNAs from whole cell extract, seedling
GSM1048069	total RNAs from whole cell extract, seedling
GSM1048070	non-polyA RNAs from whole cell extract, seedling
GSM1048071	total RNAs from cytoplasmic extract, seedling
GSM1048072	non-polyA RNAs from cytoplasmic extract, seedling
GSM1048073	total RNAs from nuclear extract, seedling
GSM1048074	non-polyA RNAs from nuclear extract, seedling
GSM1048075	polyA+ RNAs from whole cell extract, inflorescence
GSM1048076	total RNAs from nuclear extract, inflorescence
GSM1048077	mock RIP-seq, seedling
GSM1048078	CLF RIP-seq, seedling
GSM1048079	H3K27me3 ChIP-seq, seedling


Illumina Casava1.7 software was used for base-calling.

Adaptor sequences in the sequencing reads were removed using Cutadapt v1.0 with parameters '-O 4 -e 0.13 -m 35'.

Trimmed reads with a length no shorter than 35nt were aligned to Arabidopsis genome using TopHat v1.3.1 with parameters '-g 5 -i 20 -I 50000 -G TAIR10.gtf --solexa1.3-quals --library-type fr-secondstrand'.
For each sample, transcripts were assembled independently using Cufflinks v1.3.0 with parameters '--min-intron-length 20 -I 50000 -g TAIR10.gtf --library-type fr-secondstrand --min-frags-per-transfrag 1 -u'.
All assemblies from each samples as well as TAIR annotation (v10) were merged together by Cuffmerge using default parameters.
Cuffdiff were used to estimate the expression levels of each transcript in all samples.
genome build: TAIR10
processed data files format and content: tab-delimited text files include FPKM values for each Sample


-O 4 -e 0.13 -m 35


bbduk.sh in=SRR627956.fastq.gz out=clean.fq.gz ref=/data1/linhua/software/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo



bbduk.sh -Xmx1g in=reads.fq out=clean.fq qtrim=rl trimq=10

clean.fq.gz

bbduk.sh -Xmx1g in=clean.fq.gz out=clean_Q.fq.gz qtrim=rl trimq=20






(if your data is very low quality, you may wish to use more sensitive settings of hdist=2 k=21)

where "ktrim=r" is for right-trimming (3' adapters), "ktrim=l" is for left-trimming (5' adapters), and 

"ktrim=N" just masks the kmers with "N". 

"k" specifies the kmer size to use (must be at most the length of the adapters) 

while "mink" allows it to use shorter kmers at the ends of the read (for example, k=11 for the last 11 bases). 

"hdist" means "hamming distance"; this allows one mismatch. 

Instead of "ref=file" you can alternately (or additionally) say "literal=ACTGGT,TTTGGTG" for those two literal strings. The BBTools package currently includes Truseq and Nextera adapters sequences in /bbmap/resources/ as truseq.fa.gz, truseq_rna.fa.gz, and nextera.fa.gz. You can specify whether or not BBDuk looks for the reverse-complement of the reference sequences as well as the forward sequence with the flag "rcomp=t" or "rcomp=f"; by default it looks for both. You can also restrict kmer operations such as adapter-trimming to only read 1 or read 2 with the "skipr1" or "skipr2" flags, or restrict them to the leftmost or rightmost X bases of a read with the restrictleft or restrictright flags. For normal paired-end fragment libraries, I recommend adding the flags "tbo", which specifies to also trim adapters based on pair overlap detection (which does not require known adapter sequences), and "tpe", which specifies to trim both reads to the same length (in the event that an adapter kmer was only detected in one of them).



bedGraphToBigWig ddm1_plusS.bedgraph chrom.sizes ddm1_plusS.bw &
bedGraphToBigWig ddm1_minusS.bedgraph chrom.sizes ddm1_minusS.bw &
bedGraphToBigWig nCol-0_plusS.bedgraph chrom.sizes nCol-0_plusS.bw &
bedGraphToBigWig nCol-0_minusS.bedgraph chrom.sizes nCol-0_minusS.bw &
bedGraphToBigWig Col-0_plusS.bedgraph chrom.sizes Col-0_plusS.bw &
bedGraphToBigWig Col-0_minusS.bedgraph chrom.sizes Col-0_minusS.bw &
bedGraphToBigWig rdd_plusS.bedgraph chrom.sizes rdd_plusS.bw &
bedGraphToBigWig rdd_minusS.bedgraph chrom.sizes rdd_minusS.bw &
bedGraphToBigWig cCol-0_plusS.bedgraph chrom.sizes cCol-0_plusS.bw &
bedGraphToBigWig cCol-0_minusS.bedgraph chrom.sizes cCol-0_minusS.bw &
bedGraphToBigWig met1_plusS.bedgraph chrom.sizes met1_plusS.bw &
bedGraphToBigWig met1_minusS.bedgraph chrom.sizes met1_minusS.bw &
bedGraphToBigWig mom1_plusS.bedgraph chrom.sizes mom1_plusS.bw &
bedGraphToBigWig mom1_minusS.bedgraph chrom.sizes mom1_minusS.bw &
bedGraphToBigWig morc6_plusS.bedgraph chrom.sizes morc6_plusS.bw &
bedGraphToBigWig morc6_minusS.bedgraph chrom.sizes morc6_minusS.bw &
bedGraphToBigWig nrpd1_plusS.bedgraph chrom.sizes nrpd1_plusS.bw &
bedGraphToBigWig nrpd1_minusS.bedgraph chrom.sizes nrpd1_minusS.bw &
bedGraphToBigWig nrpe1_plusS.bedgraph chrom.sizes nrpe1_plusS.bw &
bedGraphToBigWig nrpe1_minusS.bedgraph chrom.sizes nrpe1_minusS.bw &



bam2wig.py 






--strand="1+-,1-+,2++,2–-"

bam2wig.py -s chrom.sizes -i Col-0.bam -o Col-0_wig -u  &
bam2wig.py -s chrom.sizes -i  cCol-0.bam  -o cCol-0_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  ddm1.bam  -o ddm1_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  met1.bam  -o met1_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  mom1.bam  -o mom1_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  morc6.bam  -o morc6_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  nCol-0.bam  -o nCol-0_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  nrpd1.bam  -o nrpd1_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  nrpe1.bam  -o nrpe1_wig -u --strand="1+-,1-+,2++,2--" &
bam2wig.py -s chrom.sizes -i  rdd.bam  -o rdd_wig -u --strand="1+-,1-+,2++,2--" &

 -a,--algorithm <arg>             Counting algorithm:
                                  uniquely-mapped-reads(default) or
                                  proportional.
 -bam <arg>                       Input mapping file in BAM format.
 -gtf <arg>                       Annotations file in Ensembl GTF format.
 -oc <arg>                        Output file for computed counts. If only name
                                  of the file is provided, then the file will be
                                  saved in the output folder.
 -outdir <arg>                    Output folder for HTML report and raw data.
 -outfile <arg>                   Output file for PDF report (default value is
                                  report.pdf).
 -outformat <arg>                 Format of the output report (PDF, HTML or both
                                  PDF:HTML, default is HTML).
 -p,--sequencing-protocol <arg>   Sequencing library protocol:
                                  strand-specific-forward,
                                  strand-specific-reverse or non-strand-specific
                                  (default)
 -pe,--paired                     Setting this flag for paired-end experiments
                                  will result in counting fragments instead of
                                  reads
 -s,--sorted                      This flag indicates that the input file is
                                  already sorted by name. If not set, additional
                                  sorting by name will be performed. Only
                                  required for paired-end analysis.


#!/bin/bash

GTF="/data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gtf"

ID=$(basename ${1} .bam)

qualimap rnaseq -bam ${1} -gtf ${GTF} -outdir ${ID}_OUT_$(date +%F) -outfile ${ID}_QC_$(date +%F) -outformat PDF -p strand-specific-forward -pe -s --java-mem-size=2G




nohup sh QC_ON_BAM.sh named_uniqmap_0637.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_0638.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_0971.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_0972.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_0973.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_1057.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_1058.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_1059.bam &
nohup sh QC_ON_BAM.sh named_uniqmap_1060.bam &




mv ./named_uniqmap_0972_OUT_2016-12-21/rnaseq_qc_results.txt 0972_rnaseq_qc_results.txt
mv ./named_uniqmap_1059_OUT_2016-12-21/rnaseq_qc_results.txt 1059_rnaseq_qc_results.txt
mv ./named_uniqmap_0973_OUT_2016-12-21/rnaseq_qc_results.txt 0973_rnaseq_qc_results.txt
mv ./named_uniqmap_0637_OUT_2016-12-21/rnaseq_qc_results.txt 0637_rnaseq_qc_results.txt
mv ./named_uniqmap_0638_OUT_2016-12-21/rnaseq_qc_results.txt 0638_rnaseq_qc_results.txt
mv ./named_uniqmap_1058_OUT_2016-12-21/rnaseq_qc_results.txt 1058_rnaseq_qc_results.txt
mv ./named_uniqmap_0971_OUT_2016-12-21/rnaseq_qc_results.txt 0971_rnaseq_qc_results.txt
mv ./named_uniqmap_1060_OUT_2016-12-21/rnaseq_qc_results.txt 1060_rnaseq_qc_results.txt
mv ./named_uniqmap_1057_OUT_2016-12-21/rnaseq_qc_results.txt 1057_rnaseq_qc_results.txt



overlapping exon
exonic
intronic
intergenic\s

A=open("0637_rnaseq_qc_results.txt").read()
overlapping=re.findall(r'overlapping\sexon\s=\s+(\d+,\d+,\d+)\s\((\d+\.\d*%)\)',A)
exonic=re.findall(r'exonic\s=\s+(\d+,\d+,\d+)\s\((\d+\.\d*%)\)',A)
intronic=re.findall(r'intronic\s=\s+(\d+,\d+,\d+)\s\((\d+\.\d*%)\)',A)
intergenic=re.findall(r'intergenic\s=\s+(\d+,\d+,\d+)\s\((\d+\.\d*%)\)',A)

list(overlapping[0],exonic[0],intronic[0],intergenic[0])




intronic
intergenic
overlapping exon

grep "exonic" *.txt|sed "s/://g;s/=//g;s/,//g;s/%//g;s/(//g;s/)//g"|tr "\t" " "|sed "s/_rnaseq_qc_results.txt//g" > exonic_stat
grep "intergenic" *.txt|sed "s/://g;s/=//g;s/,//g;s/%//g;s/(//g;s/)//g"|tr "\t" " "|sed "s/_rnaseq_qc_results.txt//g" > intergenic_stat
grep "intronic" *.txt|sed "s/://g;s/=//g;s/,//g;s/%//g;s/(//g;s/)//g"|tr "\t" " "|sed "s/_rnaseq_qc_results.txt//g" > intronic_stat
grep "overlapping exon" *.txt|sed "s/://g;s/=//g;s/,//g;s/%//g;s/(//g;s/)//g"|tr "\t" " "|sed "s/_rnaseq_qc_results.txt//g" > overlapping_stat




Proportion of uniquely mapped reads


#!/bin/bash
sh TAIR10_QC_ON_BAM.sh name_Tophat_unstrand_Col-0.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_0637.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_0638.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_0971.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_0972.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_0973.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_1057.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_1058.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_1059.bam  &
sleep 10s
sh TAIR10_QC_ON_BAM.sh named_uniqmap_1060.bam  &
sleep 10s
