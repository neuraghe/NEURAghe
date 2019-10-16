#ifndef MAXPOOL_FP16_H
#define MAXPOOL_FP16_H

#include "types.h"

RET maxpool_fp16_forward(int16_t* input, int16_t* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

#endif
