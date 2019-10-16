#!/usr/bin/python

import sys, math, ctypes

from convoluzione import *

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!"
    print "usage: \n\tpython main.py bit_to_shift"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    bit_to_shift = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!"
    print "usage: \n\tpython main.py bit_to_shift"
    sys.exit(1)

IF = 4
OF = 4
FS = 5
IH = 10
IW = 10
OH = 10
OW = 10
zero_pad = 2
stride = 1

with open("./input_features.txt", "w") as f:
    vec = [i for i in range (1,11)]
    v = [i for i in range (29,129)]
    for i in range(0, IF):
        if i==0:
            for ih in range(0,IH):
                for iw in range(0,IW):
                   f.write("%d\n" % (vec[iw]))
        elif i==1:
            for ih in range(0,IH):
                for iw in range(0,IW):
                   f.write("%d\n" % (vec[iw]))
        elif i==2:
            for ih in range(0,IH):
                for iw in range(0,IW):
                   f.write("%d\n" % (vec[iw]))
        else:
            for ih in range(0,IH):
                for iw in range(0,IW):
                   f.write("%d\n" % (v[iw+(ih*IW)]))
                   
                   
f_center = 0
with open("./weights.txt", "w") as f:
    for o in range(0, OF):
        for i in range (0, IF):
            for w in range(0, FS*FS):
                if (w == 12):
                    if (o==(OF-1) & i==(IF-1)):
                        f.write("%d\n" % (128))
                    else:
                        f.write("%d\n" % (f_center+1))
                else:
                    f.write("%d\n" % 0x0)      
            f_center+=1
            
            
with open("bias.txt", "w") as f:
  for b in range(0, OF):
    f.write("%d\n" % (0x0000))
    
    
with open("./input_features.txt", "r") as f:    
  input_features = [int(i) for i in f]
  
with open("./weights.txt", "r") as f:
  weights = [int(i) for i in f]
  
with open("bias.txt", "r") as f:
  bias = [int(i) for i in f]
  
output_features = [0 for i in range(0,OH*OW*OF)]

convoluzione (input_features, output_features, weights, bias, IF, IH, IW,  OF, OH, OW, FS, zero_pad, stride)
  
with open("./output_features.txt","w") as f:
  for i in output_features:
    f.write("%d\n" % i)
    
output_shifted = [(i/(2**int(bit_to_shift))) for i in output_features]

with open("./output_shifted.txt","w") as f:
  for i in output_shifted:
    f.write("%x\n" % i)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
