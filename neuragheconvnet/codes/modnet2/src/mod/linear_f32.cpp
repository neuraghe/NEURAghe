#include "linear_f32.h"
#include "spatconv.h"
#include "xassert.h"


#ifdef _ARM_
#define ARM_QUAD_WORD_NEON

#include "arm_neon.h"
#ifdef ARM_QUAD_WORD_NEON
#define NEON_BLOCK 4
#else
#define NEON_BLOCK 2
#endif
#endif

static inline RET linear_f32_forward_sw_core(float* input, float* output, SIZE in_s, SIZE out_s,
		float* weights, float* bias) {

#ifdef _ARM_
	#pragma omp parallel for schedule(static)
	for (int hkern = 0; hkern < out_s; hkern+=NEON_BLOCK) {
#ifdef ARM_QUAD_WORD_NEON
        __builtin_prefetch (&weights[(hkern+0)*in_s], 0, 0);
        __builtin_prefetch (&weights[(hkern+1)*in_s], 0, 0);
        __builtin_prefetch (&weights[(hkern+2)*in_s], 0, 0);
        __builtin_prefetch (&weights[(hkern+3)*in_s], 0, 0);
        __builtin_prefetch (&input[0], 0, 3);

		float32x4_t mac_block0 = vmovq_n_f32(0.0);
		float32x4_t mac_block1 = vmovq_n_f32(0.0);
		float32x4_t mac_block2 = vmovq_n_f32(0.0);
		float32x4_t mac_block3 = vmovq_n_f32(0.0);

		for (int wkern = 0; wkern < in_s; wkern+=NEON_BLOCK){
			float32x4_t w_block0 = vld1q_f32(&weights[(hkern+0)*in_s + wkern]);
			float32x4_t w_block1 = vld1q_f32(&weights[(hkern+1)*in_s + wkern]);
			float32x4_t w_block2 = vld1q_f32(&weights[(hkern+2)*in_s + wkern]);
			float32x4_t w_block3 = vld1q_f32(&weights[(hkern+3)*in_s + wkern]);
			float32x4_t in       = vld1q_f32(&input[wkern]);
			
            __builtin_prefetch (&weights[(hkern+0)*in_s + wkern + NEON_BLOCK], 0, 0);
            __builtin_prefetch (&weights[(hkern+1)*in_s + wkern + NEON_BLOCK], 0, 0);
            __builtin_prefetch (&weights[(hkern+2)*in_s + wkern + NEON_BLOCK], 0, 0);
            __builtin_prefetch (&weights[(hkern+3)*in_s + wkern + NEON_BLOCK], 0, 0);
            __builtin_prefetch (&input[wkern + NEON_BLOCK], 0, 3);

			mac_block0 = vmlaq_f32(mac_block0, in, w_block0);
			mac_block1 = vmlaq_f32(mac_block1, in, w_block1);
			mac_block2 = vmlaq_f32(mac_block2, in, w_block2);
			mac_block3 = vmlaq_f32(mac_block3, in, w_block3);
		}
		float32x4_t bias_block     = vld1q_f32 (&bias[hkern]);
		float32x4_t mac_out_block  = vmovq_n_f32(0.0);
		
		//Reduction block 0
		float mac0 = 0.0f;
		mac0 += vgetq_lane_f32 (mac_block0, 0);
		mac0 += vgetq_lane_f32 (mac_block0, 1);
		mac0 += vgetq_lane_f32 (mac_block0, 2);
		mac0 += vgetq_lane_f32 (mac_block0, 3);
		mac_out_block = vsetq_lane_f32(mac0,mac_out_block,0);

		//Reduction block 1
		float mac1 = 0.0f;
		mac1 += vgetq_lane_f32 (mac_block1, 0);
		mac1 += vgetq_lane_f32 (mac_block1, 1);
		mac1 += vgetq_lane_f32 (mac_block1, 2);
		mac1 += vgetq_lane_f32 (mac_block1, 3);		
		mac_out_block = vsetq_lane_f32(mac1,mac_out_block,1);


		//Reduction block 0
		float mac2 = 0.0f;
		mac2 += vgetq_lane_f32 (mac_block2, 0);
		mac2 += vgetq_lane_f32 (mac_block2, 1);
		mac2 += vgetq_lane_f32 (mac_block2, 2);
		mac2 += vgetq_lane_f32 (mac_block2, 3);		
		mac_out_block = vsetq_lane_f32(mac2,mac_out_block,2);


		//Reduction block 0
		float mac3 = 0.0f;
		mac3 += vgetq_lane_f32 (mac_block3, 0);
		mac3 += vgetq_lane_f32 (mac_block3, 1);
		mac3 += vgetq_lane_f32 (mac_block3, 2);
		mac3 += vgetq_lane_f32 (mac_block3, 3);		
		mac_out_block = vsetq_lane_f32(mac3,mac_out_block,3);

		//Add Bias and store
		float32x4_t out_block = vaddq_f32(mac_out_block,bias_block);

		//Store
		vst1q_f32(&output[hkern], out_block);

#else
		float32x2_t mac_block0 = vmov_n_f32(0.0);
		float32x2_t mac_block1 = vmov_n_f32(0.0);

		for (int wkern = 0; wkern < in_s; wkern+=NEON_BLOCK){
			float32x2_t w_block0 = vld1_f32(&weights[(hkern+0)*in_s + wkern]);
			float32x2_t w_block1 = vld1_f32(&weights[(hkern+1)*in_s + wkern]);
			float32x2_t in       = vld1_f32(&input[wkern]);
			
			mac_block0 = vmla_f32(mac_block0, in, w_block0);
			mac_block1 = vmla_f32(mac_block1, in, w_block1);
		}

		float32x2_t bias_block     = vld1_f32 (&bias[hkern]);
		float32x2_t mac_out_block  = vmov_n_f32(0);
		
		//Reduction block 0
		float mac0 = 0.0f;
		mac0 += vget_lane_f32 (mac_block0, 0);
		mac0 += vget_lane_f32 (mac_block0, 1);
		mac_out_block = vset_lane_f32(mac0,mac_out_block,0);

		//Reduction block 1
		float mac1 = 0.0f;
		mac1 += vget_lane_f32 (mac_block1, 0);
		mac1 += vget_lane_f32 (mac_block1, 1);
		mac_out_block = vset_lane_f32(mac1,mac_out_block,1);

		//Add Bias and store
		float32x2_t out_block = vadd_f32(mac_out_block,bias_block);

		//Store
		vst1_f32(&output[hkern], out_block);		
#endif		
	}

#else
	
	ITER hkern = 0;
	ITER wkern = 0;
	float mac = 0.0;
	float current = 0.0;

	/* foreach row in kernel */
	#pragma omp parallel for private (hkern, wkern, mac, current)
	for (hkern = 0; hkern < out_s; hkern++) {

		mac = bias[hkern];

		for (wkern = 0; wkern < in_s; wkern++) {
			current = input[wkern];
			mac += current * weights[hkern*in_s + wkern];
		}
		output[hkern] = mac;
	}	
#endif
	return OK;
}

