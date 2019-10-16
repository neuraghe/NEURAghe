#ifndef LINEAR_FP8_H
#define LINEAR_FP8_H

#include "types.h"

struct Linear_fp8 {
	signed char* weights;
	signed char* bias;
	VARSIZE in_s;
	VARSIZE out_s;
	int qf;
};

typedef struct Linear_fp8* LINEAR_FP8;

LINEAR_FP8 linear_fp8_create(void);

RET linear_fp8_init(LINEAR_FP8 lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s);

RET linear_fp8_forward(LINEAR_FP8 lin, signed char* input, signed char* output, SIZE in_s,
		SIZE out_s);

RET linear_fp8_destroy(LINEAR_FP8 lin);

#endif
