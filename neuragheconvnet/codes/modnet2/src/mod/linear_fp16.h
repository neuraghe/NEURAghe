#ifndef LINEAR_FP16_H
#define LINEAR_FP16_H

#include "types.h"

struct Linear_fp16 {
	int16_t* weights;
	int16_t* bias;
	VARSIZE in_s;
	VARSIZE out_s;
	int qf;
};

typedef struct Linear_fp16* LINEAR_FP16;

LINEAR_FP16 linear_fp16_create(void);

RET linear_fp16_init(LINEAR_FP16 lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s);

RET linear_fp16_forward(LINEAR_FP16 lin, int16_t* input, int16_t* output, SIZE in_s,
		SIZE out_s);

RET linear_fp16_destroy(LINEAR_FP16 lin);

#endif
