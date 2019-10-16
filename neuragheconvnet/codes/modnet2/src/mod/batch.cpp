#include "batch.h"

#include "xassert.h"
#include "math.h"

#define EVALUATE 1

RET batch_forward_sw_core(DATA* input, DATA* output, SIZE size[3],
		DATA* weights, DATA* bias, DATA* running_mean, DATA* running_var, int qf);

BATCH batch_create(void) {
	BATCH bc = (BATCH) calloc(1, sizeof(struct Batch));
	return bc;
}

RET batch_forward(BATCH bc, DATA* input, DATA* output, SIZE size[3]) {
	ASSERT(size[0] == bc->pin, "%s", "input planes do not match");

	_tcreate_(time);
	batch_forward_sw_core(input, output, size, bc->weights, bc->bias,
			bc->mean, bc->var, bc->qf);
	_tprintf_("Batch time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET batch_init(BATCH bc, NAME weightsFile, NAME biasFile, NAME meanFile,
		NAME varFile, SIZE planes) {
	SIZE weight_s = planes;
	SIZE bias_s = planes;
	SIZE mean_s = planes;
	SIZE var_s = planes;
	RET res = OK;

	bc->weights = (DATA*) calloc(weight_s, sizeof(DATA));
	bc->bias = (DATA*) calloc(bias_s, sizeof(DATA));
	bc->mean = (DATA*) calloc(mean_s, sizeof(DATA));
	bc->var = (DATA*) calloc(var_s, sizeof(DATA));

	res = loadData(weightsFile, weight_s, bc->weights);
	ASSERT(res == OK, "%s", "loading kernel tensor failed");

	res = loadData(biasFile, bias_s, bc->bias);
	ASSERT(res == OK, "%s", "loading bias tensor failed");

	res = loadData(meanFile, mean_s, bc->mean);
	ASSERT(res == OK, "%s", "loading mean tensor failed");

	res = loadData(varFile, var_s, bc->var);
	ASSERT(res == OK, "%s", "loading var tensor failed");

	bc->pin = planes;
	return res;
}

RET batch_forward_sw_core(DATA* input, DATA* output, SIZE size[3],
		DATA* weights, DATA* bias, DATA* running_mean, DATA* running_var, int qf) {

	ITER pin = 0;
	ITER hin = 0;
	ITER win = 0;
	SIZE matrix_s = size[1] * size[1];
	DATA current = 0;

#ifdef _FIXED_
	long long int meanfree = 0;
	long long int stdDev = 0;
	long long int bi = 0;
#else
	DATA meanfree = 0;
	DATA stdDev = 0;
	DATA bi = 0;
#endif

	DATA mean = 0;
	DATA dev = 0;
	DATA squared = 0;
	DATA var = 0;
	DATA weight = 0;
	int evaluate = EVALUATE;


	for (pin = 0; pin < size[0]; pin++) {

		if (evaluate) {
			mean = running_mean[pin];
			var = running_var[pin];
		} else {
			mean = 0;
			squared = 0;
			for (hin = 0; hin < size[1]; hin++) {
				for (win = 0; win < size[2]; win++) {
					current = input[(pin*size[1] + hin)*size[2] + win]; //in[pin][hin][win];
					mean += current;
					squared += current * current;
				}
			}
			mean = mean / matrix_s;
			squared = squared / matrix_s;
			var = squared - mean * mean;
			var = var > 0 ? var : -var;
		}

		weight = weights[pin];
		
		#ifdef _FIXED_
			bi = ((long long int)(bias[pin])) << qf;
			dev = var;
		#else
			bi = bias[pin];
			dev = sqrt(var);
		#endif

		for (hin = 0; hin < size[1]; hin++) {
			for (win = 0; win < size[2]; win++) {
				current = input[(pin*size[1] + hin)*size[2] + win];
				//current = in[pin][hin][win];

				#ifdef _FIXED_
					meanfree = current - mean;
					stdDev = (meanfree << qf) / dev;
					output[(pin*size[1] + hin)*size[2] + win] = (DATA)(saturate((long long int)(((stdDev * weight) + bi) >> qf), "Batch"));
				#else
					meanfree = current - mean;
					stdDev = meanfree / (dev);
					output[(pin*size[1] + hin)*size[2] + win] = stdDev * weight + bi;
				#endif

			}
		}

	}
	return OK;
}

RET batch_destroy(BATCH bc) {
	free(bc->weights);
	free(bc->bias);
	free(bc->mean);
	free(bc->var);
	free(bc);
	return OK;
}
