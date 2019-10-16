#ifndef MAXPOOL_F32_H
#define MAXPOOL_F32_H

#include "types.h"

RET maxpool_f32_forward(float* input, float* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

#endif
