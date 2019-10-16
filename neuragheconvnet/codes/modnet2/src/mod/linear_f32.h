#ifndef LINEAR_F32_H
#define LINEAR_F32_H

#include "types.h"

struct Linear_f32 {
	float* weights;
	float* bias;
	VARSIZE in_s;
	VARSIZE out_s;
};

typedef struct Linear_f32* LINEAR_F32;

LINEAR_F32 linear_f32_create(void);

RET linear_f32_init(LINEAR_F32 lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s);

RET linear_f32_forward(LINEAR_F32 lin, float* input, float* output, SIZE in_s,
		SIZE out_s);

RET linear_f32_destroy(LINEAR_F32 lin);

#endif
