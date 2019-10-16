#ifndef ADD_H
#define ADD_H

#include "types.h"

RET add_forward(DATA* inputA, DATA* inputB, DATA* output, SIZE size[3]);
RET add_fp16_forward(int16_t* inputA, int16_t* inputB, int16_t* output, SIZE size[3]);
RET add_f32_forward(float* inputA, float* inputB, float* output, SIZE size[3]);

RET add_forward_wR(DATA* inputA, DATA* inputB, DATA* output, SIZE size[3]);
RET add_fp16_forward_wR(int16_t* inputA, int16_t* inputB, int16_t* output, SIZE size[3]);
RET add_fp8_forward_wR(signed char* inputA, signed char* inputB, signed char* output, SIZE size[3]);
RET add_f32_forward_wR(float* inputA, float* inputB, float* output, SIZE size[3]);

#endif
