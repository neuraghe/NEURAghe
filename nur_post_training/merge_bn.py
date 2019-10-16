#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-


###################################################################
#                                                                            
#          EOLAB @ DIEE - Università degli studi di Cagliari                 
#                      Via marengo 2 - 09123                                 
#                              Cagliari                                      
#                                                                            
#                                                                            
# Engineer:       Gianfranco Deriu - gian.deriu@gmail.com                    
#                                                                            
#                                                                            
# Project:        NURAGHE                                                    
# File:           zero_padding.py                                               
# Description:    this script adds to the input features stored in a file a pad of zeroes to implement software zero-padding                               
#                                                                            
###################################################################
import sys, math, ctypes,struct 

from pt_lib import *





#**********************************
# ███╗   ███╗ █████╗ ██╗███╗   ██╗ 
# ████╗ ████║██╔══██╗██║████╗  ██║ 
# ██╔████╔██║███████║██║██╔██╗ ██║ 
# ██║╚██╔╝██║██╔══██║██║██║╚██╗██║ 
# ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║ 
# ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ 
#********************************** 

print tcolors.OKBLUE+ tcolors.BOLD + "\t##############################"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t#       Merge BN script      #"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t##############################\n"+ tcolors.ENDC

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tmerge_bn setting_file"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tmerge_bn setting_file"
    sys.exit(1)
    
settings=settings_parsing(settings_file)
        
print tcolors.OK +"[OK] Settings read!"     + tcolors.ENDC
print "\t FS: %d" % settings['FS']  
print "\t IF: %d" % settings['IF']  
print "\t OF: %d\n" % settings['OF']
  
#print settings

FS = settings['FS']
IF = settings['IF']
OF = settings['OF']
maxOG = settings['maxOG']


IH = settings['IH']
IW = settings['IW']


out_path = "./merge_bn"
if not os.path.isdir(out_path):
  os.makedirs(out_path)
     

w            = [0]*(FS*FS*IF*OF)

b            = [0]*(OF)

nb_var            = [0]*(OF)
nb_mean            = [0]*(OF)
nb_bias            = [0]*(OF)
nb_wei            = [0]*(OF)

b_conv_nb            = [0]*(OF)
w_conv_nb            = [0]*(FS*FS*IF*OF)



w_file = settings['w_file']
b_file = settings['b_file']

if settings['in_binfile']==0:
  with open(w_file, "r") as f:
    lw=len(f.readlines())
  with open(b_file, "r") as f:
    lb=len(f.readlines())
else:  
  if settings['data_type'] == 'd' :  
    data_size=8
  else:
    if settings['data_type']=='f' or settings['data_type'] == 'i':
      data_size=4
    else:
      print tcolors.ERROR + "[ERROR] data_type error. It must be d, f or i" + tcolors.ENDC
      sys.exit(1)  
  lw = os.stat(w_file).st_size/data_size
  lb = os.stat(b_file).st_size/data_size

if 'out_binfile' not in settings:
  out_binfile = settings['in_binfile']
else:
  out_binfile = settings['out_binfile']
 
    
if settings['in_binfile']==0:
  with open(w_file, "r") as f:
      w = f.readlines()
      
  print tcolors.OK + "\t[OK] Plain text weights loaded!" + tcolors.ENDC
  print "\t src: " + w_file  + "\n"

  with open(b_file, "r") as f:
      b = f.readlines()

  print tcolors.OK + "\t[OK] Plain text biases loaded!" + tcolors.ENDC
  print "\t src: " + b_file  + "\n"
else:
  with open(w_file, "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)
        w[i]=d[0]
        i=i+1
        word = f.read(data_size)
  
  with open(settings['b_file'], "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)        
        b[i]=d[0]
        i=i+1
        word = f.read(data_size)
        
  with open(settings['nb_var_file'], "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)        
        nb_var[i]=d[0]
        i=i+1
        word = f.read(data_size)  
        
  with open(settings['nb_mean_file'], "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)        
        nb_mean[i]=d[0]
        i=i+1
        word = f.read(data_size) 
  
  with open(settings['nb_bias_file'], "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)        
        nb_bias[i]=d[0]
        i=i+1
        word = f.read(data_size)
        
  with open(settings['nb_wei_file'], "rb") as f:    
    word = f.read(data_size)
    i=0;
    while word != "":
        d= struct.unpack(settings['data_type'],word)        
        nb_wei[i]=d[0]
        i=i+1
        word = f.read(data_size)
        
        
yesAll=0
      
      
# BATCH NORMALIZATION ABSORPTION        
        
        
for o in range (0, OF):
  w_factor = nb_wei[o]/nb_var[o]
  b_offset = nb_bias[o] - nb_mean[o]*w_factor
  
  
  b_conv_nb[o] = b[o]*w_factor + b_offset
  
  if (o==10):
    
    print "w_factor %f" % w_factor
    print "nb_wei %f" % nb_wei[o]
    print "nb_var %f" % nb_var[o]
    print "nb_bias %f" % nb_bias[o]
    print "nb_mean %f" % nb_mean[o]
    print "b %f" % b[o]
    print "b_conv_nb %f" % b_conv_nb[o]
    print "b_offset %f" % b_offset
    
  
  for i in range (0, IF):    
    for wei in range (0, 9):
      w_conv_nb[o*IF*9 + i*9 + wei] = w[o*IF*9 + i*9 + wei] * w_factor
      if i==0 and o==0:
        print "w %f" % w[o*IF*9 + i*9 + wei]
        print "w_conv_nb %f" % w_conv_nb[o*IF*9 + i*9 + wei]
                
   
   
   
   
   
   
   
                

#    _____ _ _                      _ _   _             
#   |  ___(_) | ___  __      ___ __(_) |_(_)_ __   __ _ 
#   | |_  | | |/ _ \ \ \ /\ / / '__| | __| | '_ \ / _` |
#   |  _| | | |  __/  \ V  V /| |  | | |_| | | | | (_| |
#   |_|   |_|_|\___|   \_/\_/ |_|  |_|\__|_|_| |_|\__, |
#                                                 |___/ 


if out_binfile==1: 
  # bin file
  if w_file.rfind('/')>0:
    w_file= w_file[w_file.rfind('/')+1:]
  dest_file = out_path +"/"+ w_file 
  yesAll=check_files(dest_file,yesAll)
  with open(dest_file, "wb") as f:
    for wei in w_conv_nb:
      data=struct.pack('d', wei)
      f.write(data)
  
  if b_file.rfind('/')>0:
    b_file= b_file[b_file.rfind('/')+1:]
    
  dest_file = out_path +"/"+ b_file 
  yesAll=check_files(dest_file,yesAll)
  with open(dest_file, "wb") as f:
    for bia in b_conv_nb:
      data=struct.pack('d', bia)
      f.write(data)
else:
  # txt file
  yesAll=check_files(dest_file,yesAll)
  with open(dest_file, "w") as f:
    for wb in wb_subd:
      f.write("%d\n" % wb)    
  

print tcolors.OK + "\t[OK] Files successfully created!" + tcolors.ENDC
print "\t\t folder:   " + out_path
















