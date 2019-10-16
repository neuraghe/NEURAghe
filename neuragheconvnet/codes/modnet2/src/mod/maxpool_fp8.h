#ifndef MAXPOOL_FP8_H
#define MAXPOOL_FP8_H

#include "types.h"

RET maxpool_fp8_forward(signed char* input, signed char* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

#endif
