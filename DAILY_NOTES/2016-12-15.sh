#!/bin/sh

sh verse_batch.sh named_uniqmap_0637.bam
sh verse_batch.sh named_uniqmap_0638.bam
sh verse_batch.sh named_uniqmap_0971.bam
sh verse_batch.sh named_uniqmap_0972.bam
sh verse_batch.sh named_uniqmap_0973.bam
sh verse_batch.sh named_uniqmap_1057.bam
sh verse_batch.sh named_uniqmap_1058.bam
sh verse_batch.sh named_uniqmap_1059.bam
sh verse_batch.sh named_uniqmap_1060.bam

sh all_feature_verse_batch.sh named_uniqmap_0637.bam
sh all_feature_verse_batch.sh named_uniqmap_0638.bam
sh all_feature_verse_batch.sh named_uniqmap_0971.bam
sh all_feature_verse_batch.sh named_uniqmap_0972.bam
sh all_feature_verse_batch.sh named_uniqmap_0973.bam
sh all_feature_verse_batch.sh named_uniqmap_1057.bam
sh all_feature_verse_batch.sh named_uniqmap_1058.bam
sh all_feature_verse_batch.sh named_uniqmap_1059.bam
sh all_feature_verse_batch.sh named_uniqmap_1060.bam


#!/bin/bash

gtf="/data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gff"
input=$(basename ${1} .bam)
outdir=$(pwd)/Sim_${input}_stringtie_out_$(date +%F)

stringtie ${input}.bam -o ${outdir}/Col-0_without_guide.gtf -p 10

# -f [0.0-1.0] Sets the minimum isoform abundance of the predicted transcripts as a fraction of the most abundant transcript assembled at a given locus. Lower abundance transcripts are often artifacts of incompletely spliced precursors of processed transcripts. Default: 0.1
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_0.gtf  -f 0   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_10.gtf  -f 0.1   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_20.gtf  -f 0.2   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_30.gtf  -f 0.3   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_40.gtf  -f 0.4   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_50.gtf  -f 0.5   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_60.gtf  -f 0.6   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_70.gtf  -f 0.7   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_80.gtf  -f 0.8   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_90.gtf  -f 0.9   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_95.gtf  -f 0.95   -p 10
stringtie ${input}.bam -G ${gtf} -o ${outdir}/f_100.gtf -f 1      -p 10


## 

#!/bin/bash

GFF="/data1/linhua/QIANLAB/Araport_related_data/Araport11_GFF3_genes_transposons.201606.gff"
ID=$(basename ${1} .gtf)

gffcompare -R -r ${GFF} -o gtf_quality_${ID} ${1}

#!/bin/bash

sh eval_gtf.sh Col-0_without_guide.gtf
sh eval_gtf.sh f_0.gtf
sh eval_gtf.sh f_10.gtf
sh eval_gtf.sh f_20.gtf
sh eval_gtf.sh f_30.gtf
sh eval_gtf.sh f_40.gtf
sh eval_gtf.sh f_50.gtf
sh eval_gtf.sh f_60.gtf
sh eval_gtf.sh f_70.gtf
sh eval_gtf.sh f_80.gtf
sh eval_gtf.sh f_90.gtf
sh eval_gtf.sh f_95.gtf


grep "Base level" 			*stats	|sed "s/://g;s/Base level//g"     		|tr "|" " "    > Base_level.summary
grep "Exon level" 			*stats		 |sed "s/://g;s/Exon level//g"     		|tr "|" " "    > Exon_level.summary
grep "Intron level" 		*stats	|sed "s/://g;s/Intron level//g"     	|tr "|" " "    > Intron_level.summary
grep "Intron chain level"   *stats  |sed "s/://g;s/Intron chain level//g"  |tr "|" " "    > Intron_chain_level.summary
grep "Transcript level"     *stats    |sed "s/://g;s/Transcript level//g"    |tr "|" " "    > Transcript_level.summary
grep "Locus level"          *stats   		 |sed "s/://g;s/Locus level//g"     	|tr "|" " "    > Locus_level.summary

colnames(Intron_chain)<-paste("Intron_chain",colnames(Intron_chain),sep = "__")

Intron_chain,Base,Exon,Intron,Transcript,Locus

colnames(Intron_chain)<-paste("Intron_chain",colnames(Intron_chain),sep = "__")
colnames(Base)<-paste("Base",colnames(Base),sep = "__")
colnames(Exon)<-paste("Exon",colnames(Exon),sep = "__")
colnames(Intron)<-paste("Intron",colnames(Intron),sep = "__")
colnames(Transcript)<-paste("Transcript",colnames(Transcript),sep = "__")
colnames(Locus)<-paste("Locus",colnames(Locus),sep = "__")


##
data.frame(Intron_chain$Intron_chain__ID,
	Intron_chain$Intron_chain__Sensitivity,	Intron_chain$Intron_chain__Precision)


("Intron_chain.Intron_chain__Sensitivity",
"Base.Base__Sensitivity"                ,
"Exon.Exon__Sensitivity"                ,
"Intron.Intron__Sensitivity"            ,
"Transcript.Transcript__Sensitivity"    ,
"Locus.Locus__Sensitivity"			    ,
"Intron_chain.Intron_chain__Precision"  ,
"Base.Base__Precision"                  ,
"Exon.Exon__Precision"                  ,
"Intron.Intron__Precision"              ,
"Transcript.Transcript__Precision"      ,
"Locus.Locus__Precision"                )








table(mcols(subset(ara,mcols(ara)$locus_type == "antisense_long_noncoding_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "antisense_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "long_noncoding_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "mirna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "novel_transcribed_region"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "other_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "pre_trna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "protein_coding"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "pseudogene"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "ribosomal_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "small_nuclear_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "small_nucleolar_rna"))$ID %in% annoID  )
table(mcols(subset(ara,mcols(ara)$locus_type == "transposable_element_gene"))$ID %in% annoID  )

antisense_long_noncoding_rna_ratio
antisense_rna_ratio
long_noncoding_rna_ratio
mirna_ratio
novel_transcribed_region_ratio
other_rna_ratio
pre_trna_ratio
protein_coding_ratio
pseudogene_ratio
ribosomal_rna_ratio
small_nuclear_rna_ratio
small_nucleolar_rna_ratio
transposable_element_gene_ratio

## COMBINE all data into one file
sambamba merge --nthreads=10 epi_merge.bam `ls *.bam`

cbind(antisense_long_noncoding_rna_ratio,
antisense_rna_ratio,
long_noncoding_rna_ratio,
mirna_ratio,
novel_transcribed_region_ratio,
other_rna_ratio,
pre_trna_ratio,
protein_coding_ratio,
pseudogene_ratio,
ribosomal_rna_ratio,
small_nuclear_rna_ratio,
small_nucleolar_rna_ratio,
transposable_element_gene_ratio)


Chr1  30427671  159996974  0
Chr2  19698289  168797292  0
Chr3  23459830  114876653  0
Chr4  18585056  91760476   0
Chr5  26975502  130246794  0
ChrC  154478    0          0
ChrM  366924    0          0
*     0         0          0

