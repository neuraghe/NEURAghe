import numpy as np
import os
import sys
import matplotlib.pyplot as plt
from natsort import natsorted, ns


MSE_arr = []
layer_arr = []
diff_arr = []

### CHECK WEIGHTS ###
#for filename in natsorted(os.listdir(sys.argv[1] + '/weights/'), key=lambda y: y.lower()):
#
#	print(filename)
#
#	fixed_val = (np.fromfile(sys.argv[2] + '/weights/' + filename, dtype='i2')).astype('float32');
#	float_val = np.fromfile(sys.argv[1] + '/weights/' + filename, dtype='f4');
#
#	fixed2float = fixed_val / 2**11
#
#	diff = fixed2float - float_val
#	np.savetxt('./diff/' + filename + '_DIFF', diff, newline='\n')
#
#	res = np.mean(diff**2)
#	print('MSE: ', res)
#	print('MAX: ', np.amax(diff))
#	print('MIN: ', np.amin(diff))
#
#	print('\n')
#
#	# np.set_printoptions(precision=6, linewidth=150, threshold=10)
#	# print('fixed_val  ', fixed_val);
#	# print('float_val  ', float_val);
#	# print('fixed2float', fixed2float)
#	# print('difference:', fixed2float - float_val)
#
#	# print('SAD: ', np.sum(np.abs(fixed2float - float_val)))
#	# print('SSD: ', np.sum(np.square(fixed2float - float_val)))
#	# print('standard deviation of fixed: ', np.std(fixed2float))
#	# print('standard deviation of float: ', np.std(float_val))
#	# print('correlation: ', np.corrcoef(np.array((fixed2float, float_val)))[0, 1])
#
#	MSE_arr.append(res)
#	layer_arr.append(filename)
#
#	diff_arr.append(diff)
#
#plt.figure()
#plt.subplot(211)
#
#xn = range(len(layer_arr))
#plt.bar(xn, MSE_arr)
#plt.xticks(xn, layer_arr, rotation=90)	
#
#plt.xlabel('weights')
#plt.ylabel('MSE')
#plt.title('Fixed vs Float (Image 0004)')

MSE_arr = []
layer_arr = []
diff_arr = []

### CHECK OUTPUTS ###
for filename in natsorted(os.listdir(sys.argv[1] + '/output/'), key=lambda y: y.lower()):

	print(filename)

	fixed_val = np.loadtxt(sys.argv[2] + '/output/' + filename + '_FIXED', dtype='float', delimiter='\n');
	float_val = np.loadtxt(sys.argv[1] + '/output/' + filename, dtype='float', delimiter='\n');

	fixed2float = fixed_val / 2**11

	diff = fixed2float - float_val
	np.savetxt('./diff/' + filename + '_DIFF', diff, newline='\n')

	res = np.mean(diff**2)
	print('MSE: ', res)
	print('MAX: ', np.amax(diff))
	print('MIN: ', np.amin(diff))

	print('\n')

	# np.set_printoptions(precision=6, linewidth=150, threshold=10)
	# print('fixed_val  ', fixed_val);
	# print('float_val  ', float_val);
	# print('fixed2float', fixed2float)
	# print('difference:', fixed2float - float_val)

	# print('SAD: ', np.sum(np.abs(fixed2float - float_val)))
	# print('SSD: ', np.sum(np.square(fixed2float - float_val)))
	# print('standard deviation of fixed: ', np.std(fixed2float))
	# print('standard deviation of float: ', np.std(float_val))
	# print('correlation: ', np.corrcoef(np.array((fixed2float, float_val)))[0, 1])

	MSE_arr.append(res)
	layer_arr.append(filename)

	diff_arr.append(diff)

# print('MSE_arr', MSE_arr)
# print('layer_arr', layer_arr)
# print(len(diff_arr))
# print(diff_arr)

# plt.subplot(212)
xn = range(len(layer_arr))
plt.bar(xn, MSE_arr)
plt.xticks(xn, layer_arr, rotation=90)	

plt.xlabel('layers')
plt.ylabel('MSE')
plt.title('Fixed vs Float (Image 0005)')

plt.figure()
j=1
for i in range(20, len(diff_arr)):
	plt.subplot(4, 3, j)
	plt.title('layer' + str(i))
	plt.plot(diff_arr[i])
	j+=1

plt.show()
