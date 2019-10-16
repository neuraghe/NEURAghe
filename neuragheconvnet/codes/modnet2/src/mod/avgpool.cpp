#include "avgpool.h"

#include "xassert.h"

static inline RET avgpool_forward_sw_core(DATA* input, DATA* output, SIZE in_s[3],
		SIZE out_s[3], SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf) {
	ITER plane = 0;
	ITER hout = 0;
	ITER wout = 0;
	ITER hkern = 0;
	ITER wkern = 0;

	int hin = 0;
	int win = 0;
	int cond = 0;

	DATA current = 0;

#ifdef _FIXED_
	int avg = 0;
	int pooling_s = (kern_s[0] * kern_s[1]) << qf;
#else
	DATA avg = 0;
	SIZE pooling_s = kern_s[0] * kern_s[1];
#endif

	/* foreach plane */
	#pragma omp parallel for firstprivate(avg, current) private(hout,wout,hkern,wkern,hin,win,cond) collapse(2) if(0)
	for (plane = 0; plane < out_s[0]; plane++) {

		/* for output matrix */
		for (hout = 0; hout < out_s[1]; hout++) {
			for (wout = 0; wout < out_s[2]; wout++) {

				/* initialise maximum to zero */
				avg = 0;

				/* for kernel matrix */
				for (hkern = 0; hkern < kern_s[0]; hkern++) {
					for (wkern = 0; wkern < kern_s[1]; wkern++) {

						/* calculate required input position */
						hin = stride[0] * hout + hkern - pad[0];
						win = stride[1] * wout + wkern - pad[1];

						/* test if position is inside bounds*/
						cond = hin >= 0 && (ITER) hin < in_s[1] && win >= 0
								&& (ITER) win < in_s[2];

						/* if outside bounds => set to zero */
						if (cond) {
							current = input[(plane*in_s[1] + hin)*in_s[2] + win];
						} else {
							current = 0;
						}
						avg += current;

					}
				}

				#ifdef _FIXED_
					avg = (avg << qf) / pooling_s;
				#else
					avg = avg / pooling_s;
				#endif
				output[(plane*out_s[1] + hout)*out_s[2] + wout] = (DATA) avg;
			}
		}
	}
	return OK;
}

static inline RET avgpool_f32_forward_sw_core(float* input, float* output, SIZE in_s[3],
		SIZE out_s[3], SIZE kern_s[2], SIZE stride[2], SIZE pad[2]) {
	ITER plane = 0;
	ITER hout = 0;
	ITER wout = 0;
	ITER hkern = 0;
	ITER wkern = 0;

	int hin = 0;
	int win = 0;
	int cond = 0;

	float current = 0.0;
	float avg = 0.0;
	SIZE pooling_s = kern_s[0] * kern_s[1];

	/* foreach plane */
	#pragma omp parallel for firstprivate(avg, current) private(hout,wout,hkern,wkern,hin,win,cond) collapse(2) if(0)
	for (plane = 0; plane < out_s[0]; plane++) {

		/* for output matrix */
		for (hout = 0; hout < out_s[1]; hout++) {
			for (wout = 0; wout < out_s[2]; wout++) {

				/* initialise maximum to zero */
				avg = 0;

				/* for kernel matrix */
				for (hkern = 0; hkern < kern_s[0]; hkern++) {
					for (wkern = 0; wkern < kern_s[1]; wkern++) {

						/* calculate required input position */
						hin = stride[0] * hout + hkern - pad[0];
						win = stride[1] * wout + wkern - pad[1];

						/* test if position is inside bounds*/
						cond = hin >= 0 && (ITER) hin < in_s[1] && win >= 0
								&& (ITER) win < in_s[2];

						/* if outside bounds => set to zero */
						if (cond) {
							current = input[(plane*in_s[1] + hin)*in_s[2] + win];
						} else {
							current = 0;
						}
						avg += current;

					}
				}
				avg = avg / pooling_s;
				output[(plane*out_s[1] + hout)*out_s[2] + wout] = avg;
			}
		}
	}
	return OK;
}

