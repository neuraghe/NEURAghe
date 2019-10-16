""" Compare results """
import numpy as np

# TODO change path
tf = np.loadtxt('./data/scores')
vm = np.loadtxt('./data/VM_scores_FLOAT_noB_no7x7.txt')
vm_fixed = np.loadtxt('./data/VM_scores_FIXED_noB_no7x7.txt', np.int16)
vm_fpga = np.loadtxt('./data/VM_scores_FPGA_noB_no7x7.txt', np.int16)	
vm_7x7 = np.loadtxt('./data/VM_scores_FLOAT_noB_7x7as3x3.txt')
vm_7x7_fixed = np.loadtxt('./data/VM_scores_FIXED_noB_7x7as3x3.txt', np.int16)

diff = np.abs(tf - vm)
print(np.max(diff))
i = np.argmax(diff)
print('index', i)
print(tf[i], vm[i])
print('\npredicted')
print('tf                    ', np.argsort(tf)[-5:])
print('vm float noB no7x7    ', np.argsort(vm)[-5:])
print('vm fixed noB no7x7    ', np.argsort(vm_fixed)[-5:])
print('vm fpga noB no7x7     ', np.argsort(vm_fpga)[-5:])
print('vm float noB 7x7as3x3 ', np.argsort(vm_7x7)[-5:])
print('vm fixed noB 7x7as3x3 ', np.argsort(vm_7x7_fixed)[-5:])

vm_fixed = np.array(vm_fixed, dtype=float)
vm_fixed = vm_fixed*(2**-11)
vm_fpga = np.array(vm_fpga, dtype=float)
vm_fpga = vm_fpga*(2**-11)
vm_7x7_fixe = np.array(vm_7x7_fixed, dtype=float)
vm_7x7_fixed = vm_7x7_fixed*(2**-11)

np.set_printoptions(precision=7)

print('\nsorted')
print('tf                    ', ["{0:0.8f}".format(i) for i in sorted(tf)[-5:]])
print('vm float noB no7x7    ', ["{0:0.8f}".format(i) for i in sorted(vm)[-5:]])
print('vm fixed noB no7x7    ', ["{0:0.8f}".format(i) for i in sorted(vm_fixed)[-5:]])
print('vm fpga noB no7x7     ', ["{0:0.8f}".format(i) for i in sorted(vm_fpga)[-5:]])
print('vm float noB 7x7as3x3 ', ["{0:0.8f}".format(i) for i in sorted(vm_7x7)[-5:]])
print('vm fixed noB 7x7as3x3 ', ["{0:0.8f}".format(i) for i in sorted(vm_7x7_fixed)[-5:]])
