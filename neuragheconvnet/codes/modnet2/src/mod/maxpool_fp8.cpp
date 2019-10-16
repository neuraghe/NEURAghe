#include "maxpool_fp8.h"
#include "xassert.h"

#ifdef _ARM_
#define ARM_QUAD_WORD_NEON

#include "arm_neon.h"
#ifdef ARM_QUAD_WORD_NEON
#define NEON_BLOCK 4
#else
#define NEON_BLOCK 2
#endif
#define MAX_NEG_FP16 (-32768)
#define MAX_NEG_FP8 (-128)
//#define MAX_NEG_FP16  (1.175494351e-38F)
#endif

static inline RET maxpool_fp8_forward_sw_core(signed char* input, signed char* output, SIZE in_s[3],
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
	bool cond = 0;
	
	ASSERT((_k_h<=3 && _k_w<=3),"%s", "Error: we assume maxpool kernel size <=3");

	/* for each plane */
	#pragma omp parallel for \
			firstprivate(_stride0, _stride1, _of, _of_h, _of_w, _if, _if_h, _if_w, _k_h, _k_w, _pad_h, _pad_w) \
			private(hout,wout) \
			collapse(2)
	for (plane = 0; plane < _of; plane++) {

		/* for output matrix */
		for (hout = 0; hout < _of_h; hout++) {
			ITER of_h_idx = (plane*_of_h + hout)*_of_w;
#ifdef _ARM_TODOOOO_
			for (wout = 0; wout < _of_w; wout++) {
				int16x4_t row;
				int16x4_t tmp_max;
				int16x4_t max;
				int16x4_t vZERO = vmov_n_s16(0);

				int hin0 = _stride0 * hout + - _pad_h;
				int hin1 = _stride0 * hout + 1 - _pad_h;
				int hin2 = _stride0 * hout + 2 - _pad_h;
				int win  = _stride1 * wout + - _pad_w;

				if(hin0 < _if_h && hin0 >= 0){
					row = vld1_s16(&input[(plane*_if_h + hin0)*_if_w + win]);
					row = vset_lane_s16(MAX_NEG_FP16,row,3);
					if(win < 0)
						row = vset_lane_s16(0,row,0);
					if(win+2 < _if_w && _k_w < 3)
						row = vset_lane_s16(0,row,2);
					if(win+1 < _if_w  && _k_w < 2)
						row = vset_lane_s16(0,row,1);
					max = vpmax_s16(row, row);
					max = vpmax_s16(max, max);
				}
				else
					max = vZERO;

				if(_k_h > 1){
					if(hin1 < _if_h && hin1 >= 0)
					{
						row = vld1_s16(&input[(plane*_if_h + hin1)*_if_w + win]);
						row = vset_lane_s16(MAX_NEG_FP16,row,3);
						if(win < 0)
							row = vset_lane_s16(0,row,0);
						if(win+2 < _if_w && _k_w < 3)
							row = vset_lane_s16(0,row,2);
						if(win+1 < _if_w  && _k_w < 2)
							row = vset_lane_s16(0,row,1);
						tmp_max = vpmax_s16(row, row);
						tmp_max = vpmax_s16(tmp_max, tmp_max);

						/* merge on max */
						max = vpmax_s16(max, tmp_max);
						max = vpmax_s16(max, max);
					}
					else
					{
						max = vpmax_s16(max, vZERO);
						max = vpmax_s16(max, max);
					}
				}

				if(_k_h > 2){
					if(hin2 < _if_h && hin2 >= 0)
					{
						row = vld1_s16(&input[(plane*_if_h + hin2)*_if_w + win]);
						row = vset_lane_s16(MAX_NEG_FP16,row,3);
						if(win < 0)
							row = vset_lane_s16(0,row,0);
						if(win+2 < _if_w && _k_w < 3)
							row = vset_lane_s16(0,row,2);
						if(win+1 < _if_w  && _k_w < 2)
							row = vset_lane_s16(0,row,1);
						tmp_max = vpmax_s16(row, row);
						tmp_max = vpmax_s16(tmp_max, tmp_max);

						/* merge on max */
						max = vpmax_s16(max, tmp_max);
						max = vpmax_s16(max, max);
					}
					else
					{
						max = vpmax_s16(max, vZERO);
						max = vpmax_s16(max, max);
					}
				}

				max = vpmax_s16(max, max);
				output[of_h_idx + wout] = vget_lane_s16(max, 0);

			}
#else


			for (wout = 0; wout < _of_w; wout++) {
				bool first_element = true;
				signed char max=0;
				signed char current;
				
				/* for kernel matrix */
				for (hkern = 0; hkern < _k_h; hkern++) {
					/* calculate required input position */
					hin = _stride0 * hout + hkern - _pad_h;
					ITER if_h_idx = (plane*_if_h + hin)*_if_w;

					for (wkern = 0; wkern < _k_w; wkern++) {
						/* calculate required input position */
						int win = _stride1 * wout + wkern - _pad_w;

						/* test if position is inside bounds*/
						cond = hin >=0 && win >= 0 && (ITER) win < _if_w && (ITER) hin < _if_h;

						/* if outside bounds => set to zero */
						signed char inVal;
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
#endif			
		}
	}

	return OK;
}


RET maxpool_fp8_forward(signed char* input, signed char* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]) {
	VARSIZE out_a[3] = { 0 };

	out_a[0] = in_s[0];
	out_a[1] = (in_s[1] + 2 * pad[0] - kern_s[0]) / stride[0] + 1;
	out_a[2] = (in_s[2] + 2 * pad[1] - kern_s[1]) / stride[1] + 1;

	ASSERT(equalSize(out_s, out_a, 3), "%s",
			"output size does not match parameterized pooling kernel");

	_tcreate_(time);
	maxpool_fp8_forward_sw_core(input, output, in_s, out_s, kern_s, stride, pad);
	_tprintf_("MaxPool time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}
