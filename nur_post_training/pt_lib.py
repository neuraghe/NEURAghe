#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

####################################################################
#                                                                  #         
#          EOLAB @ DIEE - Università degli studi di Cagliari       #        
#                      Via marengo 2 - 09123                       #       
#                              Cagliari                            #      
#                                                                  #     
#                                                                  #    
# Engineer:       Gianfranco Deriu - gian.deriu@gmail.com          #   
#                                                                  #  
#                                                                  # 
# Project:        NURAGHE                                          #
# File:           pt_lib.py                                        #
# Description:    Library for the post-training tools              #         
#                                                                  # 
####################################################################

import os.path
import sys, math, ctypes

class tcolors:
    OK      = '\033[92m'
    WARNING = '\033[93m'
    ERROR   = '\033[91m'
    ENDC    = '\033[0m'
    BOLD   = '\033[1m'
    OKBLUE = '\033[94m'
 
   
def print_pb(part, tot):
  pg_w= 20
  p=pg_w*part/tot
  
  n=part*100/tot
  sys.stdout.write("\r")
  sys.stdout.write("[")
  for i in range (0,pg_w):
    if i<=p:
      sys.stdout.write("#")
    else:      
      sys.stdout.write("-")
  
  sys.stdout.write(" %2d" % (n+1))
  sys.stdout.write("%")
  sys.stdout.write("]")
  sys.stdout.flush()
  return
 
def check_files (name_file, yesAll):
  if yesAll:
    return 1
  if os.path.isfile(name_file):
    print tcolors.ERROR + "[WARNING] File "+name_file+" already exist! \n\n\t  Overwrite? yes/all/No: "+ tcolors.ENDC,
  
    resp= raw_input()
    if (resp!="yes" and resp!="Yes" and resp != "Y"and resp != "y" and resp!="all" and resp!="a"):
      print tcolors.ERROR + "[WARNING] Writing aborted!\n"+ tcolors.ENDC
      sys.exit(0)
    if (resp=="all" or resp=="a"):
      return 1      
  return 0
  
  
  
def dec_to_short(num, qf):
    out=0
    
    temp1=num
    
    for i in range (1, qf+1):
      temp1*=2
      if temp1>=1:
        out+=pow(2,qf-i)
        temp2=int(temp1)
        temp1-=float(temp2)
    return out


def convert_float_to_short (data, data_type, qf): 
  if data_type == 'i':
    data_size = 32
  else:
    if data_type == 'h':
      data_size = 16
    else:
      data_size = 8 
  if data_size<qf:
    print (tcolors.ERROR + "[ERROR] QF is greater than data_size!\n"+ tcolors.ENDC)     
    print ("\t data_size: %d QF: %d\n" % (data_size, qf))
    sys.exit(2) 
  int_bit = data_size-qf-1
  min_val = -(2**int_bit-1)
  max_val = 2**int_bit
  
  val = float(data)
  
  if val>=0:
    integ = int(val)
    if integ>max_val:
      print (tcolors.ERROR + "[ERROR] Positive overflow occurred!\n"+ tcolors.ENDC)      
      print ("\t num: %f int: %d\n" % (data, integ))
      sys.exit(2)
    decim = dec_to_short (abs(val-integ), qf)
  else:
    integ = int(-math.ceil(abs(val)))
    if integ<min_val:
      print (tcolors.ERROR + "[ERROR] Negative overflow occurred!\n"+ tcolors.ENDC)      
      print ("\t num: %f int: %d\n" % (data, integ))
      sys.exit(2)
    if abs(val)-int(abs(val))==0:
      decim=dec_to_short(abs(val)-int(abs(val)), qf)
    else:
      decim=dec_to_short(1-(abs(val)-int(abs(val))), qf)
      
  return (integ<<qf)+decim

