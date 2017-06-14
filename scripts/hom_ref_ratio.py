#!/usr/bin/env python
from __future__ import print_function
from __future__ import division 
import sys
from cyvcf2 import VCF
## https://stackoverflow.com/questions/26922245/python-2-7-3-sep-argument-showing-error


if len(sys.argv)==1:
	print('Please give me a VCF file path!')
	sys.exit()

for V in VCF(sys.argv[1]):
    print(V.start+1,"hom_ref: ",V.num_hom_ref/(V.num_called+V.num_unknown),sep=" ")