RET linear_f32_destroy(LINEAR_F32 lin) {
	free(lin->weights);
	free(lin->bias);
	free(lin);
	return OK;
}

LINEAR_F32 linear_f32_create(void) {
	LINEAR_F32 lin = (LINEAR_F32) calloc(1, sizeof(struct Linear_f32));
	return lin;
}

RET linear_f32_init(LINEAR_F32 lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s) {
	SIZE weight_s = out_s * in_s;
	SIZE bias_s = out_s;
	RET res = OK;

	lin->weights = (float*) calloc(weight_s, sizeof(float));
	lin->bias = (float*) calloc(bias_s, sizeof(float));

	res = load_f62tof32_from_file(lin->weights, weightsFile, weight_s);
	ASSERT(res == OK, "%s", "loading kernel tensor failed");

	res = load_f62tof32_from_file(lin->bias, biasFile, bias_s);
	ASSERT(res == OK, "%s", "loading bias tensor failed");

	lin->in_s = in_s;
	lin->out_s = out_s;
	return OK;
}

RET linear_f32_forward(LINEAR_F32 lin, float* input, float* output, SIZE in_s,
		SIZE out_s) {

	ASSERT(in_s == lin->in_s, "%s", "input size does not match");
	ASSERT(out_s == lin->out_s, "%s", "output size does not match");

	_tcreate_(time);
	linear_f32_forward_sw_core(input, output, in_s, out_s, lin->weights,
			lin->bias);
	_tprintf_("Fully-Connected time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}