def convert_int_to_int_BUG (data, data_type_i, qf_i, data_type_o, qf_o):  
  if data_type_i == 'i':
    data_size_i = 32
  else:
    if data_type_i == 'h':
      data_size_i = 16
    else:
      data_size_i = 8 
  if data_type_o == 'i':
    data_size_o = 32
  else:
    if data_type_o == 'h':
      data_size_o = 16
    else:
      data_size_o = 8
  
  max_o= 2**(data_size_o-qf_o-1)-1
  integ = abs(data>>qf_i)
  
  if integ>max_o:
    print (tcolors.ERROR + "[ERROR] Positive overflow occurred!\n"+ tcolors.ENDC)      
    print ("\t num: %f int: %d max: %d\n" % (data, integ, max_o))
    sys.exit(2)
    
  decim= (data-(integ<<qf_i))>>(qf_i-qf_o)   
  
  return (integ<<qf_o)+decim 

def fixed2float(a, qf):
  return float(a) / (1<<qf)  
 
def checksum_fl(a, qf):
  s=0.0
  n=0
  for e in a:
    s=s+fixed2float(e, qf)
    n+=1
  return s, s/n
  
 
def convert_int_to_int (data, data_type_i, qf_i, data_type_o, qf_o):  
  if data_type_i == 'i':
    data_size_i = 32
  else:
    if data_type_i == 'h':
      data_size_i = 16
    else:
      data_size_i = 8 
  if data_type_o == 'i':
    data_size_o = 32
  else:
    if data_type_o == 'h':
      data_size_o = 16
    else:
      data_size_o = 8
  
  max_o= 2**(data_size_o-qf_o-1)-1
  integ = abs(data)>>qf_i
  #print integ
  
  if data>=0:
    s=1
  else:
    s=-1
  
  if integ>max_o:
    print (tcolors.ERROR + "[ERROR] Positive overflow occurred!\n"+ tcolors.ENDC)      
    print ("\t num: %f int: %d max: %d\n" % (data, integ, max_o))
    sys.exit(2)
    
  decim= ((abs(data)-(integ<<qf_i))>>(qf_i-qf_o))   
  
  
  #print decim 
  return s*((integ<<qf_o)+decim) 
 
  
def interlace(dest, src, WS, n):
  stride = 4
  gr = WS/stride
  
  for g in range (0, gr):
    print_pb(g, gr)
    for j in range (0, stride):
      for i in range (0, n/2):
        for px in range (0,2):
          dest[g*stride*n + j*2 + i*stride*2 + px] = src[g*stride*n + i*2 +j*n + px]
         # if g*stride*n + j*2 + i*stride*2 + px==1:
         #   print g, " ", j, " ",i, " ",px
         #   print g*stride*n + j + i*stride*2 + px, " ->", dest[g*stride*n + j + i*stride*2 + px]
         #   print g*stride*n + i*2 +j*n + px, " ->", src[g*stride*n + i*2 +j*n + px]
         #   print "----"
  return

def interlace_stride(dest, src, WS, n, stride): #n is the len 
  gr = WS/stride
  
  for g in range (0, gr):
    print_pb(g, gr)
    for j in range (0, stride):
      for i in range (0, n/2):
        for px in range (0,2):
          dest[g*stride*n + j*2 + i*stride*2 + px] = src[g*stride*n + i*2 +j*n + px]
         # if g*stride*n + j*2 + i*stride*2 + px==1:
         #   print g, " ", j, " ",i, " ",px
         #   print g*stride*n + j + i*stride*2 + px, " ->", dest[g*stride*n + j + i*stride*2 + px]
         #   print g*stride*n + i*2 +j*n + px, " ->", src[g*stride*n + i*2 +j*n + px]
         #   print "----"
  return  

def parse_settings (file_name):    
    
  settings={}
  with open(file_name, "r") as f:
      settings_raw = f.readlines()
  line =0
  for s in settings_raw:  
    line += 1
    if len(s.strip()):
      if s.strip()[0]!='#':
        if '#' in s.strip():
          s= s.strip()[0:s.find('#')].strip()
        if '=' in s.strip():
          if s.split("=")[1].strip().isdigit():
            settings[s.split("=")[0].strip()] = int(s.split("=")[1].strip())
          else:
            settings[s.split("=")[0].strip()] = s.split("=")[1].strip()
        else:
          print tcolors.ERROR + "[ERROR] assignment required!" + tcolors.ENDC
          print "\tin %s at line %d." %( file_name, line)
          sys.exit(1)
          
  return settings
