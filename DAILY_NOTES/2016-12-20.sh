uniq_nCol-0
uniq_ddm1
uniq_nrpd1 
uniq_nrpe1
uniq_morc6
uniq_rdd
uniq_met1
uniq_mom1
uniq_cCol-0

samples	   ChrC    ChrM   nuclear     total cyto_ratio   nuclear     total
nCol-0 26496728 1520859  51901453  79919040  0.3505746  48974865  48974865 
ddm1   28540298 1660893  55015383  85216574  0.3544051  49732199  49732199 
nrpd1  49457555 2220774  98926585 150604914  0.3431384  92785915  92785915 
nrpe1  46895863 1908644 113070473 161874980  0.3014951 106627272 106627272 
morc6  38878187 1748281  95309155 135935623  0.2988655  90438302  90438302 
rdd    35570280 1763221  69158023 106491524  0.3505772  65521088  65521088 
met1   37909266 1413076  74559357 113881699  0.3452911  69894623  69894623 
mom1   33474590 1152949  80116328 114743867  0.3017812  75348627  75348627 
cCol-0 37682530 2736340  70792549 111211419  0.3634417  66355298  66355298 

 		ChrC ChrM   nuclear     total cyto_ratio
nCol-0    0    0  48974865  48974865          0
ddm1      0    0  49732199  49732199          0
nrpd1     0    0  92785915  92785915          0
nrpe1     0    0 106627272 106627272          0
morc6     0    0  90438302  90438302          0
rdd       0    0  65521088  65521088          0
met1      0    0  69894623  69894623          0
mom1      0    0  75348627  75348627          0
cCol-0    0    0  66355298  66355298          0

uniqmap_1060Tophat_unstrand_Col_0uniqmap_0972uniqmap_0973uniqmap_1057uniqmap_1059uniqmap_0971uniqmap_0638uniqmap_0637uniqmap_1058

Col_0<-fread("Tophat_unstrand_Col-0.tin.xls")
nCol_0<-fread("uniqmap_0637.tin.xls")
ddm1<-fread("uniqmap_0638.tin.xls")
nrpd1 <-fread("uniqmap_0971.tin.xls")
nrpe1<-fread("uniqmap_0972.tin.xls")
morc6<-fread("uniqmap_0973.tin.xls")
rdd<-fread("uniqmap_1057.tin.xls")
met1<-fread("uniqmap_1058.tin.xls")
mom1<-fread("uniqmap_1059.tin.xls")
cCol_0<-fread("uniqmap_1060.tin.xls")

rbind(nCol_0$TIN,
ddm1$TIN,
nrpd1 $TIN,
nrpe1$TIN,
morc6$TIN,
rdd$TIN,
met1$TIN,
mom1$TIN,
cCol_0$TIN

Col_0
nCol_0
ddm1
nrpd1 
nrpe1
morc6
rdd
met1
mom1
cCol_0


Bam_file					TIN(mean)	  TIN(median)	 TIN(stdev)
Tophat_unstrand_Col-0.bam  76.2802035564  79.6320235791  13.1859064533
uniqmap_0637.bam           78.0309397286  82.4266524084  15.6079010918
uniqmap_0638.bam           77.500315769   82.5626210066  16.6862014467
uniqmap_0971.bam           79.4310887594  84.5462505068  16.5246907987
uniqmap_0972.bam           79.839596933   84.9056832134  16.5818880221
uniqmap_0973.bam           79.4558506918  84.3908163023  16.1737917716
uniqmap_1057.bam           79.0864229378  84.0678051768  16.2350775561
uniqmap_1058.bam           79.357155021   84.4324933611  16.3311129221
uniqmap_1059.bam           80.4070151171  85.1581796052  15.8664998711
uniqmap_1060.bam           76.169373385   79.540526973   13.9418361843

superreads.pl trimmed_BN2-971_R1.fq.gz trimmed_BN2-971_R2.fq.gz /data1/linhua/software/MaSuRCA-3.2.1_12082016

le trimmed_BN2-1060_R1.fq.gz|head -100000 > 100000_1.fastq
le trimmed_BN2-1060_R2.fq.gz|head -100000 > 100000_2.fastq


read_distribution.py -i uniqmap_0638.bam -r /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-DATA-2016-09-28/RNA_Seq_rseqc/Araport11.bed

/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/QC_RNA_SEQ/Tophat_unstrand_Col-0.bam


#!/bin/bash

BED="/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/RAW-DATA-2016-09-28/RNA_Seq_rseqc/Araport11.bed"

read_distribution.py -i  Tophat_unstrand_Col-0.bam -r ${BED} > Col_0_read_dis.txt &
read_distribution.py -i  uniqmap_0637.bam -r ${BED} > uniqmap_0637_read_dis.txt &
read_distribution.py -i  uniqmap_0638.bam -r ${BED} > uniqmap_0638_read_dis.txt &
read_distribution.py -i  uniqmap_0971.bam -r ${BED} > uniqmap_0971_read_dis.txt &
read_distribution.py -i  uniqmap_0972.bam -r ${BED} > uniqmap_0972_read_dis.txt &
read_distribution.py -i  uniqmap_0973.bam -r ${BED} > uniqmap_0973_read_dis.txt &
read_distribution.py -i  uniqmap_1057.bam -r ${BED} > uniqmap_1057_read_dis.txt &
read_distribution.py -i  uniqmap_1058.bam -r ${BED} > uniqmap_1058_read_dis.txt &
read_distribution.py -i  uniqmap_1059.bam -r ${BED} > uniqmap_1059_read_dis.txt &
read_distribution.py -i  uniqmap_1060.bam -r ${BED} > uniqmap_1060_read_dis.txt &



grep -v "^Total" Col_0_read_dis.txt |grep -v "=" > clean_Col_0_read_dis.txt
grep -v "^Total" uniqmap_0637_read_dis.txt |grep -v "=" > clean_uniqmap_0637_read_dis.txt
grep -v "^Total" uniqmap_0638_read_dis.txt |grep -v "=" > clean_uniqmap_0638_read_dis.txt
grep -v "^Total" uniqmap_0971_read_dis.txt |grep -v "=" > clean_uniqmap_0971_read_dis.txt
grep -v "^Total" uniqmap_0972_read_dis.txt |grep -v "=" > clean_uniqmap_0972_read_dis.txt
grep -v "^Total" uniqmap_0973_read_dis.txt |grep -v "=" > clean_uniqmap_0973_read_dis.txt
grep -v "^Total" uniqmap_1057_read_dis.txt |grep -v "=" > clean_uniqmap_1057_read_dis.txt
grep -v "^Total" uniqmap_1058_read_dis.txt |grep -v "=" > clean_uniqmap_1058_read_dis.txt
grep -v "^Total" uniqmap_1059_read_dis.txt |grep -v "=" > clean_uniqmap_1059_read_dis.txt
grep -v "^Total" uniqmap_1060_read_dis.txt |grep -v "=" > clean_uniqmap_1060_read_dis.txt

