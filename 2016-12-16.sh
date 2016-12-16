mRNA_part <- subset(ara,mcols(ara)$type=="mRNA")
















gene_test_part<-subset(ara,mcols(ara)$type=="gene")
mRNA_test_part<-subset(ara,mcols(ara)$type=="mRNA")
five_prime_UTR_test_part<-subset(ara,mcols(ara)$type=="five_prime_UTR")
exon_test_part<-subset(ara,mcols(ara)$type=="exon")
CDS_test_part<-subset(ara,mcols(ara)$type=="CDS")
three_prime_UTR_test_part<-subset(ara,mcols(ara)$type=="three_prime_UTR")
protein_test_part<-subset(ara,mcols(ara)$type=="protein")
lnc_RNA_test_part<-subset(ara,mcols(ara)$type=="lnc_RNA")
transposable_element_test_part<-subset(ara,mcols(ara)$type=="transposable_element")
transposon_fragment_test_part<-subset(ara,mcols(ara)$type=="transposon_fragment")
antisense_lncRNA_test_part<-subset(ara,mcols(ara)$type=="antisense_lncRNA")
miRNA_primary_transcript_test_part<-subset(ara,mcols(ara)$type=="miRNA_primary_transcript")
miRNA_test_part<-subset(ara,mcols(ara)$type=="miRNA")
transcript_region_test_part<-subset(ara,mcols(ara)$type=="transcript_region")
tRNA_test_part<-subset(ara,mcols(ara)$type=="tRNA")
antisense_RNA_test_part<-subset(ara,mcols(ara)$type=="antisense_RNA")
pseudogene_test_part<-subset(ara,mcols(ara)$type=="pseudogene")
pseudogenic_transcript_test_part<-subset(ara,mcols(ara)$type=="pseudogenic_transcript")
pseudogenic_exon_test_part<-subset(ara,mcols(ara)$type=="pseudogenic_exon")
transposable_element_gene_test_part<-subset(ara,mcols(ara)$type=="transposable_element_gene")
snoRNA_test_part<-subset(ara,mcols(ara)$type=="snoRNA")
ncRNA_test_part<-subset(ara,mcols(ara)$type=="ncRNA")
snRNA_test_part<-subset(ara,mcols(ara)$type=="snRNA")
uORF_test_part<-subset(ara,mcols(ara)$type=="uORF")
pseudogenic_tRNA_test_part<-subset(ara,mcols(ara)$type=="pseudogenic_tRNA")
rRNA_test_part<-subset(ara,mcols(ara)$type=="rRNA")




table( mcols(nNtccol)$reference_id  %in% mcols(antisense_lncRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(antisense_RNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(CDS_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(exon_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(five_prime_UTR_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(gene_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(lnc_RNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(miRNA_primary_transcript_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(miRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(mRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(ncRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(protein_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(pseudogene_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(pseudogenic_exon_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(pseudogenic_transcript_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(pseudogenic_tRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(rRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(snoRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(snRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(three_prime_UTR_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(transcript_region_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(transposable_element_gene_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(transposable_element_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(transposon_fragment_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(tRNA_test_part)$ID )
table( mcols(nNtccol)$reference_id  %in% mcols(uORF_test_part)$ID )