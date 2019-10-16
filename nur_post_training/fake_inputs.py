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
# File:           fake_inputs.py                                               
# Description:    this scripts, given a settings file, creates fake input features, weights and biases to be used in HWCE test.
#                 the user can writes the code for its own test file format.                               
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
print tcolors.OKBLUE+ tcolors.BOLD + "\t# Pixel-weights create script #"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t##############################\n"+ tcolors.ENDC

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tpython post_trainig.py path/settings_file.something"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tpython post_trainig.py path/settings_file"
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


yesAll=0

yesAll=check_files(settings['w_file'],yesAll)
#with open(settings['w_file'], "w") as f:
#  for o in range(0, OF):
#    for i in range(0, IF):    
#      for w in range(0, FS*FS):
#        if (w==i%6+o%3):
#          f.write("%d\n" % ((int)(0x100)))
#        else:
#          f.write("%d\n" % ((int)(0)))
        
        
#with open(settings['w_file'], "w") as f:
#  for o in range(0, OF):
#    for i in range(0, IF):    
#      for w in range(0, FS*FS):
#        if w==4:
#          f.write("%d\n" % (0x100))
#        else:
#          f.write("%d\n" % ((int)(o+i-w)))

#with open(settings['w_file'], "w") as f:
#  for o in range(0, OF):
#    for i in range(0, IF):    
#      for w in range(0, FS*FS):
#        f.write("%d\n" % ((o*IF+i)*16*16+w))

with open(settings['w_file'], "w") as f:
  for o in range(0, OF):
    for i in range(0, IF):    
      for w in range(0, FS*FS):
        f.write("%d\n" % (o*0x100 + i*0x1))



#with open(settings['w_file'], "w") as f:
#  for w in range(0, IF*OF*FS*FS):
#    #f.write("%d\n" % ((w%25)*16*16))
#    if (w%9==0):    
#      f.write("%d\n" % (0x2*16*16))
#    else:
#      if (w%9==5):
#        f.write("%d\n" % (0x1*16*16))
#      else:
#        if (w%9==7):
#          f.write("%d\n" % (0x3*16*16))
#        else:
#          f.write("%d\n" % (0))

yesAll=check_files(settings['b_file'],yesAll)
with open(settings['b_file'], "w") as f:
  for b in range(0, OF):
    f.write("%d\n" % (b*0x0100)) 
       
#with open(settings['b_file'], "w") as f:
#  for b in range(0, OF):
#    f.write("%d\n" % b)  

yesAll=check_files(settings['in_feat_file'],yesAll)
#with open(settings['in_feat_file'], "w") as f:
#  for i in range(0, IF):
#    for px in range(0, IH*IW):
#      f.write("%d\n" % ((px+i)%(IH*IW)))

#with open(settings['in_feat_file'], "w") as f:
#  for i in range(0, IF):
#    for px in range(0, IH*IW):
#      f.write("%d\n" % (i*16*16+(px)%(IH*IW)))
        
with open(settings['in_feat_file'], "w") as f:
  for i in range(0, IF):
    for px in range(0, IH*IW):
      f.write("%d\n" % (-i+(px)%(IH*IW)))
    
    #TODO diversi metodi di creazione
    
    
    
        