static inline RET avgpool_fp16_forward_sw_core(int16_t* input, int16_t* output, SIZE in_s[3],
		SIZE out_s[3], SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf) {
	ITER plane = 0;
	ITER hout = 0;
	ITER wout = 0;
	ITER hkern = 0;
	ITER wkern = 0;

	int hin = 0;
	int win = 0;
	int cond = 0;

	int16_t current = 0;
	int avg = 0;
	int pooling_s = (kern_s[0] * kern_s[1]) << qf;

	/* foreach plane */
	#pragma omp parallel for firstprivate(avg, current) private(hout,wout,hkern,wkern,hin,win,cond) collapse(2) if(0)
	for (plane = 0; plane < out_s[0]; plane++) {

		/* for output matrix */
		for (hout = 0; hout < out_s[1]; hout++) {
			for (wout = 0; wout < out_s[2]; wout++) {

				/* initialise maximum to zero */
				avg = 0;

				/* for kernel matrix */
				for (hkern = 0; hkern < kern_s[0]; hkern++) {
					for (wkern = 0; wkern < kern_s[1]; wkern++) {

						/* calculate required input position */
						hin = stride[0] * hout + hkern - pad[0];
						win = stride[1] * wout + wkern - pad[1];

						/* test if position is inside bounds*/
						cond = hin >= 0 && (ITER) hin < in_s[1] && win >= 0
								&& (ITER) win < in_s[2];

						/* if outside bounds => set to zero */
						if (cond) {
							current = input[(plane*in_s[1] + hin)*in_s[2] + win];
						} else {
							current = 0;
						}
						avg += current;

					}
				}
				avg = (avg << qf) / pooling_s;
				output[(plane*out_s[1] + hout)*out_s[2] + wout] = avg;
			}
		}
	}
	return OK;
}

RET avgpool_forward(DATA* input, DATA* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf) {
	VARSIZE out_a[3] = { 0 };

	out_a[0] = in_s[0];
	out_a[1] = (in_s[1] + 2 * pad[0] - kern_s[0]) / stride[0] + 1;
	out_a[2] = (in_s[2] + 2 * pad[1] - kern_s[1]) / stride[1] + 1;

	ASSERT(equalSize(out_s, out_a, 3), "%s",
			"output size does not match parameterized pooling kernel");
	
	_tcreate_(time);
	avgpool_forward_sw_core(input, output, in_s, out_s, kern_s, stride, pad, qf);
	_tprintf_("AvgPool time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET avgpool_f32_forward(float* input, float* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]) {
	VARSIZE out_a[3] = { 0 };

	out_a[0] = in_s[0];
	out_a[1] = (in_s[1] + 2 * pad[0] - kern_s[0]) / stride[0] + 1;
	out_a[2] = (in_s[2] + 2 * pad[1] - kern_s[1]) / stride[1] + 1;

	ASSERT(equalSize(out_s, out_a, 3), "%s",
			"output size does not match parameterized pooling kernel");
	
	_tcreate_(time);
	avgpool_f32_forward_sw_core(input, output, in_s, out_s, kern_s, stride, pad);
	_tprintf_("AvgPool time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET avgpool_fp16_forward(int16_t* input, int16_t* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf) {
	VARSIZE out_a[3] = { 0 };

	out_a[0] = in_s[0];
	out_a[1] = (in_s[1] + 2 * pad[0] - kern_s[0]) / stride[0] + 1;
	out_a[2] = (in_s[2] + 2 * pad[1] - kern_s[1]) / stride[1] + 1;

	ASSERT(equalSize(out_s, out_a, 3), "%s",
			"output size does not match parameterized pooling kernel");
	
	_tcreate_(time);
	avgpool_fp16_forward_sw_core(input, output, in_s, out_s, kern_s, stride, pad, qf);
	_tprintf_("AvgPool time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}
