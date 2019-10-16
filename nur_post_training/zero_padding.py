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
import sys, math, ctypes

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
print tcolors.OKBLUE+ tcolors.BOLD + "\t# Zero-padding script #"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t##############################\n"+ tcolors.ENDC

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tzeropadding setting_file"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tzeropadding setting_file"
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

FS_half = (int)(FS/2)

IH_zp = IH+FS_half*2
IW_zp = IW+FS_half*2

with open(settings['in_feat_file'], "r") as f:
  px = f.readlines()
  
px = [int(i) for i in px]

#print px

px_zp= [0]*(IF*IH_zp*IW_zp)

p=0 

for inf in range (0, IF):
  #print "inf %d" % inf
  for h in range(0, IH_zp):
    #print " h %d" % h
    for w in range(0, IW_zp):
      #print "  w  %d" %w
      
      if h < (FS_half) or w <(FS_half) or h >= (IH+FS_half) or w >= (IW+FS_half):
        px_zp[inf*IH_zp*IW_zp + h*IW_zp + w] = 0;
      else:
        px_zp[inf*IH_zp*IW_zp + h*IW_zp + w] = px[p]
        p=p+1



#    _____ _ _                      _ _   _             
#   |  ___(_) | ___  __      ___ __(_) |_(_)_ __   __ _ 
#   | |_  | | |/ _ \ \ \ /\ / / '__| | __| | '_ \ / _` |
#   |  _| | | |  __/  \ V  V /| |  | | |_| | | | | (_| |
#   |_|   |_|_|\___|   \_/\_/ |_|  |_|\__|_|_| |_|\__, |
#                                                 |___/ 

yesAll=0

yesAll=check_files(settings['in_feat_file'] + "_zp",yesAll)


with open(settings['in_feat_file'] + "_zp", "w") as f:
  for p in px_zp:
    f.write("%d\n" % p)
    
print tcolors.OK + "[OK] Files successfully created!" + tcolors.ENDC
print "\t text file:   " + settings['in_feat_file'] + "_zp"      
