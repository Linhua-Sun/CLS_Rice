#!/bin/bash
sh TE_batch.sh 1060_tophat2_name.bam &
sh TE_batch.sh 1059_tophat2_name.bam &
sh TE_batch.sh 1058_tophat2_name.bam &
sh TE_batch.sh 1057_tophat2_name.bam &
sh TE_batch.sh 0973_tophat2_name.bam &
sh TE_batch.sh 0972_tophat2_name.bam &
sh TE_batch.sh 0971_tophat2_name.bam &
sh TE_batch.sh 0638_tophat2_name.bam &
sh TE_batch.sh 0637_tophat2_name.bam &

#!/bin/bash

for i in $(cat BIM_list.txt)
do 
	plink --bfile ${i} --recode --out ${i}
done

sed "s/BIM_list.txt/BIMaa/g" bed2ped.sh > BIMaa_bed2ped.sh
sed "s/BIM_list.txt/BIMab/g" bed2ped.sh > BIMab_bed2ped.sh
sed "s/BIM_list.txt/BIMac/g" bed2ped.sh > BIMac_bed2ped.sh
sed "s/BIM_list.txt/BIMad/g" bed2ped.sh > BIMad_bed2ped.sh
sed "s/BIM_list.txt/BIMae/g" bed2ped.sh > BIMae_bed2ped.sh
sed "s/BIM_list.txt/BIMaf/g" bed2ped.sh > BIMaf_bed2ped.sh
sed "s/BIM_list.txt/BIMag/g" bed2ped.sh > BIMag_bed2ped.sh
sed "s/BIM_list.txt/BIMah/g" bed2ped.sh > BIMah_bed2ped.sh
sed "s/BIM_list.txt/BIMai/g" bed2ped.sh > BIMai_bed2ped.sh
sed "s/BIM_list.txt/BIMaj/g" bed2ped.sh > BIMaj_bed2ped.sh
sed "s/BIM_list.txt/BIMak/g" bed2ped.sh > BIMak_bed2ped.sh
sed "s/BIM_list.txt/BIMal/g" bed2ped.sh > BIMal_bed2ped.sh
sed "s/BIM_list.txt/BIMam/g" bed2ped.sh > BIMam_bed2ped.sh
sed "s/BIM_list.txt/BIMan/g" bed2ped.sh > BIMan_bed2ped.sh
sed "s/BIM_list.txt/BIMao/g" bed2ped.sh > BIMao_bed2ped.sh
sed "s/BIM_list.txt/BIMap/g" bed2ped.sh > BIMap_bed2ped.sh
sed "s/BIM_list.txt/BIMaq/g" bed2ped.sh > BIMaq_bed2ped.sh

sh BIMaa_bed2ped.sh &
sh BIMab_bed2ped.sh &
sh BIMac_bed2ped.sh &
sh BIMad_bed2ped.sh &
sh BIMae_bed2ped.sh &
sh BIMaf_bed2ped.sh &
sh BIMag_bed2ped.sh &
sh BIMah_bed2ped.sh &
sh BIMai_bed2ped.sh &
sh BIMaj_bed2ped.sh &
sh BIMak_bed2ped.sh &
sh BIMal_bed2ped.sh &
sh BIMam_bed2ped.sh &
sh BIMan_bed2ped.sh &
sh BIMao_bed2ped.sh &
sh BIMap_bed2ped.sh &
sh BIMaq_bed2ped.sh &

#!/bin/bash

for i in $(cat BIMaa)
do
       	Rscript ped2fas.R ${i} > ${i}.fas
done

batch_ped.batch

sed "s/BIMaa/BIMaa/g" batch_ped.batch > BIMaa_ped.batch
sed "s/BIMaa/BIMab/g" batch_ped.batch > BIMab_ped.batch
sed "s/BIMaa/BIMac/g" batch_ped.batch > BIMac_ped.batch
sed "s/BIMaa/BIMad/g" batch_ped.batch > BIMad_ped.batch
sed "s/BIMaa/BIMae/g" batch_ped.batch > BIMae_ped.batch
sed "s/BIMaa/BIMaf/g" batch_ped.batch > BIMaf_ped.batch
sed "s/BIMaa/BIMag/g" batch_ped.batch > BIMag_ped.batch
sed "s/BIMaa/BIMah/g" batch_ped.batch > BIMah_ped.batch
sed "s/BIMaa/BIMai/g" batch_ped.batch > BIMai_ped.batch
sed "s/BIMaa/BIMaj/g" batch_ped.batch > BIMaj_ped.batch
sed "s/BIMaa/BIMak/g" batch_ped.batch > BIMak_ped.batch
sed "s/BIMaa/BIMal/g" batch_ped.batch > BIMal_ped.batch
sed "s/BIMaa/BIMam/g" batch_ped.batch > BIMam_ped.batch
sed "s/BIMaa/BIMan/g" batch_ped.batch > BIMan_ped.batch
sed "s/BIMaa/BIMao/g" batch_ped.batch > BIMao_ped.batch
sed "s/BIMaa/BIMap/g" batch_ped.batch > BIMap_ped.batch
sed "s/BIMaa/BIMaq/g" batch_ped.batch > BIMaq_ped.batch

