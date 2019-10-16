#include "maxpool.h"
#include "xassert.h"

RET maxpool_forward_sw_core(DATA* input, DATA* output, SIZE in_s[3],
		SIZE out_s[3], SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

RET maxpool_forward(DATA* input, DATA* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]) {
	VARSIZE out_a[3] = { 0 };

	out_a[0] = in_s[0];
	out_a[1] = (in_s[1] + 2 * pad[0] - kern_s[0]) / stride[0] + 1;
	out_a[2] = (in_s[2] + 2 * pad[1] - kern_s[1]) / stride[1] + 1;

	ASSERT(equalSize(out_s, out_a, 3), "%s",
			"output size does not match parameterized pooling kernel");

	_tcreate_(time);
	maxpool_forward_sw_core(input, output, in_s, out_s, kern_s, stride, pad);
	_tprintf_("MaxPool time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET maxpool_forward_sw_core(DATA* input, DATA* output, SIZE in_s[3],
		SIZE out_s[3], SIZE kern_s[2], SIZE stride[2], SIZE pad[2]) {

	ITER plane = 0;
	ITER hout = 0;
	ITER wout = 0;
	ITER hkern = 0;
	ITER wkern = 0;
	ITER _stride0 = stride[0];
	ITER _stride1 = stride[1];
	ITER _of   = out_s[0];
	ITER _of_h = out_s[1];
	ITER _of_w = out_s[2];
	ITER _if   = in_s[0];
	ITER _if_h = in_s[1];
	ITER _if_w = in_s[2];
	ITER _k_h = kern_s[0];
	ITER _k_w = kern_s[1];
	ITER _pad_h = pad[0];
	ITER _pad_w = pad[1];
	
	int hin = 0;
	int win = 0;
	int cond = 0;

	DATA current = 0;
	DATA max = 0;

	/* for each plane */
	#pragma omp parallel for firstprivate(_stride0, _stride1, _of, _of_h, _of_w, _if, _if_h, _if_w, _k_h, _k_w, _pad_h, _pad_w) private(max, current, hout,wout,hkern,wkern,hin,win,cond) collapse(2)
	for (plane = 0; plane < _of; plane++) {

		/* for output matrix */
		for (hout = 0; hout < _of_h; hout++) {
			ITER of_h_idx = (plane*_of_h + hout)*_of_w;

			for (wout = 0; wout < _of_w; wout++) {
				bool first_element = true;

				/* for kernel matrix */
				for (hkern = 0; hkern < _k_h; hkern++) {
					/* calculate required input position */
					hin = _stride0 * hout + hkern - _pad_h;
					ITER if_h_idx = (plane*_if_h + hin)*_if_w;

					for (wkern = 0; wkern < _k_w; wkern++) {
						/* calculate required input position */
						win = _stride1 * wout + wkern - _pad_w;

						/* test if position is inside bounds*/
						cond = hin >=0 && win >= 0 && (ITER) win < _if_w && (ITER) hin < _if_h;

						/* if outside bounds => set to zero */
						DATA inVal;
						if (cond) {
							//inVal = in[plane][hin][win];
							inVal = input[if_h_idx + win];
						} else {
							inVal = 0;
						}

						current = inVal;
						
						if(first_element){
							max = current;
							first_element = false;
						} else {
							max = (max > current) ? max : current;
						}
					}
				}
				
				output[of_h_idx + wout] = max;
			}
		}
	}

	return OK;
}
