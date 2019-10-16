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
# File:           input_features.py                                               
# Description:    this script pre-processes the input features to be suitables for HWCE                               
#                                                                            
###################################################################

import os, sys

from pt_lib import *

def copy_w (dest, offset, src, n):
  for i in range(0, n):
    dest [offset+i]=src[i]
  return

def zeros_fill (dest, offset, n):
  for i in range (0, n):
    dest[offset+i]=0
  return

def round4_features (dest, src, in_f, feat_size):

  if_round=in_f/4
  if in_f%4>0:
    if_round+=1
  if_round=if_round*4

  for j in range(0, if_round):
	  if j<in_f:
		  copy_w(dest,j*feat_size, src[j*feat_size:], feat_size)
	
	  else:
		  zeros_fill(dest,j*feat_size,feat_size)
 
def round12_features (dest, src, in_f, feat_size):

  if_round=in_f/12
  if in_f%12>0:
    if_round+=1
  if_round=if_round*12

  for j in range(0, if_round):
	  if j<in_f:
		  copy_w(dest,j*feat_size, src[j*feat_size:], feat_size)
	
	  else:
		  zeros_fill(dest,j*feat_size,feat_size)
 


#**********************************
# ███╗   ███╗ █████╗ ██╗███╗   ██╗ 
# ████╗ ████║██╔══██╗██║████╗  ██║ 
# ██╔████╔██║███████║██║██╔██╗ ██║ 
# ██║╚██╔╝██║██╔══██║██║██║╚██╗██║ 
# ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║ 
# ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ 
#********************************** 

print tcolors.OKBLUE+ tcolors.BOLD + "\t##################################"  + tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t# Input features for test script #"  + tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t##################################\n"+ tcolors.ENDC

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tpython input_features.py path/settings_file.something"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tpython input_features.py path/settings_file"
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

IH=settings['IH']
IW=settings['IW']


with open(settings['in_feat_file'], "r") as f:
    l=len(f.readlines())
    if l != IF * IH * IW:
        print tcolors.ERROR + "[ERROR] uncorrect lenght of weight file!" + tcolors.ENDC
        print "\texpected: %d , given: %d" %( IF * IH * IW , l)
        sys.exit(1)

if FS==5:
  minIF=4
else:
  minIF=12
  
if_round=IF/minIF
if IF%minIF>0:
  if_round+=1
if_round=if_round*minIF


in_feat_zero  = [0]*(if_round*IH * IW)
in_feat_inter = [0]*(if_round*IH * IW)

with open(settings['in_feat_file'], "r") as f:
    in_feats = f.readlines()
    
print tcolors.OK + "[OK] Plain input features loaded!" + tcolors.ENDC
print "\t src: " + settings['in_feat_file']  + "\n"
    


if settings['float_inf']:
  in_feats = [convert_float_to_short(i) for i in in_feats]
  print tcolors.OK + "[OK] Convertion float to short done!\n" + tcolors.ENDC
else:
  in_feats = [int(i) for i in in_feats]
  
  
if FS==5:
  round4_features (in_feat_zero, in_feats, IF, IH * IW)
else:
  round12_features (in_feat_zero, in_feats, IF, IH * IW)

#    ___       _            _            _             
#   |_ _|_ __ | |_ ___ _ __| | __ _  ___(_)_ __   __ _ 
#    | || '_ \| __/ _ \ '__| |/ _` |/ __| | '_ \ / _` |
#    | || | | | ||  __/ |  | | (_| | (__| | | | | (_| |
#   |___|_| |_|\__\___|_|  |_|\__,_|\___|_|_| |_|\__, |
#                                                |___/ 

interlace(in_feat_inter, in_feat_zero,if_round, IH * IW)


#    _____ _ _                      _ _   _             
#   |  ___(_) | ___  __      ___ __(_) |_(_)_ __   __ _ 
#   | |_  | | |/ _ \ \ \ /\ / / '__| | __| | '_ \ / _` |
#   |  _| | | |  __/  \ V  V /| |  | | |_| | | | | (_| |
#   |_|   |_|_|\___|   \_/\_/ |_|  |_|\__|_|_| |_|\__, |
#                                                 |___/ 

yesAll=0

yesAll=check_files(settings['inf_dest_file'],yesAll)
with open(settings['inf_dest_file'], "w") as f:
  for inf in in_feat_inter:
    f.write("%d\n" % inf)

yesAll=check_files(settings['inf_dest_file_h'],yesAll)
with open(settings['inf_dest_file_h'], "w") as f:
    f.write("short int %s []={\n" %settings['inf_array_name'])
    for i in range (0,len(in_feat_inter)-1):
      f.write("%d,\n"%in_feat_inter[i])
    f.write("%d};\n"%in_feat_inter[len(in_feat_inter)-1])  
    
print tcolors.OK + "[OK] Files successfully created!" + tcolors.ENDC
print "\t text file:   " + settings['inf_dest_file']
print "\t header file: " + settings['inf_dest_file_h']
