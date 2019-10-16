#ifndef MAXPOOL_H
#define MAXPOOL_H

#include "types.h"

RET maxpool_forward(DATA* input, DATA* output, SIZE in_s[3], SIZE out_s[3],
		SIZE kern_s[2], SIZE stride[2], SIZE pad[2]);

#endif
