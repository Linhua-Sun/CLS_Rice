#!/bin/bash

raw_snps=$(basename ${1} .vcf)

shapeit --input-vcf ${raw_snps}.vcf -O ${raw_snps}_shapeit
shapeit -convert --input-haps ${raw_snps}_shapeit --output-vcf ${raw_snps}_shapeit.vcf
