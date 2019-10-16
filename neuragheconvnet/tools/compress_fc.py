"""Compress a Fast R-CNN network using truncated SVD."""

import argparse
import numpy as np
import os, sys

def parse_args():
    """Parse input arguments."""
    parser = argparse.ArgumentParser(description='Compress a Fast R-CNN network')
    parser.add_argument('--in', dest='weights_file',
                        help='Fully-connected weights',
                        default=None, type=str)
    parser.add_argument('--dim', dest='weights_dim',
                        help='Fully-connected dimension <INxOUT>',
                        default='1x1', type=str)    
    parser.add_argument('--type', dest='type',
                        help='Weights format',
                        default='fp16', type=str)
    parser.add_argument('--sval', dest='sval',
                        help='Number of singular values to retain',
                        default=0, type=int)
    parser.add_argument('--QF', dest='QF',
                        help='Number of bits for fractional part',
                        default=11, type=int)

    if len(sys.argv) == 1:
        parser.print_help()
        sys.exit(1)

    args = parser.parse_args()
    return args

def compress_weights(W, l):
    """Compress the weight matrix W of an inner product (fully connected) layer
    using truncated SVD.
    Parameters:
    W: N x M weights matrix
    l: number of singular values to retain
    Returns:
    Ul, L: matrices such that W \approx Ul*L
    """

    # numpy doesn't seem to have a fast truncated SVD algorithm...
    # this could be faster
    U, s, V = np.linalg.svd(W, full_matrices=False)

    Ul = U[:, :l]
    sl = s[:l]
    Vl = V[:l, :]

    L = np.dot(np.diag(sl), Vl)
    return Ul, L

def main():
    args = parse_args()

    out0 = os.path.splitext(os.path.basename(args.weights_file))[0] + '_svd0'
    out1 = os.path.splitext(os.path.basename(args.weights_file))[0] + '_svd1'
    out_dir = os.path.dirname(args.weights_file)

    dim = list(map(int, args.weights_dim.split("x")))

    # Compress fc
    l_fc = args.sval

    # uncompressed weights
    if args.type == 'fp16':
        W = np.zeros((dim[0]*dim[1]), dtype='i2')
        W = np.fromfile(args.weights_file, dtype='i2')
        W = W / (2**args.QF)
    elif args.type == 'f32':
        W = np.zeros((dim[0]*dim[1]), dtype='f4')
        W = np.fromfile(args.weights_file, dtype='f4')
    elif args.type == 'd':
        W = np.zeros((dim[0]*dim[1]), dtype='f8')
        W = np.fromfile(args.weights_file, dtype='f8')
    else:
        raise RuntimeError('Type not supported')
    
    W = W.reshape(dim[0], dim[1])

    print('Compressing fc...')
    Ul_fc, L_fc = compress_weights(W, l_fc)

    print('Ul_fc', Ul_fc)
    print('l_fc', L_fc)

    if args.type == 'fp16':
        Ul_fc = Ul_fc * (2**args.QF)
        L_fc = L_fc * (2**args.QF)
        Ul_fc = (np.around(Ul_fc)).astype(np.int16)
        L_fc = (np.around(L_fc)).astype(np.int16)

    print('Ul_fc', Ul_fc)
    print('L_fc', L_fc)

    filename0 = '{}/{}'.format(out_dir, out0)
    filename1 = '{}/{}'.format(out_dir, out1)

    Ul_fc.tofile(filename0)
    L_fc.tofile(filename1)

    print('Wrote svd weights to: {} {}'.format(filename0, filename1))

if __name__ == '__main__':
    main()