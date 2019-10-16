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
# File:                                                         
# Description:                               
#                                                                            
###################################################################

import sys, math, ctypes, struct
from pt_lib import *

def zeros_fill_5x5 (dest, offset, n, b): #FIXME
  for i in range (0, n):
    if i%n == n-1:
      dest[offset+i] =b
      #print "bias %d " % b
    else:
      dest[offset+i] =0
    
  return

def zeros_fill_3x3 (dest, offset, n): #FIXME
  for i in range (0, n):
    dest[offset+i] =0
    
  return

def dispose_weights_5x5 (w_disp, offset, w_lin, bias):
  for i in range (0, 25):
    w_disp[offset+i] = w_lin[i]
  
  w_disp[offset+25]= 0;
  w_disp[offset+26]= 0;
  w_disp[offset+27]= bias;
  return

def dispose_weights_3x3 (w_disp, offset, w_lin, bias):
  for i in range (0, 9):
    w_disp[offset+i] = w_lin[i]
      
  w_disp[offset+9]= bias;
  return
  
def copy_weights_3x3 (w_disp, offset, w_lin):
  for i in range (0, 9):
    w_disp[offset+i] = w_lin[i]
  return


def copy_w (dest, offset, src, n):
  for i in range(0, n):
    #print (offset+i)
  #  if src[i]==0xc000:
    #  print "%d" % i
      
    dest [offset+i]=src[i]
  return  
  

def subdivide (dest, src, IG, OG, maxOG, n):
  WS = IG*OG*4*4
  
 # IG= IF_r/4
 # OG= OF_r/4
  
  WG=WS/16
  if WS%16>0:
    WG+=1
  
  #print "maxOG: %d"%maxOG
  #print "n: %d"%n
  #print "WS: %d"%WS
  #print "WG: %d"%WG
  #print "IG: %d"%IG
  #print "OG: %d"%OG
  
  SG = OG/maxOG
  if OG%maxOG>0:
    SG+=1
  
 # print "SG: %d"%SG
  
#  for sg in range(0, SG):
#    print "sg: %d"%sg
#    for ig in range (0, IG):
#      print "  ig: %d"%ig
#      for col in range (0, 2): 
#        print "    col: %d"%col
#        GR=maxOG
#        if (sg+1)*maxOG>WG :
#          GR = WG-sg*maxOG
#        
#        #print "GR: %d"%GR
#        for g in range(0, GR): # WG
#          print "      g: %d"%g
#          for j in range (0,2): #half WG
#            print "        j: %d"%j
#            #copy_w (dest,(j+ g*2 + col*GR*2 + ig*2*GR*2 + sg*IG*2*GR*2)*4*n, src[(j*2*IG + g*4*IG + col*IG + ig + sg*IG*GR*2*2)*4*n:],n*4) #TODO GR or maxOG or prevGR?
#            copy_w (dest,(j+ g*4/2 + col*maxOG*4/2 + ig*2*maxOG*4/2 + sg*IG*2*maxOG*4/2)*4*n, src[(j*2*IG + g*4*IG + col*IG + ig + sg*IG*GR*2*2)*4*n:],n*4) #TODO GR or maxOG or prevGR?
#            
  
  #print "SG: %d" %SG
  #print "OG: %d" %OG
  #print "maxOG: %d" %maxOG
  #print "IG: %d" %IG
  for sg in range(0, SG):
    #print "sg: %d"%sg
    if OG>=(sg+1)*maxOG:
      GR=maxOG
    else:
      GR=OG-sg*maxOG
    #print "        GR: %d"%GR
    for og in range (0, GR):
      #print "  og: %d"%og
      for hwg in range (0, 2): 
        #print "    hwg: %d"%hwg          
        for row in range(0, 2): 
          #print "      row: %d"%row
          for ig in range (0,IG):
            sa = (sg*maxOG*2*2*IG + og*2*2*IG + hwg*2*IG + row*IG + ig)
            da = (sg*IG*maxOG*2*2 + ig*GR*2*2 + og*2 + row*GR*2 + hwg)
            
            #print "        ig: %d"%ig
            #print "        %d -> %d \n\n" %(sa,da)
            copy_w (dest,da*4*n, src[sa*4*n:],n*4)
  
  return


#**********************************
# ███╗   ███╗ █████╗ ██╗███╗   ██╗ 
# ████╗ ████║██╔══██╗██║████╗  ██║ 
# ██╔████╔██║███████║██║██╔██╗ ██║ 
# ██║╚██╔╝██║██╔══██║██║██║╚██╗██║ 
# ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║ 
# ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ 
#**********************************     


print tcolors.OKBLUE+ tcolors.BOLD + "\t########################"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t# Post-training script #"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t########################\n"+ tcolors.ENDC

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tpost_trainig settings_file.something"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tpost_trainig settings_file"
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


if 'binfile' not in settings:  
  print tcolors.ERROR + "[ERROR] binfile not defined! Add to setting files binfile = 0  # or 1" + tcolors.ENDC
  sys.exit(1)
  
if 'data_type' not in settings:
  print tcolors.ERROR + "[ERROR] data_type not defined! Add to setting files data_type = 'd'  # or f or i" + tcolors.ENDC
  sys.exit(1)
    
if FS==5:
  minIF=4
else:
  minIF=12
  
if_round=IF/minIF
if IF%minIF>0:
  if_round+=1
if_round=if_round*minIF

of_round=OF/4
if OF%4>0:
  of_round+=1

of_round=of_round*4

WS = if_round*4/minIF*of_round

IG=if_round/minIF
OG=of_round/4

w        = [0]*(FS*FS*IF*OF)
w_reversed        = [0]*(FS*FS*IF*OF)



with open(settings['w_file'], "r") as f:
  w = f.readlines()
  
w = [int(i) for i in w]      
print tcolors.OK + "[OK] Plain text weights loaded!" + tcolors.ENDC


l= len(w)
WG=(l/448)
  
print ("Len: %d" % l)
print ("WG: %d" % WG)
    

for i in range (0,WG):
  we_min=w[0]
  we_max=w[0]  
  s=0 
  for j in range (0,448):
    if w[i*448+j]<we_min:
      we_min=w[i*448+j]
    if w[i*448+j]>we_max:
      we_max=w[i*448+j]
    s=s+w[i*448+j]

  m=s/448
      

  print ("Max: %d" % we_max)
  print ("Min: %d" % we_min)
  print ("Avg: %d\n\n" % m)



