#!/usr/bin/env python
from collections import Counter
import sys
## rra=[i for i in range(len(subresult[0].split("\t")[9:])) if subresult[0].split("\t")[9:][i] == "0|1"]

if len(sys.argv)==1:
	print('Please give me a VCF file path!')
	sys.exit()
	
f = open(sys.argv[1],'r')
result = list()

for line in f.readlines():
    line = line.strip()
    result.append(line)

print('\n'.join([RR for RR in result if RR.startswith("#")==True]))

subresult=[RR for RR in result if RR.startswith("#")==False]

for X in subresult:
    a=X.split("\t")[9:]
    b=[]
    if Counter(a)['0/0'] > Counter(a)['1/1']:
        for i in a:
            if i=="0/1":
                i="0/0"
            b.append(i)
    else:
        for i in a:
            if i=="0/1":
                i="1/1"
            b.append(i)
    #print(Counter(b))
    #print(Counter(a))
    print('\t'.join(X.split("\t")[0:9]+b))