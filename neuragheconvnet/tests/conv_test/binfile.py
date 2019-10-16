import sys, math, ctypes, struct, json
from random import randint
from pt_lib import *

if len(sys.argv)==1:
    print tcolors.ERROR + "[ERROR] you must specify settings file!" + tcolors.ENDC
    print "usage: \n\tbinfile.py settings_file"
    sys.exit(1)
else:
  if len(sys.argv) == 2:
    settings_file = sys.argv[1]
  else:
    print tcolors.ERROR + "[ERROR] too many parameters!" + tcolors.ENDC
    print "usage: \n\tbinfile.py settings_file"
    sys.exit(1)


settings = parse_settings(settings_file)

FS    = settings["FS"]
FS_h  = settings['FS_h']
FS_w  = settings['FS_w']
IF    = settings['IF']
OF    = settings['OF']

filename_wei = settings['w_file']
filename_bi = settings['b_file']
  


datasize = 16



if datasize == 8:
  datatype = 'b'
if datasize == 16:
  datatype = 'h'
if datasize == 32:
  datatype = 'i'


bias = [0]*OF
for i in range (0, OF):
	bias[i] = 0x0;
	
valore_peso = 87

'''
weights =[0]*IF*OF*FS_h*FS_w
for i in range (0, OF):
  for j in range (0, IF):
     for k in range (0,FS_h*FS_w):
      #if k == FS_h*FS_w/2:
	      weights[k + j*FS_h*FS_w + i*IF*FS_h*FS_w] = k #j + i*IF #k #+ j*FS_h*FS_w + i*IF*FS_h*FS_w
'''

	
    #if(j==0):
      #weights[0 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso + i
      #weights[3 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso + i
      #weights[4 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso + i
      #weights[8 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso #+ i
      #weights[9 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso #+ i
      #weights[10 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso + i
      #weights[11 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso #+ i
      #weights[12 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso #+ i
      #weights[13 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso #+ i
      #weights[20 + j*FS_h*FS_w + i*IF*FS_h*FS_w] = valore_peso + i

#weights =[randint(-2**(datasize-1), 2**(datasize-1)-1) for i in range (0, IF*OF*FS_h*FS_w)]

weights =[randint(-10, 10) for i in range (0, IF*OF*FS_h*FS_w)]

#weights =[randint(-0x80, 0x7f) for i in range (0, IF*OF*FS_h*FS_w)]

#for i in range (0, OF):
#  for j in range (0, IF):
#     for k in range (0,FS_h*FS_w):
#	if(j>=IF/2 and i>=OF-4):
#		weights[k + j*FS_h*FS_w + i*IF*FS_h*FS_w] = randint(-10, 10)
#	else:
#		weights[k + j*FS_h*FS_w + i*IF*FS_h*FS_w] = 0
'''
weights =[0]*IF*OF*FS_h*FS_w

for i in range (0, OF):
  for j in range (0, IF):
     for k in range (0,FS_h*FS_w):
     	if(k==0):
		weights[k + j*FS_h*FS_w + i*IF*FS_h*FS_w] = 0x200
	else:
		weights[k + j*FS_h*FS_w + i*IF*FS_h*FS_w] = 0
	'''

#weights =[-128 for i in range (0, IF*OF*FS_h*FS_w)]

	
	

#print weights
with open(filename_wei, "wb") as f:
  for wb in weights:
    data=struct.pack(datatype, wb)
    f.write(data)

#print bias
with open(filename_bi, "wb") as f:
  for bi in bias:
    data=struct.pack(datatype, bi)
    f.write(data)
