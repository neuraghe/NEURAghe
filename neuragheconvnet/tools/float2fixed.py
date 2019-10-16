"""Convert weights from floating to fixed point"""

import argparse
import numpy as np
import os, sys

def parse_args():
    """Parse input arguments."""
    parser = argparse.ArgumentParser(description='Convert float weights to fixed-point format')
    parser.add_argument('--in', dest='float_folder',
                        help='Floating point weights folder',
                        default=None, type=str)
    parser.add_argument('--out', dest='fixed_folder',
                        help='Fixed point weights folder',
                        default=None, type=str)
    parser.add_argument('--type', dest='nb',
                        help='Float data bytes',
                        default=4, type=int)    
    parser.add_argument('--QF', dest='QF',
                        help='Number of bits for fractional part',
                        default=11, type=int)

    if len(sys.argv) == 1:
        parser.print_help()
        sys.exit(1)

    args = parser.parse_args()
    return args

def main():
    args = parse_args()

    data_type = 'f' + str(args.nb)
    
    for filename in os.listdir(args.float_folder):

        print(filename)
        float_val = np.fromfile(os.path.abspath(args.float_folder) + '/' + filename, dtype=data_type);

        float2fixed = float_val * 2**(args.QF)
        float2fixed = (np.around(float2fixed)).astype('int16')

        out_filename = '{}/{}'.format(os.path.abspath(args.fixed_folder), filename)

        float2fixed.tofile(out_filename)

        print('Wrote fixed weights to: {}'.format(out_filename))

if __name__ == '__main__':
    main()