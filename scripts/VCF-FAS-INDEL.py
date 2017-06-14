#!/usr/bin/env python
## 2017-6-14 python script to handle VCF files to fasta
from __future__ import print_function
import sys

if len(sys.argv)==1:
	print('Please give me a VCF file!')
	sys.exit()

f = open(sys.argv[1],'r')  
result = list() 
for line in f.readlines():
    line = line.strip()
    result.append(line)

subresult=[RR for RR in result if RR.startswith("##")==False]
for S in range(9,len(subresult[0].split("\t"))):
    sam_1=list()
    sam_1.append(subresult[0].split("\t")[S]+"_sam1")
    sam_2=list()
    sam_2.append(subresult[0].split("\t")[S]+"_sam2")
    for i in range(1,len(subresult)):
        record=subresult[i].split("\t")
        REF=record[3]
        ALT=record[4]
        if len(REF)>len(ALT):
            ALT=ALT+(len(REF)-len(ALT))*"-"
        elif len(REF)==len(ALT):
            REF
        else:
            REF=REF+(len(ALT)-len(REF))*"-"
        ##
        if record[S].split("|")[0]=="0":
            sam_1.append(REF)
        elif record[S].split("|")[0]=="1" :
            sam_1.append(ALT)
        else:
            sam_1.append(len(REF)*"*")
        ##
        if record[S].split("|")[1]=="0":
            sam_2.append(REF)
        elif record[S].split("|")[1]=="1":
            sam_2.append(ALT)
        else:
            sam_2.append(len(REF)*"*")
    print(">"+sam_1[0],''.join(sam_1[1:]),sep="\n")
    print(">"+sam_2[0],''.join(sam_2[1:]),sep="\n")