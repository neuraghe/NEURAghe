#include "linear.h"
#include "spatconv.h"
#include "xassert.h"

RET linear_forward_sw_core(DATA* input, DATA* output, SIZE in_s, SIZE out_s,
		DATA* weights, DATA* bias, int qf);

LINEAR linear_create(void) {
	LINEAR lin = (LINEAR) calloc(1, sizeof(struct Linear));
	return lin;
}

RET linear_init(LINEAR lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s) {
	SIZE weight_s = out_s * in_s;
	SIZE bias_s = out_s;
	RET res = OK;

	lin->weights = (DATA*) calloc(weight_s, sizeof(DATA));
	lin->bias = (DATA*) calloc(bias_s, sizeof(DATA));

	res = loadData(weightsFile, weight_s, lin->weights);
	ASSERT(res == OK, "%s", "loading kernel tensor failed");

	res = loadData(biasFile, bias_s, lin->bias);
	ASSERT(res == OK, "%s", "loading bias tensor failed");

	lin->in_s = in_s;
	lin->out_s = out_s;
	return OK;
}

RET linear_forward(LINEAR lin, DATA* input, DATA* output, SIZE in_s,
		SIZE out_s) {

	ASSERT(in_s == lin->in_s, "%s", "input size does not match");
	ASSERT(out_s == lin->out_s, "%s", "output size does not match");

	_tcreate_(time);
	linear_forward_sw_core(input, output, in_s, out_s, lin->weights,
			lin->bias, lin->qf);
	_tprintf_("Fully-Connected time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET linear_forward_sw_core(DATA* input, DATA* output, SIZE in_s, SIZE out_s,
		DATA* weights, DATA* bias, int qf) {

	// NOTE return W * x

	ITER hkern = 0;
	ITER wkern = 0;

#ifdef _FIXED_
	long long int mac = 0;
#else
	DATA mac = 0;
#endif

	DATA current = 0;

	/* foreach row in kernel */
	#pragma omp parallel for private (hkern, wkern, mac, current)
	for (hkern = 0; hkern < out_s; hkern++) {

	#ifdef _FIXED_
		mac = ((long long int)bias[hkern]) << qf;
	#else
		mac = bias[hkern]; 
	#endif
		
		for (wkern = 0; wkern < in_s; wkern++) {
			current = input[wkern];
			mac += current * weights[hkern*in_s + wkern];
		}



		#ifdef _FIXED_
			output[hkern] = (DATA)saturate(mac >> qf, "linear");
		#else
			output[hkern] = mac;
		#endif

	}

	return OK;
}

RET linear_destroy(LINEAR lin) {
	free(lin->weights);
	free(lin->bias);
	free(lin);
	return OK;
}
