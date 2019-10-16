#!/usr/bin/python
import sys
xil_ramloop_size=4096

print ("Generate readmemh commands")
if len(sys.argv)!=4:
  print ("usage: gen_redmemh.py mem_size word_size prefix")
  print ("sizes are in byte\n")
  sys.exit(1)

mem_size   = int(sys.argv[1])
word_size  = int(sys.argv[2])
mem_depth  = mem_size / word_size

prefix     = sys.argv[3]

l2_banks=mem_depth/xil_ramloop_size

with open("%s_readmem_%dx%d_ramloops.sv" % (prefix,l2_banks, word_size), "w") as f:
  f.write("task %s_readmem_%dx%d_ramloops;\n" % (prefix, l2_banks, word_size))
  for j in range (0, word_size):
    for i in range(0, l2_banks):      
      f.write('  $readmemh("slm_files/%s_mem_cut%d_%d.slm", `%s_BRAM_RAMLOOP(%d) );\n'%(prefix, i, j, prefix.upper(), j*l2_banks+i))
  f.write("endtask\n")
print ("Complete!\n")
