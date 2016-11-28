#!/data1/linhua/software/anaconda/bin/python

import sys
from Bio import SeqIO

input=sys.stdin.readline().strip('\n')
output=input.replace(".fa","_chr01.fa")
print(input)
print(output)
SeqIO.write(SeqIO.parse(input,"fasta").next(),output,"fasta")


#!/data1/linhua/software/anaconda/bin/python

import sys
from Bio import SeqIO

input=sys.stdin.readline().strip('\n')
output=input.replace(".fa","_chr01_1M.fa")
print(input)
print(output)
SeqIO.write(SeqIO.parse(input,"fasta").next()[0:999999],output,"fasta")

