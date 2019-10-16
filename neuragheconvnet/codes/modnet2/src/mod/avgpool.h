#ifndef AVGPOOL_H
#define AVGPOOL_H

#include "types.h"

RET avgpool_forward(DATA* input, DATA* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf);

RET avgpool_f32_forward(float* input, float* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

RET avgpool_fp_16_forward(int16_t* input, int16_t* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2], int qf);

#endif
