#include "add.h"
#include "spatconv.h"


#ifdef _ARM_
#include "arm_neon.h"
#define NEON_BLOCK 4
#define MAX_NEG_FP16 (-32768)
#define MAX_NEG_F32  (1.175494351e-38F)
#endif

RET add_forward(DATA* inputA, DATA* inputB, DATA* output, SIZE size[3]) {
	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];
	
	_tcreate_(time);
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
		#ifdef _FIXED_
			output[i] = (DATA)saturate((int)inputA[i] + (int)inputB[i], "Add");
		#else
			output[i] = inputA[i] + inputB[i];
		#endif
	}
	_tprintf_("Add time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_fp16_forward(int16_t* inputA, int16_t* inputB, int16_t* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _ARM_
	#pragma omp parallel for schedule(static)
	for (i = 0; i < memsize; i+=NEON_BLOCK) {
		int16x4_t a = vld1_s16(&inputA[i]);
		int16x4_t b = vld1_s16(&inputB[i]);
	    __builtin_prefetch (&inputA[i + NEON_BLOCK], 0, 0);
        __builtin_prefetch (&inputB[i + NEON_BLOCK], 0, 0);

		int32x4_t cw = vaddl_s16(a,b);

		int32x4_t vMAX  = vdupq_n_s32(_MAX_);
		int32x4_t vMIN = vdupq_n_s32(_MIN_); //Because we do also RELU!

		/* staturate */
		cw = vminq_s32(cw,vMAX);
		cw = vmaxq_s32(cw,vMIN);

		/* narrowing */
		int16x4_t c = vmovn_s32(cw);

		/* store */
		vst1_s16(&output[i],c);
	}
#else
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
		output[i] = (DATA)saturate((int)inputA[i] + (int)inputB[i], "Add");

	}	
#endif
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_f32_forward(float* inputA, float* inputB, float* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _ARM_
	#pragma omp parallel for schedule(static)
	for (i = 0; i < memsize; i+=NEON_BLOCK) {
		float32x4_t a = vld1q_f32(&inputA[i]);
		float32x4_t b = vld1q_f32(&inputB[i]);
        __builtin_prefetch (&inputA[i + NEON_BLOCK], 0, 0);
        __builtin_prefetch (&inputB[i + NEON_BLOCK], 0, 0);		
		float32x4_t c = vaddq_f32(a,b);

		/* store */
		vst1q_f32(&output[i],c);
	}
#else
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
			output[i] = inputA[i] + inputB[i];
	}	
#endif
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_forward_wR(DATA* inputA, DATA* inputB, DATA* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _FIXED_
	int sum;
#else
	DATA sum;
#endif

#if (_ARM_ && _FIXED_)
	unsigned int *_inputA = (unsigned int*)inputA;
	unsigned int *_inputB = (unsigned int*)inputB;
	unsigned int *_output = (unsigned int*)output;
	
	#pragma omp parallel
	
	for (i = 0; i < memsize>>1; i++) {
		unsigned int SS = 0;
		unsigned int A = _inputA[i];
		unsigned int B = _inputB[i];
		short a  = (short) (A&0x0000FFFFU);
		short aa = (short) ((A&0xFFFF0000U)>>16);
		short b  = (short) (B&0x0000FFFFU);
		short bb = (short) ((B&0xFFFF0000U)>>16);
		a = (short)(saturate((int) (a + b), "Add"));
		a = a < 0 ? 0 : a;
		aa = (short)(saturate((int) (aa + bb), "Add"));
  		aa = aa < 0 ? 0 : aa;

		_output[i] = (unsigned int) a | ((unsigned int) aa)<<16;
	}
#else
	for (i = 0; i < memsize; i++) {
		#ifdef _FIXED_
			sum = (DATA)saturate((int)inputA[i] + (int)inputB[i], "Add");
		#else
			sum = inputA[i] + inputB[i];
		#endif
		output[i] = sum < 0 ? 0 : sum;
	}
#endif
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_fp16_forward_wR(int16_t* inputA, int16_t* inputB, int16_t* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _ARM_
	#pragma omp parallel for
	for (i = 0; i < memsize; i+=NEON_BLOCK) {
		int16x4_t a = vld1_s16(&inputA[i]);
		int16x4_t b = vld1_s16(&inputB[i]);
		int32x4_t cw = vaddl_s16(a,b);

		int32x4_t vMAX  = vdupq_n_s32(_MAX_);
		int32x4_t vZERO = vdupq_n_s32(0); //Because we do also RELU!

		/* RElu AND staturate */
		cw = vminq_s32(cw,vMAX);
		cw = vmaxq_s32(cw,vZERO);

		/* narrowing */
		int16x4_t c = vmovn_s32(cw);

		/* store */
		vst1_s16(&output[i],c);
	}
#else
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
		int32_t sum = inputA[i] + inputB[i];
		output[i] = sum < 0 ? 0 : sum;			
	}
#endif
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_fp8_forward_wR(signed char* inputA, signed char* inputB, signed char* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _ARMTODOOOO_
	#pragma omp parallel for
	for (i = 0; i < memsize; i+=NEON_BLOCK) {
		int16x4_t a = vld1_s16(&inputA[i]);
		int16x4_t b = vld1_s16(&inputB[i]);
		int32x4_t cw = vaddl_s16(a,b);

		int32x4_t vMAX  = vdupq_n_s32(_MAX_);
		int32x4_t vZERO = vdupq_n_s32(0); //Because we do also RELU!

		/* RElu AND staturate */
		cw = vminq_s32(cw,vMAX);
		cw = vmaxq_s32(cw,vZERO);

		/* narrowing */
		int16x4_t c = vmovn_s32(cw);

		/* store */
		vst1_s16(&output[i],c);
	}
#else
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
		int32_t sum = inputA[i] + inputB[i];
		output[i] = sum < 0 ? 0 : sum;			
	}
#endif
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET add_f32_forward_wR(float* inputA, float* inputB, float* output, SIZE size[3]) {
	_tcreate_(time);

	ITER i = 0;
	SIZE memsize = size[0] * size[1] * size[2];

#ifdef _ARM_	
	#pragma omp parallel for
	for (i = 0; i < memsize; i+=NEON_BLOCK) {
		float32x4_t a = vld1q_f32(&inputA[i]);
		float32x4_t b = vld1q_f32(&inputB[i]);
		float32x4_t c = vaddq_f32(a,b);
		float32x4_t vZERO = vdupq_n_f32(0);

		/* RElu */
		c = vmaxq_f32(c,vZERO);

		/* store */
		vst1q_f32(&output[i],c);
	}
#else
	#pragma omp parallel for
	for (i = 0; i < memsize; i++) {
		float sum = inputA[i] + inputB[i];
		output[i] = sum < 0 ? 0 : sum;			
	}
#endif	
	_tprintf_("Add+ReLU time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}
