import struct
import os
import sys
import numpy as np
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-folder', dest='folder', type=str, required=False, help='folder path')
parser.add_argument('-file', dest='file', type=str, required=False, help='file path')
args = parser.parse_args()

if args.folder:
	for filename in os.listdir(args.folder):
		f = open(filename, 'r')
		a = np.fromfile(f, dtype=float)
		new_fn = filename + '.txt'
		np.savetxt(new_fn, a, fmt='%f')

if args.file:
        a = np.fromfile(os.path.expanduser(args.file), dtype='f')
	print(a[0])
        new_fn = args.file + '.txt'
        np.savetxt(new_fn, a, fmt='%f')