nohup sh BIMaa_ped.batch &
nohup sh BIMab_ped.batch &
nohup sh BIMac_ped.batch &
nohup sh BIMad_ped.batch &
nohup sh BIMae_ped.batch &
nohup sh BIMaf_ped.batch &
nohup sh BIMag_ped.batch &
nohup sh BIMah_ped.batch &
nohup sh BIMai_ped.batch &
nohup sh BIMaj_ped.batch &
nohup sh BIMak_ped.batch &
nohup sh BIMal_ped.batch &
nohup sh BIMam_ped.batch &
nohup sh BIMan_ped.batch &
nohup sh BIMao_ped.batch &
nohup sh BIMap_ped.batch &
nohup sh BIMaq_ped.batch &

raxmlHPC -f a -m GTRGAMMA -x 87000 -p 65993 -#100 -s oryza_OK_OS06G0472600.fas -n oryza_OK_OS06G0472600

oryza_OK_OS02G0202400.fas




#!/bin/bash

function rand(){
    min=$1  
    max=$(($2-$min+1))  
    num=$(($RANDOM+1000000000))
    echo $(($num%$max+$min))
}  
  
randomA=$(rand 10000 99999)
randomB=$(rand 10000 99999)

ID=$(basename ${1})

raxmlHPC -f a -m GTRGAMMA -x ${randomA} -p ${randomB} -#100 -s ${1} -n ${ID}_raxml_GTRGAMMA





#!/bin/bash

PATH="/lustre1/deng_pkuhpc/slh_RICE_data/Hang-2016-10-06/PHYLOGENMICS_ANALYSIS-2016-11-28/RAxML-2016-12-10/fas_25"
NODE="cn-long"
NODEX="dengcnl"
THREADS=1

for sample in *.fas
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
	echo "raxml_ex.sh ${sample}"  >>"$sample"_up.batch
done	

for i in *_up.batch;do echo pkubatch ${i} \&\& sleep 2s ;done > up.sh


##

samtools idxstats 1060_tophat2.bam |head -7 > 1060_tophat2_stats.txt
samtools idxstats 1059_tophat2.bam |head -7 > 1059_tophat2_stats.txt
samtools idxstats 1058_tophat2.bam |head -7 > 1058_tophat2_stats.txt
samtools idxstats 1057_tophat2.bam |head -7 > 1057_tophat2_stats.txt
samtools idxstats 0973_tophat2.bam |head -7 > 0973_tophat2_stats.txt
samtools idxstats 0972_tophat2.bam |head -7 > 0972_tophat2_stats.txt
samtools idxstats 0971_tophat2.bam |head -7 > 0971_tophat2_stats.txt
samtools idxstats 0638_tophat2.bam |head -7 > 0638_tophat2_stats.txt
samtools idxstats 0637_tophat2.bam |head -7 > 0637_tophat2_stats.txt

tophat2_0637<-read.table("0637_tophat2_stats.txt")
tophat2_0638<-read.table("0638_tophat2_stats.txt")
tophat2_0971<-read.table("0971_tophat2_stats.txt")
tophat2_0972<-read.table("0972_tophat2_stats.txt")
tophat2_0973<-read.table("0973_tophat2_stats.txt")
tophat2_1057<-read.table("1057_tophat2_stats.txt")
tophat2_1058<-read.table("1058_tophat2_stats.txt")
tophat2_1059<-read.table("1059_tophat2_stats.txt")
tophat2_1060<-read.table("1060_tophat2_stats.txt")

samtools view -@ 2 -h 0637_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_0637.bam &
samtools view -@ 2 -h 0638_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_0638.bam &
samtools view -@ 2 -h 0971_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_0971.bam &
samtools view -@ 2 -h 0972_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_0972.bam &
samtools view -@ 2 -h 0973_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_0973.bam &
samtools view -@ 2 -h 1057_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_1057.bam &
samtools view -@ 2 -h 1058_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_1058.bam &
samtools view -@ 2 -h 1059_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_1059.bam &
samtools view -@ 2 -h 1060_tophat2.bam Chr1 Chr2 Chr3 Chr4 Chr5|grep -E '^@|NH:i:1' |samtools view -@ 2 -Sb - > uniqmap_1060.bam &

##https://www.biostars.org/p/130193/

sambamba index -t 2 uniqmap_0637.bam &
sambamba index -t 2 uniqmap_0638.bam &
sambamba index -t 2 uniqmap_0971.bam &
sambamba index -t 2 uniqmap_0972.bam &
sambamba index -t 2 uniqmap_0973.bam &
sambamba index -t 2 uniqmap_1057.bam &
sambamba index -t 2 uniqmap_1058.bam &
sambamba index -t 2 uniqmap_1059.bam &
sambamba index -t 2 uniqmap_1060.bam &
