#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-
import os, sys
class tcolors:
    OK      = '\033[92m'
    WARNING = '\033[93m'
    ERROR   = '\033[91m'
    ENDC    = '\033[0m'
    BOLD   = '\033[1m'
    OKBLUE = '\033[94m'
    
print tcolors.OKBLUE+ tcolors.BOLD + "\t#########################"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t# Concat headers script #"+ tcolors.ENDC
print tcolors.OKBLUE+ tcolors.BOLD + "\t#########################\n"+ tcolors.ENDC
    
if len(sys.argv)<3:
  print tcolors.ERROR + "[ERROR] arguments missing!" + tcolors.ENDC
  print "This script concats all header files in path in one single file dest_file."
  print "usage: \n\tpython create_header.py src_path dest_file"
  sys.exit(1)
 

header_files = [sys.argv[1]+f for f in os.listdir(sys.argv[1]) if f[len(f)-2:]== '.h']

#print len(header_files)

if len(header_files):
  dest=open(sys.argv[2], "a")
  for file_name in header_files:
    print tcolors.OKBLUE+"file: " + file_name + tcolors.ENDC
    with open(file_name, "r") as f:
      #print ''.join(f.readlines())
      dest.write(''.join(f.readlines()))

  dest.close()
  print tcolors.OK+"Done!" + tcolors.ENDC
  print "\t" + sys.argv[2]
else:  
  print tcolors.WARNING + "No header file in path!" + tcolors.ENDC
