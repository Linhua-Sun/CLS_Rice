mv TAIR-name_uniq_Tophat_unstrand_Col-0_OUT_2016-12-21/rnaseq_qc_results.txt TAIR-name_uniq_Tophat_unstrand_Col-0_OUT_2016-12-21_rnaseq_qc_results.txt 


mv name_uniq_Tophat_unstrand_Col-0_OUT_2016-12-21/rnaseq_qc_results.txt name_uniq_Tophat_unstrand_Col-0_OUT_2016-12-21_rnaseq_qc_results.txt 
 

sh bin/run_predict.sh test_seq.fa result_in_table /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/cpc-0.9-r2 result_evidence




/path/to/bin_subfolder/ is the path where you kept downloaded COME's "bin" subfolder, i.e., the $Bin_dir

/path/to/bin_subfolder/COME_main.sh is COME's main program script.

/path/to/your/transcripts.gtf is your input gtf file. The input gtf file should be as the description of ucsc's gtf format. In summary, the first field should be chormosome in lower and abbreviate case (e.g., chr1, chrX); the third field should be exactly "exon"; the seventh field should be strand (i.e., + or -). The subsequent attribute list must begin with the two mandatory attributes: gene_id "value"; transcript_id "value". In addition, transcript length should be longer than 50 nucleotides. Any lines of your input file don't match the criteria aboved will be skipped.

/path/to/your/output_folder/ is a folder that will be created (if the user didn't create it already) to save your output file "result.txt"

species is one of these five names: "human", "mouse", "fly", "worm" and "plant". It specifies which species' feature vector files should be applied to your calculation

model is one of these ten names: "human.model", "human.NoExpHis.model", "mouse.model", "mouse.NoExpHis.model", "fly.model", "fly.NoExpHis.model", "worm.model", "worm.NoExpHis.model", "plant.model" and "plant.NoExpHis.model". It specifies which model should be applied to your calculation. *.model, e.g., human.model, is the default model trained by multiple sequence-derived and experiment-based features. We also provided *.NoExpHis.model, e.g., human.NoExpHis.model, which is the model trained by multiple sequence-derived features only.


bash /data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/COME/bin/COME_main.sh \
/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/COME_TEST/1000.gtf \
/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/COME_TEST/1000 \
/data1/linhua/QIANLAB/PROJECT/Long-Noncoding-RNA-project/LNC-2016-12-08/COME/bin \
plant \
plant.model

## /path/to/your/transcripts.gtf is your input gtf file. 

## The input gtf file should be as the description of ucsc's gtf format. 
## In summary, the first field should be chormosome in lower and abbreviate case (e.g., chr1, chrX); the third field should be exactly "exon"; 
## the seventh field should be strand (i.e., + or -). 
## The subsequent attribute list must begin with the two mandatory attributes: gene_id "value"; transcript_id "value". 
## In addition, transcript length should be longer than 50 nucleotides. Any lines of your input file don't match the criteria aboved will be skipped.

chr5	Araport11	exon	6083401	6083859	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6083936	6084094	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6084329	6084505	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6084911	6086619	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6086709	6087002	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6087107	6088247	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"
chr5	Araport11	exon	6088313	6089041	.	-	.	gene_id "AT5G18370"; transcript_id "AT5G18370.1"