#ifndef RELU_H
#define RELU_H

#include "types.h"

RET relu_forward(DATA* input, DATA* output, SIZE size[3]);
RET relu_f32_forward(float* input, float* output, SIZE size[3]);
RET relu_fp16_forward(int16_t* input, int16_t* output, SIZE size[3]);

#endif
